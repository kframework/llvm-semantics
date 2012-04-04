; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @rl_show_char(i32 %c) nounwind uwtable {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  ret i32 0
}

define i32 @rl_character_len(i32 %c, i32 %pos) nounwind uwtable {
entry:
  %c.addr = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %pos, i32* %pos.addr, align 4
  %0 = load i32* %c.addr, align 4
  %idxprom = sext i32 %0 to i64
  %call = call i16** @__ctype_b_loc() nounwind readnone
  %1 = load i16** %call, align 8
  %arrayidx = getelementptr inbounds i16* %1, i64 %idxprom
  %2 = load i16* %arrayidx, align 2
  %conv = zext i16 %2 to i32
  %and = and i32 %conv, 16384
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 1, i32 2
  ret i32 %cond
}

declare i16** @__ctype_b_loc() nounwind readnone

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32 (i32, i32)*, align 8
  store i32 0, i32* %retval
  store i32 (i32, i32)* @rl_character_len, i32 (i32, i32)** %x, align 8
  %0 = load i32 (i32, i32)** %x, align 8
  %call = call i32 %0(i32 97, i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32 (i32, i32)** %x, align 8
  %call1 = call i32 %1(i32 2, i32 1)
  %cmp2 = icmp ne i32 %call1, 2
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
