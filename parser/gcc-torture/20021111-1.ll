; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@aim_callhandler.i = internal global i32 0, align 4

define i32 @aim_callhandler(i32 %sess, i32 %conn, i16 zeroext %family, i16 zeroext %type) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %sess.addr = alloca i32, align 4
  %conn.addr = alloca i32, align 4
  %family.addr = alloca i16, align 2
  %type.addr = alloca i16, align 2
  store i32 %sess, i32* %sess.addr, align 4
  store i32 %conn, i32* %conn.addr, align 4
  store i16 %family, i16* %family.addr, align 2
  store i16 %type, i16* %type.addr, align 2
  %tmp = load i32* %conn.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp1 = load i16* %type.addr, align 2
  %conv = zext i16 %tmp1 to i32
  %cmp = icmp eq i32 %conv, 65535
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %tmp5 = load i32* @aim_callhandler.i, align 4
  %cmp6 = icmp sge i32 %tmp5, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end4
  %tmp10 = load i32* @aim_callhandler.i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* @aim_callhandler.i, align 4
  %tmp11 = load i32* %sess.addr, align 4
  %tmp12 = load i32* %conn.addr, align 4
  %tmp13 = load i16* %family.addr, align 2
  %call = call i32 @aim_callhandler(i32 %tmp11, i32 %tmp12, i16 zeroext %tmp13, i16 zeroext -1)
  store i32 %call, i32* %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then3, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @aim_callhandler(i32 0, i32 1, i16 zeroext 0, i16 zeroext 0)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
