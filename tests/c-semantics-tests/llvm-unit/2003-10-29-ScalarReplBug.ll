; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-10-29-ScalarReplBug.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.data = type { [80 x i8], i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %d = alloca %struct.data, align 4
  store i32 0, i32* %retval
  %uval = getelementptr inbounds %struct.data* %d, i32 0, i32 2
  store i32 0, i32* %uval, align 4
  %0 = bitcast %struct.data* %d to i8*
  call void @iter(i32 (i8*)* @callback, i8* %0)
  ret i32 0
}

define internal void @iter(i32 (i8*)* %cb, i8* %d) nounwind uwtable {
entry:
  %cb.addr = alloca i32 (i8*)*, align 8
  %d.addr = alloca i8*, align 8
  store i32 (i8*)* %cb, i32 (i8*)** %cb.addr, align 8
  store i8* %d, i8** %d.addr, align 8
  %0 = load i32 (i8*)** %cb.addr, align 8
  %1 = load i8** %d.addr, align 8
  %call = call i32 %0(i8* %1)
  ret void
}

define internal i32 @callback(i8* %d) nounwind uwtable {
entry:
  %d.addr = alloca i8*, align 8
  %iter_data = alloca %struct.data*, align 8
  store i8* %d, i8** %d.addr, align 8
  %0 = load i8** %d.addr, align 8
  %1 = bitcast i8* %0 to %struct.data*
  store %struct.data* %1, %struct.data** %iter_data, align 8
  %2 = load %struct.data** %iter_data, align 8
  %uval = getelementptr inbounds %struct.data* %2, i32 0, i32 2
  %3 = load i32* %uval, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %4 = load %struct.data** %iter_data, align 8
  %uval1 = getelementptr inbounds %struct.data* %4, i32 0, i32 2
  %5 = load i32* %uval1, align 4
  %cmp = icmp eq i32 %5, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare i32 @printf(i8*, ...)
