; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020413-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test(x86_fp80 %val, i32* nocapture %eval) nounwind uwtable {
entry:
  %cmp = fcmp olt x86_fp80 %val, 0xK00000000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = fsub x86_fp80 0xK80000000000000000000, %val
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %val.addr.0 = phi x86_fp80 [ %sub, %if.then ], [ %val, %entry ]
  %cmp2 = fcmp ult x86_fp80 %val.addr.0, 0xK3FFF8000000000000000
  br i1 %cmp2, label %if.else, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.end
  %cmp4 = fcmp ogt x86_fp80 %val.addr.0, 0xK3FFF8000000000000000
  br i1 %cmp4, label %while.body, label %if.end19

while.body:                                       ; preds = %while.cond.preheader
  %cmp4.1 = fcmp ogt x86_fp80 %val.addr.0, 0xK40008000000000000000
  br i1 %cmp4.1, label %while.body.1, label %if.end19

if.else:                                          ; preds = %if.end
  %cmp8 = fcmp une x86_fp80 %val.addr.0, 0xK00000000000000000000
  %cmp11 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFF8000000000000000
  %or.cond = and i1 %cmp8, %cmp11
  br i1 %or.cond, label %while.body12, label %if.end19

while.body12:                                     ; preds = %if.else
  %cmp11.1 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFE8000000000000000
  br i1 %cmp11.1, label %while.body12.1, label %if.end19

if.end19:                                         ; preds = %while.body12, %while.body12.1, %while.body12.2, %while.body12.3, %while.body12.4, %while.body12.5, %while.body12.6, %while.body12.7, %while.body12.8, %while.body12.9, %while.cond.preheader, %while.body, %while.body.1, %while.body.2, %while.body.3, %while.body.4, %while.body.5, %while.body.6, %while.body.7, %while.body.8, %while.body.9, %if.else
  %i.2 = phi i32 [ 0, %if.else ], [ 0, %while.cond.preheader ], [ 1, %while.body ], [ 2, %while.body.1 ], [ 3, %while.body.2 ], [ 4, %while.body.3 ], [ 5, %while.body.4 ], [ 6, %while.body.5 ], [ 7, %while.body.6 ], [ 8, %while.body.7 ], [ 9, %while.body.8 ], [ 10, %while.body.9 ], [ 1, %while.body12 ], [ 2, %while.body12.1 ], [ 3, %while.body12.2 ], [ 4, %while.body12.3 ], [ 5, %while.body12.4 ], [ 6, %while.body12.5 ], [ 7, %while.body12.6 ], [ 8, %while.body12.7 ], [ 9, %while.body12.8 ], [ 10, %while.body12.9 ]
  store i32 %i.2, i32* %eval, align 4, !tbaa !0
  ret void

while.body.1:                                     ; preds = %while.body
  %cmp4.2 = fcmp ogt x86_fp80 %val.addr.0, 0xK40018000000000000000
  br i1 %cmp4.2, label %while.body.2, label %if.end19

while.body.2:                                     ; preds = %while.body.1
  %cmp4.3 = fcmp ogt x86_fp80 %val.addr.0, 0xK40028000000000000000
  br i1 %cmp4.3, label %while.body.3, label %if.end19

while.body.3:                                     ; preds = %while.body.2
  %cmp4.4 = fcmp ogt x86_fp80 %val.addr.0, 0xK40038000000000000000
  br i1 %cmp4.4, label %while.body.4, label %if.end19

while.body.4:                                     ; preds = %while.body.3
  %cmp4.5 = fcmp ogt x86_fp80 %val.addr.0, 0xK40048000000000000000
  br i1 %cmp4.5, label %while.body.5, label %if.end19

while.body.5:                                     ; preds = %while.body.4
  %cmp4.6 = fcmp ogt x86_fp80 %val.addr.0, 0xK40058000000000000000
  br i1 %cmp4.6, label %while.body.6, label %if.end19

while.body.6:                                     ; preds = %while.body.5
  %cmp4.7 = fcmp ogt x86_fp80 %val.addr.0, 0xK40068000000000000000
  br i1 %cmp4.7, label %while.body.7, label %if.end19

while.body.7:                                     ; preds = %while.body.6
  %cmp4.8 = fcmp ogt x86_fp80 %val.addr.0, 0xK40078000000000000000
  br i1 %cmp4.8, label %while.body.8, label %if.end19

while.body.8:                                     ; preds = %while.body.7
  %cmp4.9 = fcmp ogt x86_fp80 %val.addr.0, 0xK40088000000000000000
  br i1 %cmp4.9, label %while.body.9, label %if.end19

while.body.9:                                     ; preds = %while.body.8
  %cmp4.10 = fcmp ogt x86_fp80 %val.addr.0, 0xK40098000000000000000
  br i1 %cmp4.10, label %while.body.10, label %if.end19

while.body.10:                                    ; preds = %while.body.9
  tail call void @abort() noreturn nounwind
  unreachable

while.body12.1:                                   ; preds = %while.body12
  %cmp11.2 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFD8000000000000000
  br i1 %cmp11.2, label %while.body12.2, label %if.end19

while.body12.2:                                   ; preds = %while.body12.1
  %cmp11.3 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFC8000000000000000
  br i1 %cmp11.3, label %while.body12.3, label %if.end19

while.body12.3:                                   ; preds = %while.body12.2
  %cmp11.4 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFB8000000000000000
  br i1 %cmp11.4, label %while.body12.4, label %if.end19

while.body12.4:                                   ; preds = %while.body12.3
  %cmp11.5 = fcmp olt x86_fp80 %val.addr.0, 0xK3FFA8000000000000000
  br i1 %cmp11.5, label %while.body12.5, label %if.end19

while.body12.5:                                   ; preds = %while.body12.4
  %cmp11.6 = fcmp olt x86_fp80 %val.addr.0, 0xK3FF98000000000000000
  br i1 %cmp11.6, label %while.body12.6, label %if.end19

while.body12.6:                                   ; preds = %while.body12.5
  %cmp11.7 = fcmp olt x86_fp80 %val.addr.0, 0xK3FF88000000000000000
  br i1 %cmp11.7, label %while.body12.7, label %if.end19

while.body12.7:                                   ; preds = %while.body12.6
  %cmp11.8 = fcmp olt x86_fp80 %val.addr.0, 0xK3FF78000000000000000
  br i1 %cmp11.8, label %while.body12.8, label %if.end19

while.body12.8:                                   ; preds = %while.body12.7
  %cmp11.9 = fcmp olt x86_fp80 %val.addr.0, 0xK3FF68000000000000000
  br i1 %cmp11.9, label %while.body12.9, label %if.end19

while.body12.9:                                   ; preds = %while.body12.8
  %cmp11.10 = fcmp olt x86_fp80 %val.addr.0, 0xK3FF58000000000000000
  br i1 %cmp11.10, label %while.body12.10, label %if.end19

while.body12.10:                                  ; preds = %while.body12.9
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %eval = alloca i32, align 4
  call void @test(x86_fp80 0xK4000C000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4000E000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK40018000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4001A000000000000000, i32* %eval)
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
