; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-02-DependentPHI.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.List = type { %struct.List*, i32 }

@Node0 = global { %struct.List*, i32, [4 x i8] } { %struct.List* null, i32 5, [4 x i8] undef }, align 8
@Node1 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node0 to %struct.List*), i32 4, [4 x i8] undef }, align 8
@Node2 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node1 to %struct.List*), i32 3, [4 x i8] undef }, align 8
@Node3 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node2 to %struct.List*), i32 2, [4 x i8] undef }, align 8
@Node4 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node3 to %struct.List*), i32 1, [4 x i8] undef }, align 8
@Node5 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node4 to %struct.List*), i32 0, [4 x i8] undef }, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %cond.end
  %CurL.04 = phi %struct.List* [ bitcast ({ %struct.List*, i32, [4 x i8] }* @Node5 to %struct.List*), %entry ], [ %2, %cond.end ]
  %PrevL.03 = phi %struct.List* [ null, %entry ], [ %CurL.04, %cond.end ]
  %Data = getelementptr inbounds %struct.List* %CurL.04, i64 0, i32 1
  %0 = load i32* %Data, align 4, !tbaa !0
  %tobool1 = icmp eq %struct.List* %PrevL.03, null
  br i1 %tobool1, label %cond.end, label %cond.true

cond.true:                                        ; preds = %for.body
  %Data2 = getelementptr inbounds %struct.List* %PrevL.03, i64 0, i32 1
  %1 = load i32* %Data2, align 4, !tbaa !0
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ -1, %for.body ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %0, i32 %cond) nounwind
  %Next = getelementptr inbounds %struct.List* %CurL.04, i64 0, i32 0
  %2 = load %struct.List** %Next, align 8, !tbaa !3
  %tobool = icmp eq %struct.List* %2, null
  br i1 %tobool, label %for.end, label %for.body

for.end:                                          ; preds = %cond.end
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
