; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ret-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.three_byte_t = type <{ i8, i16 }>

define zeroext i8 @f() nounwind uwtable {
entry:
  ret i8 -85
}

define zeroext i16 @g() nounwind uwtable {
entry:
  ret i16 4660
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %three_byte = alloca %struct.three_byte_t, align 1
  store i32 0, i32* %retval
  %call = call zeroext i8 @f()
  %a = getelementptr inbounds %struct.three_byte_t* %three_byte, i32 0, i32 0
  store i8 %call, i8* %a, align 1
  %call1 = call zeroext i16 @g()
  %b = getelementptr inbounds %struct.three_byte_t* %three_byte, i32 0, i32 1
  store i16 %call1, i16* %b, align 1
  %a2 = getelementptr inbounds %struct.three_byte_t* %three_byte, i32 0, i32 0
  %0 = load i8* %a2, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 171
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b4 = getelementptr inbounds %struct.three_byte_t* %three_byte, i32 0, i32 1
  %1 = load i16* %b4, align 1
  %conv5 = zext i16 %1 to i32
  %cmp6 = icmp ne i32 %conv5, 4660
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
