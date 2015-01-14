; ModuleID = './PALSmiddleware.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cbuffer_t = type { i32, i32, i32, i8* }
%struct.A = type { i8, i8 }

@mbuf = common global %struct.cbuffer_t zeroinitializer, align 8
@a1 = common global %struct.A zeroinitializer, align 1
@arr = common global [20 x i8] zeroinitializer, align 16
@a2 = common global %struct.A zeroinitializer, align 1
@.str = private unnamed_addr constant [15 x i8] c"a1.a8 == a2.a8\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"./PALSmiddleware.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

; Function Attrs: nounwind uwtable
define void @cbuffer_init(%struct.cbuffer_t* %buf, i8* %arr, i32 %size) #0 {
  %1 = alloca %struct.cbuffer_t*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store %struct.cbuffer_t* %buf, %struct.cbuffer_t** %1, align 8
  store i8* %arr, i8** %2, align 8
  store i32 %size, i32* %3, align 4
  %4 = load i8** %2, align 8
  %5 = load %struct.cbuffer_t** %1, align 8
  %6 = getelementptr inbounds %struct.cbuffer_t* %5, i32 0, i32 3
  store i8* %4, i8** %6, align 8
  %7 = load i32* %3, align 4
  %8 = load %struct.cbuffer_t** %1, align 8
  %9 = getelementptr inbounds %struct.cbuffer_t* %8, i32 0, i32 2
  store i32 %7, i32* %9, align 4
  %10 = load %struct.cbuffer_t** %1, align 8
  %11 = getelementptr inbounds %struct.cbuffer_t* %10, i32 0, i32 0
  store i32 0, i32* %11, align 4
  %12 = load %struct.cbuffer_t** %1, align 8
  %13 = getelementptr inbounds %struct.cbuffer_t* %12, i32 0, i32 1
  store i32 0, i32* %13, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @cbuffer_append_int8(%struct.cbuffer_t* %buf, i8 signext %n) #0 {
  %1 = alloca %struct.cbuffer_t*, align 8
  %2 = alloca i8, align 1
  store %struct.cbuffer_t* %buf, %struct.cbuffer_t** %1, align 8
  store i8 %n, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = load %struct.cbuffer_t** %1, align 8
  %5 = getelementptr inbounds %struct.cbuffer_t* %4, i32 0, i32 3
  %6 = load i8** %5, align 8
  %7 = load %struct.cbuffer_t** %1, align 8
  %8 = getelementptr inbounds %struct.cbuffer_t* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8* %6, i64 %10
  store i8 %3, i8* %11, align 1
  %12 = load %struct.cbuffer_t** %1, align 8
  %13 = getelementptr inbounds %struct.cbuffer_t* %12, i32 0, i32 0
  %14 = load i32* %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %13, align 4
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @cbuffer_retrieve_int8(%struct.cbuffer_t* %buf, i8* %n) #0 {
  %1 = alloca %struct.cbuffer_t*, align 8
  %2 = alloca i8*, align 8
  store %struct.cbuffer_t* %buf, %struct.cbuffer_t** %1, align 8
  store i8* %n, i8** %2, align 8
  %3 = load %struct.cbuffer_t** %1, align 8
  %4 = getelementptr inbounds %struct.cbuffer_t* %3, i32 0, i32 3
  %5 = load i8** %4, align 8
  %6 = load %struct.cbuffer_t** %1, align 8
  %7 = getelementptr inbounds %struct.cbuffer_t* %6, i32 0, i32 1
  %8 = load i32* %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8* %5, i64 %9
  %11 = load i8* %10, align 1
  %12 = load i8** %2, align 8
  store i8 %11, i8* %12, align 1
  %13 = load %struct.cbuffer_t** %1, align 8
  %14 = getelementptr inbounds %struct.cbuffer_t* %13, i32 0, i32 1
  %15 = load i32* %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %14, align 4
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca %struct.cbuffer_t*, align 8
  store i32 0, i32* %1
  store %struct.cbuffer_t* @mbuf, %struct.cbuffer_t** %buf, align 8
  store i8 97, i8* getelementptr inbounds (%struct.A* @a1, i32 0, i32 0), align 1
  store i8 98, i8* getelementptr inbounds (%struct.A* @a1, i32 0, i32 1), align 1
  %2 = load %struct.cbuffer_t** %buf, align 8
  call void @cbuffer_init(%struct.cbuffer_t* %2, i8* getelementptr inbounds ([20 x i8]* @arr, i32 0, i32 0), i32 20)
  %3 = load %struct.cbuffer_t** %buf, align 8
  %4 = load i8* getelementptr inbounds (%struct.A* @a1, i32 0, i32 0), align 1
  %5 = call i32 @cbuffer_append_int8(%struct.cbuffer_t* %3, i8 signext %4)
  %6 = load %struct.cbuffer_t** %buf, align 8
  %7 = call i32 @cbuffer_retrieve_int8(%struct.cbuffer_t* %6, i8* getelementptr inbounds (%struct.A* @a2, i32 0, i32 0))
  %8 = load i8* getelementptr inbounds (%struct.A* @a1, i32 0, i32 0), align 1
  %9 = sext i8 %8 to i32
  %10 = load i8* getelementptr inbounds (%struct.A* @a2, i32 0, i32 0), align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %9, %11
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  br label %16

; <label>:14                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 66, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #2
  unreachable
                                                  ; No predecessors!
  br label %16

; <label>:16                                      ; preds = %15, %13
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
