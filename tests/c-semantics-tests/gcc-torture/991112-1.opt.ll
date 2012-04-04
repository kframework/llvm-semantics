; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @rl_show_char(i32 %c) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @rl_character_len(i32 %c, i32 %pos) nounwind uwtable readonly {
entry:
  %idxprom = sext i32 %c to i64
  %call = tail call i16** @__ctype_b_loc() nounwind readnone
  %0 = load i16** %call, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds i16* %0, i64 %idxprom
  %1 = load i16* %arrayidx, align 2, !tbaa !3
  %and = and i16 %1, 16384
  %tobool = icmp ne i16 %and, 0
  %cond = select i1 %tobool, i32 1, i32 2
  ret i32 %cond
}

declare i16** @__ctype_b_loc() nounwind readnone

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i16** @__ctype_b_loc() nounwind readnone
  %0 = load i16** %call.i, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i16* %0, i64 97
  %1 = load i16* %arrayidx.i, align 2, !tbaa !3
  %and.i = and i16 %1, 16384
  %tobool.i = icmp eq i16 %and.i, 0
  br i1 %tobool.i, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx.i6 = getelementptr inbounds i16* %0, i64 2
  %2 = load i16* %arrayidx.i6, align 2, !tbaa !3
  %and.i7 = and i16 %2, 16384
  %not.tobool.i8 = icmp eq i16 %and.i7, 0
  br i1 %not.tobool.i8, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
