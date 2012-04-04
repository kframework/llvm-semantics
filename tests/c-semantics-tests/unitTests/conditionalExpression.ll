; ModuleID = '/home/david/src/c-semantics/tests/unitTests/conditionalExpression.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32 }
%union.U = type { i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.S, align 4
  %s2 = alloca %struct.S, align 4
  %u1 = alloca %union.U, align 4
  %u2 = alloca %union.U, align 4
  %foo = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %s1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 8, i32 4, i1 false)
  %1 = bitcast %struct.S* %s2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 8, i32 4, i1 false)
  %2 = bitcast %union.U* %u1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 4, i32 4, i1 false)
  %3 = bitcast %union.U* %u2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4, i32 4, i1 false)
  store i32 5, i32* %foo, align 4
  store i32 5, i32* %a, align 4
  store i32 6, i32* %b, align 4
  %4 = load i32* %foo, align 4
  %tobool = icmp ne i32 %4, 0
  %cond = select i1 %tobool, i32 5, i32 6
  %5 = load i32* %foo, align 4
  %tobool1 = icmp ne i32 %5, 0
  %cond2 = select i1 %tobool1, float 5.000000e+00, float 6.000000e+00
  %6 = load i32* %foo, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %7 = load i32* %foo, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.end
  br label %cond.end7

cond.false6:                                      ; preds = %cond.end
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %8 = load i32* %foo, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.end7
  br label %cond.end11

cond.false10:                                     ; preds = %cond.end7
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %9 = load i32* %foo, align 4
  %tobool12 = icmp ne i32 %9, 0
  br i1 %tobool12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %cond.end11
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end11
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi i32* [ %a, %cond.true13 ], [ %b, %cond.false14 ]
  %10 = load i32* %foo, align 4
  %tobool17 = icmp ne i32 %10, 0
  br i1 %tobool17, label %cond.true18, label %cond.false19

cond.true18:                                      ; preds = %cond.end15
  br label %cond.end20

cond.false19:                                     ; preds = %cond.end15
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true18
  %cond21 = phi i32* [ %a, %cond.true18 ], [ %b, %cond.false19 ]
  %11 = load i32* %foo, align 4
  %tobool22 = icmp ne i32 %11, 0
  br i1 %tobool22, label %cond.true23, label %cond.false24

cond.true23:                                      ; preds = %cond.end20
  br label %cond.end25

cond.false24:                                     ; preds = %cond.end20
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.true23
  %cond26 = phi i32* [ %a, %cond.true23 ], [ null, %cond.false24 ]
  %12 = load i32* %foo, align 4
  %tobool27 = icmp ne i32 %12, 0
  br i1 %tobool27, label %cond.true28, label %cond.false29

cond.true28:                                      ; preds = %cond.end25
  br label %cond.end30

cond.false29:                                     ; preds = %cond.end25
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false29, %cond.true28
  %cond31 = phi i32* [ null, %cond.true28 ], [ %a, %cond.false29 ]
  %13 = load i32* %foo, align 4
  %tobool32 = icmp ne i32 %13, 0
  br i1 %tobool32, label %cond.true33, label %cond.false34

cond.true33:                                      ; preds = %cond.end30
  %14 = bitcast i32* %a to i8*
  br label %cond.end35

cond.false34:                                     ; preds = %cond.end30
  %15 = bitcast i32* %b to i8*
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true33
  %cond36 = phi i8* [ %14, %cond.true33 ], [ %15, %cond.false34 ]
  %16 = load i32* %foo, align 4
  %tobool37 = icmp ne i32 %16, 0
  br i1 %tobool37, label %cond.true38, label %cond.false39

cond.true38:                                      ; preds = %cond.end35
  %17 = bitcast i32* %a to i8*
  br label %cond.end40

cond.false39:                                     ; preds = %cond.end35
  %18 = bitcast i32* %b to i8*
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false39, %cond.true38
  %cond41 = phi i8* [ %17, %cond.true38 ], [ %18, %cond.false39 ]
  %19 = load i32* %foo, align 4
  %tobool42 = icmp ne i32 %19, 0
  br i1 %tobool42, label %cond.true43, label %cond.false44

cond.true43:                                      ; preds = %cond.end40
  %20 = bitcast i32* %a to i8*
  br label %cond.end45

cond.false44:                                     ; preds = %cond.end40
  %21 = bitcast i32* %b to i8*
  br label %cond.end45

cond.end45:                                       ; preds = %cond.false44, %cond.true43
  %cond46 = phi i8* [ %20, %cond.true43 ], [ %21, %cond.false44 ]
  %22 = load i32* %retval
  ret i32 %22
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
