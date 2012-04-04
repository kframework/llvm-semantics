; ModuleID = '/home/david/src/c-semantics/tests/cil/test55.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fun = type { i32 }

@a = global %struct.fun { i32 32 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @pfun2(%struct.fun** %z) nounwind uwtable {
entry:
  %z.addr = alloca %struct.fun**, align 8
  store %struct.fun** %z, %struct.fun*** %z.addr, align 8
  ret void
}

define void @pfun(%struct.fun* %z) nounwind uwtable {
entry:
  %z.addr = alloca %struct.fun*, align 8
  store %struct.fun* %z, %struct.fun** %z.addr, align 8
  call void @pfun2(%struct.fun** %z.addr)
  %0 = load %struct.fun** %z.addr, align 8
  %x = getelementptr inbounds %struct.fun* %0, i32 0, i32 0
  %1 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @pfun(%struct.fun* @a)
  ret i32 0
}
