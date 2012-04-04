; ModuleID = '/home/david/src/c-semantics/tests/cil/test54.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.precisionType = type { i32* }

define void @pnorm(%struct.precisionType* %u) nounwind uwtable {
entry:
  %u.addr = alloca %struct.precisionType*, align 8
  %uPtr = alloca i32*, align 8
  store %struct.precisionType* %u, %struct.precisionType** %u.addr, align 8
  %0 = load %struct.precisionType** %u.addr, align 8
  %value = getelementptr inbounds %struct.precisionType* %0, i32 0, i32 0
  %1 = load i32** %value, align 8
  store i32* %1, i32** %uPtr, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load i32** %uPtr, align 8
  %incdec.ptr = getelementptr inbounds i32* %2, i32 -1
  store i32* %incdec.ptr, i32** %uPtr, align 8
  %3 = load i32* %incdec.ptr, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  br label %do.end

if.end:                                           ; preds = %do.body
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %4 = load i32** %uPtr, align 8
  %5 = load %struct.precisionType** %u.addr, align 8
  %value1 = getelementptr inbounds %struct.precisionType* %5, i32 0, i32 0
  %6 = load i32** %value1, align 8
  %cmp2 = icmp ugt i32* %4, %6
  br i1 %cmp2, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  ret i32 0
}
