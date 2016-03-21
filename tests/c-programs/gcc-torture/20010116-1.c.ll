; ModuleID = './20010116-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Data = type { i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @find(%struct.Data* %first, %struct.Data* %last) #0 {
  %1 = alloca %struct.Data*, align 8
  %2 = alloca %struct.Data*, align 8
  %i = alloca i32, align 4
  store %struct.Data* %first, %struct.Data** %1, align 8
  store %struct.Data* %last, %struct.Data** %2, align 8
  %3 = load %struct.Data*, %struct.Data** %2, align 8
  %4 = load %struct.Data*, %struct.Data** %1, align 8
  %5 = ptrtoint %struct.Data* %3 to i64
  %6 = ptrtoint %struct.Data* %4 to i64
  %7 = sub i64 %5, %6
  %8 = sdiv exact i64 %7, 12
  %9 = ashr i64 %8, 2
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %16, %0
  %12 = load i32, i32* %i, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %11
  %15 = load i32, i32* %i, align 4
  call void @ok(i32 %15)
  br label %16

; <label>:16                                      ; preds = %14
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, i32* %i, align 4
  br label %11

; <label>:19                                      ; preds = %11
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @ok(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %DataList = alloca [4 x %struct.Data], align 16
  %1 = getelementptr inbounds [4 x %struct.Data], [4 x %struct.Data]* %DataList, i32 0, i32 0
  %2 = getelementptr inbounds %struct.Data, %struct.Data* %1, i64 0
  %3 = getelementptr inbounds [4 x %struct.Data], [4 x %struct.Data]* %DataList, i32 0, i32 0
  %4 = getelementptr inbounds %struct.Data, %struct.Data* %3, i64 4
  call void @find(%struct.Data* %2, %struct.Data* %4)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
