; ModuleID = '/home/sanghu/TracerX/tracerx/test/regression/Output/2007-08-16-invalid-constant-value.c.tmp3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"!klee_is_symbolic(a)\00", align 1
@.str1 = private unnamed_addr constant [81 x i8] c"/home/sanghu/TracerX/tracerx/test/regression/2007-08-16-invalid-constant-value.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"add constant case: %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"sub constant case: %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str15 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %a = alloca i8, align 1
  %1 = call i32 (i8*, i64, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i8*, i64, ...)*)(i8* %a, i64 1) #6
  %2 = load i8* %a, align 1, !tbaa !121
  %3 = add i8 %2, -51
  %4 = call zeroext i16 @util_make_concat2(i8 zeroext %3, i8 zeroext -51) #6
  %5 = icmp eq i16 %4, -21555
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %0
  %7 = load i8* %a, align 1, !tbaa !121
  %8 = zext i8 %7 to i32
  %9 = call i32 (i32, ...)* bitcast (i32 (...)* @klee_is_symbolic to i32 (i32, ...)*)(i32 %8) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([81 x i8]* @.str1, i64 0, i64 0), i32 22, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7
  unreachable

; <label>:12                                      ; preds = %6
  %13 = load i8* %a, align 1, !tbaa !121
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %14) #6
  br label %16

; <label>:16                                      ; preds = %12, %0
  %17 = load i8* %a, align 1, !tbaa !121
  %18 = sub i8 11, %17
  %19 = call zeroext i16 @util_make_concat2(i8 zeroext %18, i8 zeroext -51) #6
  %20 = icmp eq i16 %19, -21555
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %16
  %22 = load i8* %a, align 1, !tbaa !121
  %23 = zext i8 %22 to i32
  %24 = call i32 (i32, ...)* bitcast (i32 (...)* @klee_is_symbolic to i32 (i32, ...)*)(i32 %23) #6
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %27, label %26

; <label>:26                                      ; preds = %21
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([81 x i8]* @.str1, i64 0, i64 0), i32 27, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7
  unreachable

; <label>:27                                      ; preds = %21
  %28 = load i8* %a, align 1, !tbaa !121
  %29 = zext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %29) #6
  br label %31

; <label>:31                                      ; preds = %27, %16
  ret i32 0
}

declare i32 @klee_make_symbolic(...) #1

declare i32 @klee_is_symbolic(...) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

define i32 @util_make_and_i1(i32 %a, i32 %b) {
  %a_i1 = icmp ne i32 %a, 0
  %b_i1 = icmp ne i32 %b, 0
  %res_i1 = and i1 %a_i1, %b_i1
  %res = zext i1 %res_i1 to i32
  ret i32 %res
}

define i32 @util_make_or_i1(i32 %a, i32 %b) {
  %a_i1 = icmp ne i32 %a, 0
  %b_i1 = icmp ne i32 %b, 0
  %res_i1 = or i1 %a_i1, %b_i1
  %res = zext i1 %res_i1 to i32
  ret i32 %res
}

define i16 @util_make_concat2(i8 %a, i8 %b) {
  %tmp = alloca i16
  %tmp8 = bitcast i16* %tmp to i8*
  %p0 = getelementptr i8* %tmp8, i32 0
  %p1 = getelementptr i8* %tmp8, i32 1
  store i8 %b, i8* %p0
  store i8 %a, i8* %p1
  %concat = load i16* %tmp
  ret i16 %concat
}

define i32 @util_make_concat4(i8 %a, i8 %b, i8 %c, i8 %d) {
  %tmp = alloca i32
  %tmp8 = bitcast i32* %tmp to i8*
  %p0 = getelementptr i8* %tmp8, i32 0
  %p1 = getelementptr i8* %tmp8, i32 1
  %p2 = getelementptr i8* %tmp8, i32 2
  %p3 = getelementptr i8* %tmp8, i32 3
  store i8 %d, i8* %p0
  store i8 %c, i8* %p1
  store i8 %b, i8* %p2
  store i8 %a, i8* %p3
  %concat = load i32* %tmp
  ret i32 %concat
}

