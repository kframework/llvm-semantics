; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32, [3 x i8], i8 }
%struct.pstr = type { i32, i32, [3 x i8] }

@ao = constant %0 { i32 2, i32 2, [3 x i8] c"OK\00", i8 undef }, align 4
@a = constant %struct.pstr* bitcast (%0* @ao to %struct.pstr*), align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @test1() nounwind uwtable {
entry:
  %tmp = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %tmp, i32 0, i32 1
  %tmp1 = load i32* %l, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %tmp2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp4 = load %struct.pstr** @a, align 8
  %l5 = getelementptr inbounds %struct.pstr* %tmp4, i32 0, i32 1
  %tmp6 = load i32* %l5, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load %struct.pstr** @a, align 8
  %ch9 = getelementptr inbounds %struct.pstr* %tmp8, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch9, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds i8* %arraydecay, i64 %idxprom7
  store i8 0, i8* %arrayidx10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define void @test2() nounwind uwtable {
entry:
  %tmp = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %tmp, i32 0, i32 1
  %tmp1 = load i32* %l, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %tmp2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp4 = load %struct.pstr** @a, align 8
  %l5 = getelementptr inbounds %struct.pstr* %tmp4, i32 0, i32 1
  %tmp6 = load i32* %l5, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load %struct.pstr** @a, align 8
  %ch9 = getelementptr inbounds %struct.pstr* %tmp8, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch9, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds i8* %arraydecay, i64 %idxprom7
  store i8 -1, i8* %arrayidx10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define void @test3() nounwind uwtable {
entry:
  %tmp = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %tmp, i32 0, i32 1
  %tmp1 = load i32* %l, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %tmp2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp4 = load %struct.pstr** @a, align 8
  %l5 = getelementptr inbounds %struct.pstr* %tmp4, i32 0, i32 1
  %tmp6 = load i32* %l5, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load %struct.pstr** @a, align 8
  %ch9 = getelementptr inbounds %struct.pstr* %tmp8, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch9, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds i8* %arraydecay, i64 %idxprom7
  store i8 1, i8* %arrayidx10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1()
  call void @test2()
  call void @test3()
  ret i32 0
}
