; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr25125.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @f(i16 signext %a) nounwind uwtable noinline {
entry:
  %retval = alloca i16, align 2
  %a.addr = alloca i16, align 2
  %b = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  %tmp = load i16* %a.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp2 = load i16* %a.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %add = add nsw i32 %conv3, -32768
  %conv4 = trunc i32 %add to i16
  store i16 %conv4, i16* %b, align 2
  %tmp5 = load i16* %b, align 2
  store i16 %tmp5, i16* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i16* %retval
  ret i16 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i16 @f(i16 signext -32767)
  %conv = zext i16 %call to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
