; ModuleID = './pr41750.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo_link_hash_table = type { %struct.bfd_link_hash_table, i32*, i32* }
%struct.bfd_link_hash_table = type { i32 }
%struct.foo_link_info = type { %struct.foo_link_hash_table* }

@hash = common global %struct.foo_link_hash_table zeroinitializer, align 8
@link_info = common global %struct.foo_link_info zeroinitializer, align 8
@abfd = common global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @foo_create_got_section(i32* %abfd, %struct.foo_link_info* %info) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %1, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %2, align 8
  %3 = load i32** %1, align 8
  %4 = load %struct.foo_link_info** %2, align 8
  %5 = getelementptr inbounds %struct.foo_link_info* %4, i32 0, i32 0
  %6 = load %struct.foo_link_hash_table** %5, align 8
  %7 = getelementptr inbounds %struct.foo_link_hash_table* %6, i32 0, i32 2
  store i32* %3, i32** %7, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define i32* @elf64_ia64_check_relocs(i32* %abfd, %struct.foo_link_info* %info) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %1, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %2, align 8
  %3 = load i32** %1, align 8
  %4 = load %struct.foo_link_info** %2, align 8
  %5 = load %struct.foo_link_info** %2, align 8
  %6 = getelementptr inbounds %struct.foo_link_info* %5, i32 0, i32 0
  %7 = load %struct.foo_link_hash_table** %6, align 8
  %8 = call i32* @get_got(i32* %3, %struct.foo_link_info* %4, %struct.foo_link_hash_table* %7)
  ret i32* %8
}

; Function Attrs: nounwind uwtable
define internal i32* @get_got(i32* %abfd, %struct.foo_link_info* %info, %struct.foo_link_hash_table* %hash) #1 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca %struct.foo_link_info*, align 8
  %4 = alloca %struct.foo_link_hash_table*, align 8
  %got = alloca i32*, align 8
  %dynobj = alloca i32*, align 8
  store i32* %abfd, i32** %2, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %3, align 8
  store %struct.foo_link_hash_table* %hash, %struct.foo_link_hash_table** %4, align 8
  %5 = load %struct.foo_link_hash_table** %4, align 8
  %6 = getelementptr inbounds %struct.foo_link_hash_table* %5, i32 0, i32 2
  %7 = load i32** %6, align 8
  store i32* %7, i32** %got, align 8
  %8 = load i32** %got, align 8
  %9 = icmp ne i32* %8, null
  br i1 %9, label %30, label %10

; <label>:10                                      ; preds = %0
  %11 = load %struct.foo_link_hash_table** %4, align 8
  %12 = getelementptr inbounds %struct.foo_link_hash_table* %11, i32 0, i32 1
  %13 = load i32** %12, align 8
  store i32* %13, i32** %dynobj, align 8
  %14 = load i32** %dynobj, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %20, label %16

; <label>:16                                      ; preds = %10
  %17 = load i32** %2, align 8
  store i32* %17, i32** %dynobj, align 8
  %18 = load %struct.foo_link_hash_table** %4, align 8
  %19 = getelementptr inbounds %struct.foo_link_hash_table* %18, i32 0, i32 1
  store i32* %17, i32** %19, align 8
  br label %20

; <label>:20                                      ; preds = %16, %10
  %21 = load i32** %dynobj, align 8
  %22 = load %struct.foo_link_info** %3, align 8
  %23 = call i32 @foo_create_got_section(i32* %21, %struct.foo_link_info* %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %26, label %25

; <label>:25                                      ; preds = %20
  store i32* null, i32** %1
  br label %32

; <label>:26                                      ; preds = %20
  %27 = load %struct.foo_link_hash_table** %4, align 8
  %28 = getelementptr inbounds %struct.foo_link_hash_table* %27, i32 0, i32 2
  %29 = load i32** %28, align 8
  store i32* %29, i32** %got, align 8
  br label %30

; <label>:30                                      ; preds = %26, %0
  %31 = load i32** %got, align 8
  store i32* %31, i32** %1
  br label %32

; <label>:32                                      ; preds = %30, %25
  %33 = load i32** %1
  ret i32* %33
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store %struct.foo_link_hash_table* @hash, %struct.foo_link_hash_table** getelementptr inbounds (%struct.foo_link_info* @link_info, i32 0, i32 0), align 8
  %2 = call i32* @elf64_ia64_check_relocs(i32* @abfd, %struct.foo_link_info* @link_info)
  %3 = icmp ne i32* %2, @abfd
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
