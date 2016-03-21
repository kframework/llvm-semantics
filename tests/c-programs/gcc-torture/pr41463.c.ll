; ModuleID = './pr41463.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.tree_node = type { %struct.other_tree }
%struct.other_tree = type { %struct.tree_common, [14 x i32] }
%struct.tree_common = type { i32, i64, i64, i8*, i32 }
%struct.tree_vec = type { %struct.tree_common, i32, [1 x %union.tree_node*] }

@global = common global %union.tree_node zeroinitializer, align 8

; Function Attrs: noinline nounwind uwtable
define %union.tree_node* @foo(%union.tree_node* %p, i32 %i) #0 {
  %1 = alloca %union.tree_node*, align 8
  %2 = alloca i32, align 4
  %q = alloca %union.tree_node**, align 8
  store %union.tree_node* %p, %union.tree_node** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = load %union.tree_node*, %union.tree_node** %1, align 8
  %6 = bitcast %union.tree_node* %5 to %struct.tree_vec*
  %7 = getelementptr inbounds %struct.tree_vec, %struct.tree_vec* %6, i32 0, i32 2
  %8 = getelementptr inbounds [1 x %union.tree_node*], [1 x %union.tree_node*]* %7, i32 0, i64 %4
  store %union.tree_node* null, %union.tree_node** %8, align 8
  %9 = load %union.tree_node*, %union.tree_node** %1, align 8
  %10 = bitcast %union.tree_node* %9 to %struct.tree_vec*
  %11 = getelementptr inbounds %struct.tree_vec, %struct.tree_vec* %10, i32 0, i32 2
  %12 = getelementptr inbounds [1 x %union.tree_node*], [1 x %union.tree_node*]* %11, i32 0, i64 1
  store %union.tree_node** %12, %union.tree_node*** %q, align 8
  %13 = load %union.tree_node**, %union.tree_node*** %q, align 8
  store %union.tree_node* @global, %union.tree_node** %13, align 8
  %14 = load i32, i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = load %union.tree_node*, %union.tree_node** %1, align 8
  %17 = bitcast %union.tree_node* %16 to %struct.tree_vec*
  %18 = getelementptr inbounds %struct.tree_vec, %struct.tree_vec* %17, i32 0, i32 2
  %19 = getelementptr inbounds [1 x %union.tree_node*], [1 x %union.tree_node*]* %18, i32 0, i64 %15
  %20 = load %union.tree_node*, %union.tree_node** %19, align 8
  ret %union.tree_node* %20
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %p = alloca %union.tree_node*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 96) #4
  %3 = bitcast i8* %2 to %union.tree_node*
  store %union.tree_node* %3, %union.tree_node** %p, align 8
  %4 = load %union.tree_node*, %union.tree_node** %p, align 8
  %5 = call %union.tree_node* @foo(%union.tree_node* %4, i32 1)
  %6 = icmp ne %union.tree_node* %5, @global
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #5
  unreachable

; <label>:8                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
