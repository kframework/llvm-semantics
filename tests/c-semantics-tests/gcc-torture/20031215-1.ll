; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.pstr = type { i32, i32, [3 x i8] }

@ao = constant { i32, i32, [3 x i8], i8 } { i32 2, i32 2, [3 x i8] c"OK\00", i8 undef }, align 4
@a = constant %struct.pstr* bitcast ({ i32, i32, [3 x i8], i8 }* @ao to %struct.pstr*), align 8

define void @test1() nounwind uwtable {
entry:
  %0 = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %0, i32 0, i32 1
  %1 = load i32* %l, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.pstr** @a, align 8
  %l1 = getelementptr inbounds %struct.pstr* %4, i32 0, i32 1
  %5 = load i32* %l1, align 4
  %idxprom2 = sext i32 %5 to i64
  %6 = load %struct.pstr** @a, align 8
  %ch3 = getelementptr inbounds %struct.pstr* %6, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch3, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds i8* %arraydecay, i64 %idxprom2
  store i8 0, i8* %arrayidx4, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define void @test2() nounwind uwtable {
entry:
  %0 = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %0, i32 0, i32 1
  %1 = load i32* %l, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.pstr** @a, align 8
  %l1 = getelementptr inbounds %struct.pstr* %4, i32 0, i32 1
  %5 = load i32* %l1, align 4
  %idxprom2 = sext i32 %5 to i64
  %6 = load %struct.pstr** @a, align 8
  %ch3 = getelementptr inbounds %struct.pstr* %6, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch3, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds i8* %arraydecay, i64 %idxprom2
  store i8 -1, i8* %arrayidx4, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define void @test3() nounwind uwtable {
entry:
  %0 = load %struct.pstr** @a, align 8
  %l = getelementptr inbounds %struct.pstr* %0, i32 0, i32 1
  %1 = load i32* %l, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.pstr** @a, align 8
  %ch = getelementptr inbounds %struct.pstr* %2, i32 0, i32 2
  %arrayidx = getelementptr inbounds [3 x i8]* %ch, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.pstr** @a, align 8
  %l1 = getelementptr inbounds %struct.pstr* %4, i32 0, i32 1
  %5 = load i32* %l1, align 4
  %idxprom2 = sext i32 %5 to i64
  %6 = load %struct.pstr** @a, align 8
  %ch3 = getelementptr inbounds %struct.pstr* %6, i32 0, i32 2
  %arraydecay = getelementptr inbounds [3 x i8]* %ch3, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds i8* %arraydecay, i64 %idxprom2
  store i8 1, i8* %arrayidx4, align 1
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
