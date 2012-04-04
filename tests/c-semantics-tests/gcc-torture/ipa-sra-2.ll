; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ipa-sra-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.both = type { %struct.big }
%struct.big = type { [1000000 x i32] }
%struct.small = type { [10 x i32] }

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %agg = alloca %union.both*, align 8
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i8* @calloc(i64 1, i64 40)
  %0 = bitcast i8* %call to %union.both*
  store %union.both* %0, %union.both** %agg, align 8
  %1 = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %1, 2000
  %conv = zext i1 %cmp to i32
  %2 = load %union.both** %agg, align 8
  %call1 = call i32 @foo(i32 %conv, %union.both* %2)
  store i32 %call1, i32* %r, align 4
  %3 = load %union.both** %agg, align 8
  %4 = bitcast %union.both* %3 to i8*
  call void @free(i8* %4)
  %5 = load i32* %r, align 4
  ret i32 %5
}

declare i8* @calloc(i64, i64)

define internal i32 @foo(i32 %fail, %union.both* %agg) nounwind uwtable noinline {
entry:
  %fail.addr = alloca i32, align 4
  %agg.addr = alloca %union.both*, align 8
  %r = alloca i32, align 4
  store i32 %fail, i32* %fail.addr, align 4
  store %union.both* %agg, %union.both** %agg.addr, align 8
  %0 = load i32* %fail.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %union.both** %agg.addr, align 8
  %big = bitcast %union.both* %1 to %struct.big*
  %data = getelementptr inbounds %struct.big* %big, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1000000 x i32]* %data, i32 0, i64 999999
  %2 = load i32* %arrayidx, align 4
  store i32 %2, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load %union.both** %agg.addr, align 8
  %small = bitcast %union.both* %3 to %struct.small*
  %data1 = getelementptr inbounds %struct.small* %small, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [10 x i32]* %data1, i32 0, i64 0
  %4 = load i32* %arrayidx2, align 4
  store i32 %4, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32* %r, align 4
  ret i32 %5
}

declare void @free(i8*)
