; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.epic_private = type { %struct.epic_rx_desc*, [5 x i32] }
%struct.epic_rx_desc = type { i32 }

@check_rx_ring = internal global [5 x i32] [i32 12, i32 14, i32 16, i32 18, i32 10], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ep = alloca %struct.epic_private, align 8
  %rx_ring = alloca [5 x %struct.epic_rx_desc], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %idxprom
  %next = getelementptr inbounds %struct.epic_rx_desc* %arrayidx, i32 0, i32 0
  store i32 0, i32* %next, align 4
  %2 = load i32* %i, align 4
  %idxprom1 = sext i32 %2 to i64
  %rx_skbuff = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [5 x i32]* %rx_skbuff, i32 0, i64 %idxprom1
  store i32 5, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i32 0
  %rx_ring3 = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 0
  store %struct.epic_rx_desc* %arraydecay, %struct.epic_rx_desc** %rx_ring3, align 8
  call void @epic_init_ring(%struct.epic_private* %ep)
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc19, %for.end
  %4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %4, 5
  br i1 %cmp5, label %for.body6, label %for.end21

for.body6:                                        ; preds = %for.cond4
  %5 = load i32* %i, align 4
  %idxprom7 = sext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %idxprom7
  %next9 = getelementptr inbounds %struct.epic_rx_desc* %arrayidx8, i32 0, i32 0
  %6 = load i32* %next9, align 4
  %7 = load i32* %i, align 4
  %idxprom10 = sext i32 %7 to i64
  %arrayidx11 = getelementptr inbounds [5 x i32]* @check_rx_ring, i32 0, i64 %idxprom10
  %8 = load i32* %arrayidx11, align 4
  %cmp12 = icmp ne i32 %6, %8
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body6
  %9 = load i32* %i, align 4
  %idxprom13 = sext i32 %9 to i64
  %rx_skbuff14 = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 1
  %arrayidx15 = getelementptr inbounds [5 x i32]* %rx_skbuff14, i32 0, i64 %idxprom13
  %10 = load i32* %arrayidx15, align 4
  %cmp16 = icmp ne i32 %10, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %11 = load i32* %i, align 4
  %inc20 = add nsw i32 %11, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond4

for.end21:                                        ; preds = %for.cond4
  ret i32 0
}

define internal void @epic_init_ring(%struct.epic_private* %ep) nounwind uwtable {
entry:
  %ep.addr = alloca %struct.epic_private*, align 8
  %i = alloca i32, align 4
  store %struct.epic_private* %ep, %struct.epic_private** %ep.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 %1, 1
  %mul = mul nsw i32 %add, 2
  %add1 = add nsw i32 10, %mul
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load %struct.epic_private** %ep.addr, align 8
  %rx_ring = getelementptr inbounds %struct.epic_private* %3, i32 0, i32 0
  %4 = load %struct.epic_rx_desc** %rx_ring, align 8
  %arrayidx = getelementptr inbounds %struct.epic_rx_desc* %4, i64 %idxprom
  %next = getelementptr inbounds %struct.epic_rx_desc* %arrayidx, i32 0, i32 0
  store i32 %add1, i32* %next, align 4
  %5 = load i32* %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %6 = load %struct.epic_private** %ep.addr, align 8
  %rx_skbuff = getelementptr inbounds %struct.epic_private* %6, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [5 x i32]* %rx_skbuff, i32 0, i64 %idxprom2
  store i32 0, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* %i, align 4
  %sub = sub nsw i32 %8, 1
  %idxprom4 = sext i32 %sub to i64
  %9 = load %struct.epic_private** %ep.addr, align 8
  %rx_ring5 = getelementptr inbounds %struct.epic_private* %9, i32 0, i32 0
  %10 = load %struct.epic_rx_desc** %rx_ring5, align 8
  %arrayidx6 = getelementptr inbounds %struct.epic_rx_desc* %10, i64 %idxprom4
  %next7 = getelementptr inbounds %struct.epic_rx_desc* %arrayidx6, i32 0, i32 0
  store i32 10, i32* %next7, align 4
  ret void
}

declare void @abort() noreturn nounwind
