; ModuleID = './zerolen-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.iso_directory_record = type { [4 x i8] }
%struct.anon = type { [1 x i8], [0 x i8] }

@entry = common global %union.iso_directory_record zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %de = alloca %union.iso_directory_record*, align 8
  store i32 0, i32* %1
  store %union.iso_directory_record* @entry, %union.iso_directory_record** %de, align 8
  %2 = load %union.iso_directory_record** %de, align 8
  call void @set(%union.iso_directory_record* %2)
  %3 = load %union.iso_directory_record** %de, align 8
  %4 = bitcast %union.iso_directory_record* %3 to %struct.anon*
  %5 = getelementptr inbounds %struct.anon* %4, i32 0, i32 0
  %6 = getelementptr inbounds [1 x i8]* %5, i32 0, i64 0
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %union.iso_directory_record** %de, align 8
  %12 = bitcast %union.iso_directory_record* %11 to %struct.anon*
  %13 = getelementptr inbounds %struct.anon* %12, i32 0, i32 1
  %14 = getelementptr inbounds [0 x i8]* %13, i32 0, i64 0
  %15 = load i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %10
  call void @exit(i32 0) #2
  unreachable

; <label>:19                                      ; preds = %10, %0
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %21 = load i32* %1
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define void @set(%union.iso_directory_record* %p) #0 {
  %1 = alloca %union.iso_directory_record*, align 8
  store %union.iso_directory_record* %p, %union.iso_directory_record** %1, align 8
  %2 = load %union.iso_directory_record** %1, align 8
  %3 = bitcast %union.iso_directory_record* %2 to [4 x i8]*
  %4 = getelementptr inbounds [4 x i8]* %3, i32 0, i64 0
  store i8 1, i8* %4, align 1
  %5 = load %union.iso_directory_record** %1, align 8
  %6 = bitcast %union.iso_directory_record* %5 to [4 x i8]*
  %7 = getelementptr inbounds [4 x i8]* %6, i32 0, i64 1
  store i8 0, i8* %7, align 1
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
