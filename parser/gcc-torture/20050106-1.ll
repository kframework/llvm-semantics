; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050106-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@u = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i16 @foo(i32* @u)
  %conv = zext i16 %call to i32
  %and = and i32 %conv, 32768
  %cmp = icmp ne i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal zeroext i16 @foo(i32* %p) nounwind uwtable inlinehint {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %tmp = load i32** %p.addr, align 8
  %tmp1 = load i32* %tmp
  %conv = trunc i32 %tmp1 to i16
  ret i16 %conv
}

declare void @abort() noreturn
