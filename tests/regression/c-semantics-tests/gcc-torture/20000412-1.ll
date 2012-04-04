; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = global i16 -1, align 2
@wordlist = common global [207 x i8*] zeroinitializer, align 16

define i8** @foo() nounwind uwtable {
entry:
  %wordptr = alloca i8**, align 8
  %0 = load i16* @i, align 2
  %conv = sext i16 %0 to i32
  %add = add i32 207, %conv
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds [207 x i8*]* @wordlist, i32 0, i64 %idxprom
  store i8** %arrayidx, i8*** %wordptr, align 8
  %1 = load i8*** %wordptr, align 8
  ret i8** %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i8** @foo()
  %cmp = icmp ne i8** %call, getelementptr inbounds ([207 x i8*]* @wordlist, i32 0, i64 206)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