define i64 @util_make_concat8(i8 %a, i8 %b, i8 %c, i8 %d, i8 %e, i8 %f, i8 %g, i8 %h) {
  %tmp = alloca i64
  %tmp8 = bitcast i64* %tmp to i8*
  %p0 = getelementptr i8* %tmp8, i32 0
  %p1 = getelementptr i8* %tmp8, i32 1
  %p2 = getelementptr i8* %tmp8, i32 2
  %p3 = getelementptr i8* %tmp8, i32 3
  %p4 = getelementptr i8* %tmp8, i32 4
  %p5 = getelementptr i8* %tmp8, i32 5
  %p6 = getelementptr i8* %tmp8, i32 6
  %p7 = getelementptr i8* %tmp8, i32 7
  store i8 %h, i8* %p0
  store i8 %g, i8* %p1
  store i8 %f, i8* %p2
  store i8 %e, i8* %p3
  store i8 %d, i8* %p4
  store i8 %c, i8* %p5
  store i8 %b, i8* %p6
  store i8 %a, i8* %p7
  %concat = load i64* %tmp
  ret i64 %concat
}

define i32 @util_make_select(i32 %cond, i32 %t, i32 %f) {
  %cond_i1 = icmp ne i32 %cond, 0
  %res = select i1 %cond_i1, i32 %t, i32 %f
  ret i32 %res
}

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #0 {
  %1 = icmp eq i64 %z, 0, !dbg !124
  br i1 %1, label %2, label %3, !dbg !124

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #8, !dbg !126
  unreachable, !dbg !126

; <label>:3                                       ; preds = %0
  ret void, !dbg !127
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #0 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !128
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %1, i64 4, i8* %name) #9, !dbg !128
  %2 = load i32* %x, align 4, !dbg !129, !tbaa !130
  ret i32 %2, !dbg !129
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #5

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #0 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !132
  br i1 %1, label %3, label %2, !dbg !132

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !134
  unreachable, !dbg !134

; <label>:3                                       ; preds = %0
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #0 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !137
  br i1 %1, label %3, label %2, !dbg !137

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !139
  unreachable, !dbg !139

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !140
  %5 = icmp eq i32 %4, %end, !dbg !140
  br i1 %5, label %21, label %6, !dbg !140

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !142
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %7, i64 4, i8* %name) #9, !dbg !142
  %8 = icmp eq i32 %start, 0, !dbg !144
  %9 = load i32* %x, align 4, !dbg !146, !tbaa !130
  br i1 %8, label %10, label %13, !dbg !144

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !146
  %12 = zext i1 %11 to i64, !dbg !146
  call void @klee_assume(i64 %12) #9, !dbg !146
  br label %19, !dbg !148

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !149
  %15 = zext i1 %14 to i64, !dbg !149
  call void @klee_assume(i64 %15) #9, !dbg !149
  %16 = load i32* %x, align 4, !dbg !151, !tbaa !130
  %17 = icmp slt i32 %16, %end, !dbg !151
  %18 = zext i1 %17 to i64, !dbg !151
  call void @klee_assume(i64 %18) #9, !dbg !151
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !152, !tbaa !130
  br label %21, !dbg !152

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !153
}

