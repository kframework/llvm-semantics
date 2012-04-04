; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = global i16 -1, align 2
@wordlist = common global [207 x i8*] zeroinitializer, align 16

define i8** @foo() nounwind uwtable readonly {
entry:
  %0 = load i16* @i, align 2, !tbaa !0
  %conv = sext i16 %0 to i64
  %add = add i64 %conv, 207
  %idxprom = and i64 %add, 4294967295
  %arrayidx = getelementptr inbounds [207 x i8*]* @wordlist, i64 0, i64 %idxprom
  ret i8** %arrayidx
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i16* @i, align 2, !tbaa !0
  %conv.i = sext i16 %0 to i64
  %add.i = add i64 %conv.i, 207
  %idxprom.i = and i64 %add.i, 4294967295
  %cmp = icmp eq i64 %idxprom.i, 206
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
