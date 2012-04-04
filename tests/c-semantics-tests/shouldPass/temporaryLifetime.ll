; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/temporaryLifetime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, [2 x i32] }

@s = global %struct.S { i32 1, [2 x i32] [i32 2, i32 3] }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %coerce = alloca %struct.S, align 4
  %tmp = alloca { i64, i32 }
  %coerce3 = alloca %struct.S, align 4
  %tmp4 = alloca { i64, i32 }
  %coerce7 = alloca %struct.S, align 4
  %tmp8 = alloca { i64, i32 }
  %coerce12 = alloca %struct.S, align 4
  %tmp13 = alloca { i64, i32 }
  store i32 0, i32* %retval
  %call = call { i64, i32 } @f()
  store { i64, i32 } %call, { i64, i32 }* %tmp
  %0 = bitcast { i64, i32 }* %tmp to %struct.S*
  %1 = load %struct.S* %0, align 1
  store %struct.S %1, %struct.S* %coerce
  %a = getelementptr inbounds %struct.S* %coerce, i32 0, i32 0
  %2 = load i32* %a, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %2)
  %call2 = call { i64, i32 } @f()
  store { i64, i32 } %call2, { i64, i32 }* %tmp4
  %3 = bitcast { i64, i32 }* %tmp4 to %struct.S*
  %4 = load %struct.S* %3, align 1
  store %struct.S %4, %struct.S* %coerce3
  %b = getelementptr inbounds %struct.S* %coerce3, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i32]* %b, i32 0, i64 0
  %5 = load i32* %arrayidx, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  %call6 = call { i64, i32 } @f()
  store { i64, i32 } %call6, { i64, i32 }* %tmp8
  %6 = bitcast { i64, i32 }* %tmp8 to %struct.S*
  %7 = load %struct.S* %6, align 1
  store %struct.S %7, %struct.S* %coerce7
  %b9 = getelementptr inbounds %struct.S* %coerce7, i32 0, i32 1
  %arraydecay = getelementptr inbounds [2 x i32]* %b9, i32 0, i32 0
  %add.ptr = getelementptr inbounds i32* %arraydecay, i64 0
  %8 = load i32* %add.ptr, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %8)
  %call11 = call { i64, i32 } @f()
  store { i64, i32 } %call11, { i64, i32 }* %tmp13
  %9 = bitcast { i64, i32 }* %tmp13 to %struct.S*
  %10 = load %struct.S* %9, align 1
  store %struct.S %10, %struct.S* %coerce12
  %b14 = getelementptr inbounds %struct.S* %coerce12, i32 0, i32 1
  %arraydecay15 = getelementptr inbounds [2 x i32]* %b14, i32 0, i32 0
  %11 = load i32* %arraydecay15, align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define internal { i64, i32 } @f() nounwind uwtable {
entry:
  %retval = alloca %struct.S, align 4
  %tmp = alloca { i64, i32 }
  %0 = bitcast %struct.S* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @s to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast { i64, i32 }* %tmp to %struct.S*
  %2 = load %struct.S* %retval
  store %struct.S %2, %struct.S* %1, align 1
  %3 = load { i64, i32 }* %tmp
  ret { i64, i32 } %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
