; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920721-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @ru(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* %i.addr, align 4
  %conv = trunc i32 %tmp to i16
  %call = call i32 @fu(i16 zeroext %conv)
  %cmp = icmp ne i32 %call, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32* %i.addr, align 4
  %inc3 = add nsw i32 %tmp2, 1
  store i32 %inc3, i32* %i.addr, align 4
  %conv4 = trunc i32 %inc3 to i16
  %call5 = call i32 @fu(i16 zeroext %conv4)
  %cmp6 = icmp ne i32 %call5, 7
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end
  ret void
}

define internal i32 @fu(i16 zeroext %data) nounwind uwtable inlinehint {
entry:
  %data.addr = alloca i16, align 2
  store i16 %data, i16* %data.addr, align 2
  %tmp = load i16* %data.addr, align 2
  %conv = zext i16 %tmp to i32
  ret i32 %conv
}

declare void @abort() noreturn

define void @rs(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* %i.addr, align 4
  %conv = trunc i32 %tmp to i16
  %call = call i32 @fs(i16 signext %conv)
  %cmp = icmp ne i32 %call, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32* %i.addr, align 4
  %inc3 = add nsw i32 %tmp2, 1
  store i32 %inc3, i32* %i.addr, align 4
  %conv4 = trunc i32 %inc3 to i16
  %call5 = call i32 @fs(i16 signext %conv4)
  %cmp6 = icmp ne i32 %call5, 7
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end
  ret void
}

define internal i32 @fs(i16 signext %data) nounwind uwtable inlinehint {
entry:
  %data.addr = alloca i16, align 2
  store i16 %data, i16* %data.addr, align 2
  %tmp = load i16* %data.addr, align 2
  %conv = sext i16 %tmp to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (i32)* @ru to void (...)*)(i32 5)
  call void (...)* bitcast (void (i32)* @rs to void (...)*)(i32 5)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
