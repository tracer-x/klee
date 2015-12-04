/*
 * ITree.cpp
 *
 *  Created on: Oct 15, 2015
 *      Author: felicia
 */

#include "ITree.h"

#include <klee/Expr.h>
#include <vector>

using namespace klee;


ConstraintList::ConstraintList(ref<Expr>& constraint) :
    constraint(constraint), tail(0) {}

ConstraintList::ConstraintList(ref<Expr>& constraint, ConstraintList *prev) :
    constraint(constraint), tail(prev) {}

ConstraintList::~ConstraintList() {
  delete tail;
}

ref<Expr> ConstraintList::car() const {
  return constraint;
}

ConstraintList *ConstraintList::cdr() const {
  return tail;
}

std::vector< ref<Expr> > ConstraintList::pack() const {
  std::vector< ref<Expr> > res;
  for (const ConstraintList *it = this; it != 0; it = it->tail) {
      res.push_back(it->constraint);
  }
  return res;
}

void ConstraintList::dump() {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void ConstraintList::print(llvm::raw_ostream& stream) {
  stream << "[";
  for (ConstraintList *it = this; it != 0; it = it->tail) {
      it->constraint->print(stream);
      if (it->tail != 0) stream << ",";
  }
  stream << "]";
}

SubsumptionTableEntry::SubsumptionTableEntry(ITreeNode *node) :
  programPoint(node->programPoint),
  interpolant(node->getInterpolant()) {}

SubsumptionTableEntry::~SubsumptionTableEntry() {}

bool SubsumptionTableEntry::subsumed(ITreeNode *state) {
  /// We simply return false for now
  return false;
}

void SubsumptionTableEntry::dump() const {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void SubsumptionTableEntry::print(llvm::raw_ostream &stream) const {
  stream << "------------ Subsumption Table Entry ------------\n";
  stream << "Program point = " << programPoint << "\n";
  stream << "interpolant = [";
  for (std::vector< ref<Expr> >::const_iterator it = interpolant.begin();
      it != interpolant.end(); it++) {
      it->get()->print(stream);
      if (it + 1 != interpolant.end()) {
	  stream << ",";
      }
  }
  stream << "]\n";
}

ITree::ITree(ExecutionState* _root) :
    currentINode(0),
    root(new ITreeNode(0, _root)) {}

ITree::~ITree() {}

void ITree::checkCurrentNodeSubsumption() {
  assert(currentINode != 0);

  for (std::vector<SubsumptionTableEntry>::iterator it = subsumptionTable.begin();
      it != subsumptionTable.end(); it++) {
      if (it->subsumed(currentINode)) {
	  currentINode->isSubsumed = true;
	  return;
      }
  }
}

std::vector<SubsumptionTableEntry> ITree::getStore() {
  return subsumptionTable;
}

void ITree::store(SubsumptionTableEntry subItem) {
  llvm::errs() << "TABLING: ";
  subItem.dump();
  llvm::errs() << "SIZE BEFORE: " << subsumptionTable.size() << "\n";
  subsumptionTable.push_back(subItem);
  llvm::errs() << "SIZE AFTER: " << subsumptionTable.size() << "\n";
}

bool ITree::isCurrentNodeSubsumed() {
  return currentINode? currentINode->isSubsumed : false;
}

void ITree::setCurrentINode(ITreeNode *node) {
  currentINode = node;
}

ITreeNode::ITreeNode(ITreeNode *_parent,
                     ExecutionState *_data)
: parent(_parent),
  left(0),
  right(0),
  programPoint(0),
  data(_data),
  isSubsumed(false) {

  constraintList = (_parent != 0) ? _parent->constraintList : 0;

  if (!(_data->constraints.empty())) {
      ref<Expr> lastConstraint = _data->constraints.back();
      if (constraintList == 0) {
	  constraintList = new ConstraintList(lastConstraint);
      } else if (constraintList->car().compare(lastConstraint) != 0) {
	  constraintList = new ConstraintList(lastConstraint, constraintList);
      }
  }
}

ITreeNode::~ITreeNode() {
  delete constraintList;
}

std::vector< ref<Expr> > ITreeNode::getInterpolant() const {
  return this->constraintList->pack();
}

void ITreeNode::correctNodeLocation(unsigned int programPoint) {
  this->programPoint = programPoint;
}

void ITreeNode::split(ExecutionState *leftData, ExecutionState *rightData) {
  assert (left == 0 && right == 0);
  leftData->itreeNode = left = new ITreeNode(this, leftData);
  rightData->itreeNode = right = new ITreeNode(this, rightData);
}

ITreeNode *ITreeNode::getParent() {
  return parent;
}

ITreeNode *ITreeNode::getLeft() {
  return left;
}

ITreeNode *ITreeNode::getRight() {
  return right;
}

void ITreeNode::dump() const {
  llvm::errs() << "\n------------------------- Root ITree --------------------------------\n";
  this->print(llvm::errs());
}

void ITreeNode::print(llvm::raw_ostream &stream) const {
  this->print(stream, 0);
}

void ITreeNode::print(llvm::raw_ostream &stream, const unsigned int tab_num) const {
  std::string tabs = make_tabs(tab_num);
  std::string tabs_next = tabs + "\t";

  stream << tabs << "ITreeNode\n";
  stream << tabs_next << "programPoint = " << programPoint << "\n";
  stream << tabs_next << "constraintList = ";
  if (constraintList == 0) {
      stream << "NULL";
  } else {
      constraintList->print(stream);
  }
  stream << "\n";

  stream << tabs_next << "Left:\n";
  if (!left) {
      stream << tabs_next << "NULL\n";
  } else {
      left->print(stream, tab_num + 1);
      stream << "\n";
  }
  stream << tabs_next << "Right:\n";
  if (!right) {
      stream << tabs_next << "NULL\n";
  } else {
      right->print(stream, tab_num + 1);
      stream << "\n";
  }
}


