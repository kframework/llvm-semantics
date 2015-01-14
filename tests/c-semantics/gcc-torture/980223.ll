; ModuleID = './980223.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.object = type { i8*, i64 }

@nil = common global i32 0, align 4
@cons1 = global [2 x %struct.object] [%struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@cons2 = global [2 x %struct.object] [%struct.object { i8* bitcast ([2 x %struct.object]* @cons1 to i8*), i64 64 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@main.x = private unnamed_addr constant %struct.object { i8* bitcast ([2 x %struct.object]* @cons2 to i8*), i64 64 }, align 8
@main.y = private unnamed_addr constant %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, align 8

; Function Attrs: nounwind uwtable
define { i8*, i64 } @bar(i8* %blah.coerce0, i64 %blah.coerce1) #0 {
  %1 = alloca %struct.object, align 8
  %blah = alloca %struct.object, align 8
  %2 = bitcast %struct.object* %blah to { i8*, i64 }*
  %3 = getelementptr { i8*, i64 }* %2, i32 0, i32 0
  store i8* %blah.coerce0, i8** %3
  %4 = getelementptr { i8*, i64 }* %2, i32 0, i32 1
  store i64 %blah.coerce1, i64* %4
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  %6 = bitcast %struct.object* %1 to { i8*, i64 }*
  %7 = load { i8*, i64 }* %6, align 1
  ret { i8*, i64 } %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define { i8*, i64 } @foo(i8* %x.coerce0, i64 %x.coerce1, i8* %y.coerce0, i64 %y.coerce1) #0 {
  %1 = alloca %struct.object, align 8
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %z = alloca %struct.object, align 8
  %2 = alloca %struct.object, align 8
  %3 = bitcast %struct.object* %x to { i8*, i64 }*
  %4 = getelementptr { i8*, i64 }* %3, i32 0, i32 0
  store i8* %x.coerce0, i8** %4
  %5 = getelementptr { i8*, i64 }* %3, i32 0, i32 1
  store i64 %x.coerce1, i64* %5
  %6 = bitcast %struct.object* %y to { i8*, i64 }*
  %7 = getelementptr { i8*, i64 }* %6, i32 0, i32 0
  store i8* %y.coerce0, i8** %7
  %8 = getelementptr { i8*, i64 }* %6, i32 0, i32 1
  store i64 %y.coerce1, i64* %8
  %9 = getelementptr inbounds %struct.object* %x, i32 0, i32 0
  %10 = load i8** %9, align 8
  %11 = bitcast i8* %10 to %struct.object*
  %12 = bitcast %struct.object* %z to i8*
  %13 = bitcast %struct.object* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 16, i32 8, i1 false)
  %14 = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %15 = load i64* %14, align 8
  %16 = and i64 %15, 64
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %49

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %20 = load i8** %19, align 8
  %21 = getelementptr inbounds i8* %20, i64 16
  %22 = bitcast i8* %21 to %struct.object*
  %23 = bitcast %struct.object* %y to i8*
  %24 = bitcast %struct.object* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 16, i32 8, i1 false)
  %25 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %26 = load i8** %25, align 8
  %27 = bitcast i8* %26 to %struct.object*
  %28 = bitcast %struct.object* %z to i8*
  %29 = bitcast %struct.object* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 16, i32 8, i1 false)
  %30 = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %31 = load i64* %30, align 8
  %32 = and i64 %31, 64
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %48

; <label>:34                                      ; preds = %18
  %35 = bitcast %struct.object* %y to { i8*, i64 }*
  %36 = getelementptr { i8*, i64 }* %35, i32 0, i32 0
  %37 = load i8** %36, align 1
  %38 = getelementptr { i8*, i64 }* %35, i32 0, i32 1
  %39 = load i64* %38, align 1
  %40 = call { i8*, i64 } @bar(i8* %37, i64 %39)
  %41 = bitcast %struct.object* %2 to { i8*, i64 }*
  %42 = getelementptr { i8*, i64 }* %41, i32 0, i32 0
  %43 = extractvalue { i8*, i64 } %40, 0
  store i8* %43, i8** %42, align 1
  %44 = getelementptr { i8*, i64 }* %41, i32 0, i32 1
  %45 = extractvalue { i8*, i64 } %40, 1
  store i64 %45, i64* %44, align 1
  %46 = bitcast %struct.object* %y to i8*
  %47 = bitcast %struct.object* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 16, i32 8, i1 false)
  br label %48

; <label>:48                                      ; preds = %34, %18
  br label %49

; <label>:49                                      ; preds = %48, %0
  %50 = bitcast %struct.object* %1 to i8*
  %51 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %50, i8* %51, i64 16, i32 8, i1 false)
  %52 = bitcast %struct.object* %1 to { i8*, i64 }*
  %53 = load { i8*, i64 }* %52, align 1
  ret { i8*, i64 } %53
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %three = alloca %struct.object, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.object* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.object* @main.x to i8*), i64 16, i32 8, i1 false)
  %3 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.object* @main.y to i8*), i64 16, i32 8, i1 false)
  %4 = bitcast %struct.object* %x to { i8*, i64 }*
  %5 = getelementptr { i8*, i64 }* %4, i32 0, i32 0
  %6 = load i8** %5, align 1
  %7 = getelementptr { i8*, i64 }* %4, i32 0, i32 1
  %8 = load i64* %7, align 1
  %9 = bitcast %struct.object* %y to { i8*, i64 }*
  %10 = getelementptr { i8*, i64 }* %9, i32 0, i32 0
  %11 = load i8** %10, align 1
  %12 = getelementptr { i8*, i64 }* %9, i32 0, i32 1
  %13 = load i64* %12, align 1
  %14 = call { i8*, i64 } @foo(i8* %6, i64 %8, i8* %11, i64 %13)
  %15 = bitcast %struct.object* %three to { i8*, i64 }*
  %16 = getelementptr { i8*, i64 }* %15, i32 0, i32 0
  %17 = extractvalue { i8*, i64 } %14, 0
  store i8* %17, i8** %16, align 1
  %18 = getelementptr { i8*, i64 }* %15, i32 0, i32 1
  %19 = extractvalue { i8*, i64 } %14, 1
  store i64 %19, i64* %18, align 1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
