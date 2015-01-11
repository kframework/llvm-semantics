; ModuleID = './960117-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.T_VALS = type <{ i8* }>
%struct.T_VAL = type <{ i16, %union.T_VALS }>

@curval = global { i16, %union.T_VALS } zeroinitializer, align 2
@idc = internal global i16 0, align 2
@id_space = internal global [2 x [33 x i8]] zeroinitializer, align 16
@cur_line = internal global i32 0, align 4
@char_pos = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define zeroext i16 @get_id(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  store i8 %c, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = load i8** getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 1, i32 0), align 2
  %4 = getelementptr inbounds i8* %3, i64 0
  store i8 %2, i8* %4, align 1
  ret i16 0
}

; Function Attrs: nounwind uwtable
define zeroext i16 @get_tok() #0 {
  %c = alloca i8, align 1
  store i8 99, i8* %c, align 1
  %1 = load i16* @idc, align 2
  %2 = sext i16 %1 to i64
  %3 = getelementptr inbounds [2 x [33 x i8]]* @id_space, i32 0, i64 %2
  %4 = getelementptr inbounds [33 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 1, i32 0), align 2
  %5 = load i32* @cur_line, align 4
  %6 = shl i32 %5, 10
  %7 = load i32* @char_pos, align 4
  %8 = or i32 %6, %7
  %9 = trunc i32 %8 to i16
  store i16 %9, i16* getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 0), align 2
  %10 = load i8* %c, align 1
  %11 = call zeroext i16 @get_id(i8 signext %10)
  ret i16 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call zeroext i16 @get_tok()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %4 = load i32* %1
  ret i32 %4
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
