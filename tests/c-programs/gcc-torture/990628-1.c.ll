; ModuleID = './990628-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.data_record = type { i32, [100 x i32] }
%struct.anon = type { i64 }

@fetch.fetch_count = internal global i32 0, align 4
@data_tmp = common global %struct.data_record zeroinitializer, align 4
@sqlca = common global %struct.anon zeroinitializer, align 8
@data_ptr = common global %struct.data_record* null, align 8

; Function Attrs: nounwind uwtable
define i32 @num_records() #0 {
  ret i32 1
}

; Function Attrs: nounwind uwtable
define void @fetch() #0 {
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false)
  %1 = load i32, i32* @fetch.fetch_count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @fetch.fetch_count, align 4
  %3 = icmp sgt i32 %2, 1
  %4 = select i1 %3, i32 100, i32 0
  %5 = sext i32 %4 to i64
  store i64 %5, i64* getelementptr inbounds (%struct.anon, %struct.anon* @sqlca, i32 0, i32 0), align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @load_data() #0 {
  %p = alloca %struct.data_record*, align 8
  %num = alloca i32, align 4
  %1 = call i32 @num_records()
  store i32 %1, i32* %num, align 4
  %2 = load i32, i32* %num, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 404
  %5 = call noalias i8* @malloc(i64 %4) #1
  %6 = bitcast i8* %5 to %struct.data_record*
  store %struct.data_record* %6, %struct.data_record** @data_ptr, align 8
  %7 = load %struct.data_record*, %struct.data_record** @data_ptr, align 8
  %8 = bitcast %struct.data_record* %7 to i8*
  %9 = load i32, i32* %num, align 4
  %10 = sext i32 %9 to i64
  %11 = mul i64 %10, 404
  call void @llvm.memset.p0i8.i64(i8* %8, i8 -86, i64 %11, i32 4, i1 false)
  call void @fetch()
  %12 = load %struct.data_record*, %struct.data_record** @data_ptr, align 8
  store %struct.data_record* %12, %struct.data_record** %p, align 8
  br label %13

; <label>:13                                      ; preds = %16, %0
  %14 = load i64, i64* getelementptr inbounds (%struct.anon, %struct.anon* @sqlca, i32 0, i32 0), align 8
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %20

; <label>:16                                      ; preds = %13
  %17 = load %struct.data_record*, %struct.data_record** %p, align 8
  %18 = getelementptr inbounds %struct.data_record, %struct.data_record* %17, i32 1
  store %struct.data_record* %18, %struct.data_record** %p, align 8
  %19 = bitcast %struct.data_record* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false)
  call void @fetch()
  br label %13

; <label>:20                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @load_data()
  %2 = load %struct.data_record*, %struct.data_record** @data_ptr, align 8
  %3 = getelementptr inbounds %struct.data_record, %struct.data_record* %2, i64 0
  %4 = getelementptr inbounds %struct.data_record, %struct.data_record* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 1431655765
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