declare void @klee_assume(i64) #1

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 {
  %1 = icmp eq i64 %len, 0, !dbg !154
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !154

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !155
  %wide.load = load <16 x i8>* %3, align 1, !dbg !155
  %next.gep.sum279 = or i64 %index, 16, !dbg !155
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !155
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !155
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !155
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !155
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !155
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !155
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !155
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !155
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !156

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !154
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !155
  %12 = load i8* %src.03, align 1, !dbg !155, !tbaa !121
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !155
  store i8 %12, i8* %dest.02, align 1, !dbg !155, !tbaa !121
  %14 = icmp eq i64 %10, 0, !dbg !154
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !154, !llvm.loop !159

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !160
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #0 {
  %1 = icmp eq i8* %src, %dst, !dbg !161
  br i1 %1, label %.loopexit, label %2, !dbg !161

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !163
  br i1 %3, label %.preheader, label %18, !dbg !163

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !165
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !165

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !165
  %wide.load = load <16 x i8>* %6, align 1, !dbg !165
  %next.gep.sum586 = or i64 %index, 16, !dbg !165
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !165
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !165
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !165
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !165
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !165
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !165
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !165
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !165
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !167

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !165
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !165
  %15 = load i8* %b.04, align 1, !dbg !165, !tbaa !121
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !165
  store i8 %15, i8* %a.03, align 1, !dbg !165, !tbaa !121
  %17 = icmp eq i64 %13, 0, !dbg !165
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !165, !llvm.loop !168

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !169
  %20 = icmp eq i64 %count, 0, !dbg !171
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !171

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !172
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !169
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %bound1221 = icmp ule i8* %21, %dst
  %bound0220 = icmp ule i8* %22, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !171
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !171
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !171
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !171
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %.sum505 = add i64 %.sum440, -31, !dbg !171
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !171
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !171
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !171
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !171
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !171
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !171
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !171
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !171
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !171
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !173

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %33, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %35, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %32, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %32 = add i64 %.16, -1, !dbg !171
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !171
  %34 = load i8* %b.18, align 1, !dbg !171, !tbaa !121
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !171
  store i8 %34, i8* %a.17, align 1, !dbg !171, !tbaa !121
  %36 = icmp eq i64 %32, 0, !dbg !171
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !171, !llvm.loop !174

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !175
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 {
  %1 = icmp eq i64 %len, 0, !dbg !176
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !176

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !177
  %wide.load = load <16 x i8>* %3, align 1, !dbg !177
  %next.gep.sum280 = or i64 %index, 16, !dbg !177
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !177
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !177
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !177
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !177
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !177
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !177
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !177
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !177
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !178

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !176
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !177
  %12 = load i8* %src.03, align 1, !dbg !177, !tbaa !121
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !177
  store i8 %12, i8* %dest.02, align 1, !dbg !177, !tbaa !121
  %14 = icmp eq i64 %10, 0, !dbg !176
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !176, !llvm.loop !179

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !176

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !180
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #0 {
  %1 = icmp eq i64 %count, 0, !dbg !181
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !181

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !182
  br label %3, !dbg !181

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !181
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !182
  store volatile i8 %2, i8* %a.02, align 1, !dbg !182, !tbaa !121
  %6 = icmp eq i64 %4, 0, !dbg !181
  br i1 %6, label %._crit_edge, label %3, !dbg !181

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !183
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nobuiltin noreturn nounwind }
attributes #9 = { nobuiltin nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !13, !28, !40, !53, !73, !88, !103}
!llvm.module.flags = !{!119, !120}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{i32 786449, metadata !2, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sa
!2 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!3 = metadata !{i32 0}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, metadata !6, metadata !7, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !8, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null, nu
!6 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!7 = metadata !{i32 786473, metadata !6}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!8 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !9, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = metadata !{null, metadata !10}
!10 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786689, metadata !5, metadata !"z", metadata !7, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!13 = metadata !{i32 786449, metadata !14, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !15, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!14 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786478, metadata !17, metadata !18, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !25, i32 13} ; [ 
!17 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!18 = metadata !{i32 786473, metadata !17}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !22}
!21 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!24 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!25 = metadata !{metadata !26, metadata !27}
!26 = metadata !{i32 786689, metadata !16, metadata !"name", metadata !18, i32 16777229, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!27 = metadata !{i32 786688, metadata !16, metadata !"x", metadata !18, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!28 = metadata !{i32 786449, metadata !29, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !30, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!29 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786478, metadata !32, metadata !33, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!32 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!33 = metadata !{i32 786473, metadata !32}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{null, metadata !36, metadata !36}
!36 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!37 = metadata !{metadata !38, metadata !39}
!38 = metadata !{i32 786689, metadata !31, metadata !"bitWidth", metadata !33, i32 16777236, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!39 = metadata !{i32 786689, metadata !31, metadata !"shift", metadata !33, i32 33554452, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!40 = metadata !{i32 786449, metadata !41, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !42, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!41 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786478, metadata !44, metadata !45, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!44 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!45 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !21, metadata !21, metadata !21, metadata !22}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52}
!49 = metadata !{i32 786689, metadata !43, metadata !"start", metadata !45, i32 16777229, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!50 = metadata !{i32 786689, metadata !43, metadata !"end", metadata !45, i32 33554445, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!51 = metadata !{i32 786689, metadata !43, metadata !"name", metadata !45, i32 50331661, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!52 = metadata !{i32 786688, metadata !43, metadata !"x", metadata !45, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!53 = metadata !{i32 786449, metadata !54, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !55, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!54 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 786478, metadata !57, metadata !58, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !66, i32 12} 
!57 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!58 = metadata !{i32 786473, metadata !57}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !61, metadata !61, metadata !62, metadata !64}
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!63 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{i32 786454, metadata !57, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!65 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !70, metadata !72}
!67 = metadata !{i32 786689, metadata !56, metadata !"destaddr", metadata !58, i32 16777228, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!68 = metadata !{i32 786689, metadata !56, metadata !"srcaddr", metadata !58, i32 33554444, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!69 = metadata !{i32 786689, metadata !56, metadata !"len", metadata !58, i32 50331660, metadata !64, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!70 = metadata !{i32 786688, metadata !56, metadata !"dest", metadata !58, i32 13, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!71 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!72 = metadata !{i32 786688, metadata !56, metadata !"src", metadata !58, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!73 = metadata !{i32 786449, metadata !74, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !75, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!74 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786478, metadata !77, metadata !78, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !82, i32 1
!77 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!78 = metadata !{i32 786473, metadata !77}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !61, metadata !61, metadata !62, metadata !81}
!81 = metadata !{i32 786454, metadata !77, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!82 = metadata !{metadata !83, metadata !84, metadata !85, metadata !86, metadata !87}
!83 = metadata !{i32 786689, metadata !76, metadata !"dst", metadata !78, i32 16777228, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!84 = metadata !{i32 786689, metadata !76, metadata !"src", metadata !78, i32 33554444, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!85 = metadata !{i32 786689, metadata !76, metadata !"count", metadata !78, i32 50331660, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!86 = metadata !{i32 786688, metadata !76, metadata !"a", metadata !78, i32 13, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!87 = metadata !{i32 786688, metadata !76, metadata !"b", metadata !78, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !90, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!89 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !92, metadata !93, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !97, i32 1
!92 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!93 = metadata !{i32 786473, metadata !92}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!94 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !61, metadata !61, metadata !62, metadata !96}
!96 = metadata !{i32 786454, metadata !92, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!97 = metadata !{metadata !98, metadata !99, metadata !100, metadata !101, metadata !102}
!98 = metadata !{i32 786689, metadata !91, metadata !"destaddr", metadata !93, i32 16777227, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!99 = metadata !{i32 786689, metadata !91, metadata !"srcaddr", metadata !93, i32 33554443, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!100 = metadata !{i32 786689, metadata !91, metadata !"len", metadata !93, i32 50331659, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!101 = metadata !{i32 786688, metadata !91, metadata !"dest", metadata !93, i32 12, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!102 = metadata !{i32 786688, metadata !91, metadata !"src", metadata !93, i32 13, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!103 = metadata !{i32 786449, metadata !104, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !105, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!104 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786478, metadata !107, metadata !108, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !109, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !112, i32
!107 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!108 = metadata !{i32 786473, metadata !107}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!109 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{metadata !61, metadata !61, metadata !21, metadata !111}
!111 = metadata !{i32 786454, metadata !107, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!112 = metadata !{metadata !113, metadata !114, metadata !115, metadata !116}
!113 = metadata !{i32 786689, metadata !106, metadata !"dst", metadata !108, i32 16777227, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!114 = metadata !{i32 786689, metadata !106, metadata !"s", metadata !108, i32 33554443, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!115 = metadata !{i32 786689, metadata !106, metadata !"count", metadata !108, i32 50331659, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!116 = metadata !{i32 786688, metadata !106, metadata !"a", metadata !108, i32 12, metadata !117, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!117 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !118} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!118 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!119 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!120 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!121 = metadata !{metadata !122, metadata !122, i64 0}
!122 = metadata !{metadata !"omnipotent char", metadata !123, i64 0}
!123 = metadata !{metadata !"Simple C/C++ TBAA"}
!124 = metadata !{i32 13, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !6, metadata !5, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!126 = metadata !{i32 14, i32 0, metadata !125, null}
!127 = metadata !{i32 15, i32 0, metadata !5, null}
!128 = metadata !{i32 15, i32 0, metadata !16, null}
!129 = metadata !{i32 16, i32 0, metadata !16, null}
!130 = metadata !{metadata !131, metadata !131, i64 0}
!131 = metadata !{metadata !"int", metadata !122, i64 0}
!132 = metadata !{i32 21, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !32, metadata !31, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!134 = metadata !{i32 27, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !32, metadata !133, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!136 = metadata !{i32 29, i32 0, metadata !31, null}
!137 = metadata !{i32 16, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !44, metadata !43, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!139 = metadata !{i32 17, i32 0, metadata !138, null}
!140 = metadata !{i32 19, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !44, metadata !43, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!142 = metadata !{i32 22, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !44, metadata !141, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!144 = metadata !{i32 25, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !44, metadata !143, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!146 = metadata !{i32 26, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !44, metadata !145, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!148 = metadata !{i32 27, i32 0, metadata !147, null}
!149 = metadata !{i32 28, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !44, metadata !145, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!151 = metadata !{i32 29, i32 0, metadata !150, null}
!152 = metadata !{i32 32, i32 0, metadata !143, null}
!153 = metadata !{i32 34, i32 0, metadata !43, null}
!154 = metadata !{i32 16, i32 0, metadata !56, null}
!155 = metadata !{i32 17, i32 0, metadata !56, null}
!156 = metadata !{metadata !156, metadata !157, metadata !158}
!157 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!158 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!159 = metadata !{metadata !159, metadata !157, metadata !158}
!160 = metadata !{i32 18, i32 0, metadata !56, null}
!161 = metadata !{i32 16, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !77, metadata !76, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!163 = metadata !{i32 19, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !77, metadata !76, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!165 = metadata !{i32 20, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !77, metadata !164, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!167 = metadata !{metadata !167, metadata !157, metadata !158}
!168 = metadata !{metadata !168, metadata !157, metadata !158}
!169 = metadata !{i32 22, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !77, metadata !164, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!171 = metadata !{i32 24, i32 0, metadata !170, null}
!172 = metadata !{i32 23, i32 0, metadata !170, null}
!173 = metadata !{metadata !173, metadata !157, metadata !158}
!174 = metadata !{metadata !174, metadata !157, metadata !158}
!175 = metadata !{i32 28, i32 0, metadata !76, null}
!176 = metadata !{i32 15, i32 0, metadata !91, null}
!177 = metadata !{i32 16, i32 0, metadata !91, null}
!178 = metadata !{metadata !178, metadata !157, metadata !158}
!179 = metadata !{metadata !179, metadata !157, metadata !158}
!180 = metadata !{i32 17, i32 0, metadata !91, null}
!181 = metadata !{i32 13, i32 0, metadata !106, null}
!182 = metadata !{i32 14, i32 0, metadata !106, null}
!183 = metadata !{i32 15, i32 0, metadata !106, null}
