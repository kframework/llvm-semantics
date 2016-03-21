; ModuleID = './pr45070.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.source = type { i32, i32, i32 }
%struct.packed_ushort = type { i16 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.source, align 4
  %i = alloca i32, align 4
  %rv = alloca %struct.packed_ushort, align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.source, %struct.source* %s, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.source, %struct.source* %s, i32 0, i32 1
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct.source, %struct.source* %s, i32 0, i32 2
  store i32 0, i32* %4, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %28, %0
  %6 = load i32, i32* %i, align 4
  %7 = icmp slt i32 %6, 16
  br i1 %7, label %8, label %31

; <label>:8                                       ; preds = %5
  %9 = call i16 @next(%struct.source* %s)
  %10 = getelementptr %struct.packed_ushort, %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 %9, i16* %10, align 1
  %11 = load i32, i32* %i, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds %struct.packed_ushort, %struct.packed_ushort* %rv, i32 0, i32 0
  %15 = load i16, i16* %14, align 1
  %16 = zext i16 %15 to i32
  %17 = icmp ne i32 %16, 65535
  br i1 %17, label %26, label %18

; <label>:18                                      ; preds = %13, %8
  %19 = load i32, i32* %i, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %27

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds %struct.packed_ushort, %struct.packed_ushort* %rv, i32 0, i32 0
  %23 = load i16, i16* %22, align 1
  %24 = zext i16 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21, %13
  call void @abort() #4
  unreachable

; <label>:27                                      ; preds = %21, %18
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %5

; <label>:31                                      ; preds = %5
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i16 @next(%struct.source* %p) #1 {
  %1 = alloca %struct.packed_ushort, align 1
  %2 = alloca %struct.source*, align 8
  %rv = alloca %struct.packed_ushort, align 1
  store %struct.source* %p, %struct.source** %2, align 8
  %3 = load %struct.source*, %struct.source** %2, align 8
  %4 = getelementptr inbounds %struct.source, %struct.source* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.source*, %struct.source** %2, align 8
  %7 = getelementptr inbounds %struct.source, %struct.source* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = icmp sge i32 %5, %8
  br i1 %9, label %10, label %28

; <label>:10                                      ; preds = %0
  %11 = load %struct.source*, %struct.source** %2, align 8
  %12 = getelementptr inbounds %struct.source, %struct.source* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %22

; <label>:15                                      ; preds = %10
  %16 = load %struct.source*, %struct.source** %2, align 8
  %17 = getelementptr inbounds %struct.source, %struct.source* %16, i32 0, i32 2
  store i32 0, i32* %17, align 4
  %18 = load %struct.source*, %struct.source** %2, align 8
  call void @fetch(%struct.source* %18)
  %19 = load %struct.source*, %struct.source** %2, align 8
  %20 = call i16 @next(%struct.source* %19)
  %21 = getelementptr %struct.packed_ushort, %struct.packed_ushort* %1, i32 0, i32 0
  store i16 %20, i16* %21, align 1
  br label %32

; <label>:22                                      ; preds = %10
  %23 = load %struct.source*, %struct.source** %2, align 8
  %24 = getelementptr inbounds %struct.source, %struct.source* %23, i32 0, i32 2
  store i32 1, i32* %24, align 4
  %25 = getelementptr inbounds %struct.packed_ushort, %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 -1, i16* %25, align 1
  %26 = bitcast %struct.packed_ushort* %1 to i8*
  %27 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 2, i32 1, i1 false)
  br label %32

; <label>:28                                      ; preds = %0
  %29 = getelementptr inbounds %struct.packed_ushort, %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 0, i16* %29, align 1
  %30 = bitcast %struct.packed_ushort* %1 to i8*
  %31 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 2, i32 1, i1 false)
  br label %32

; <label>:32                                      ; preds = %28, %22, %15
  %33 = getelementptr %struct.packed_ushort, %struct.packed_ushort* %1, i32 0, i32 0
  %34 = load i16, i16* %33, align 1
  ret i16 %34
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noinline nounwind uwtable
define internal void @fetch(%struct.source* %p) #1 {
  %1 = alloca %struct.source*, align 8
  store %struct.source* %p, %struct.source** %1, align 8
  %2 = load %struct.source*, %struct.source** %1, align 8
  %3 = getelementptr inbounds %struct.source, %struct.source* %2, i32 0, i32 1
  store i32 128, i32* %3, align 4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
