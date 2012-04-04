; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020206-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i16 }

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 2048
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %x.addr, align 4
  %cmp1 = icmp ne i32 %1, 2064
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  ret void
}

declare void @abort() noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %.compoundliteral = alloca %struct.A, align 2
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %a = getelementptr inbounds %struct.A* %.compoundliteral, i32 0, i32 0
  %1 = load i32* %i, align 4
  %shr = ashr i32 %1, 4
  %tobool = icmp ne i32 %shr, 0
  br i1 %tobool, label %cond.false, label %cond.true

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %2 = load i32* %i, align 4
  %shr1 = ashr i32 %2, 4
  %add = add nsw i32 64, %shr1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 8, %cond.true ], [ %add, %cond.false ]
  %shl = shl i32 %cond, 8
  %3 = load i32* %i, align 4
  %shl2 = shl i32 %3, 4
  %add3 = add nsw i32 %shl, %shl2
  %conv = trunc i32 %add3 to i16
  store i16 %conv, i16* %a, align 2
  %a4 = getelementptr inbounds %struct.A* %.compoundliteral, i32 0, i32 0
  %4 = load i16* %a4, align 2
  %conv5 = zext i16 %4 to i32
  call void @foo(i32 %conv5)
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn
