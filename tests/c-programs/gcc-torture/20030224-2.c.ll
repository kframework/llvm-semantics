; ModuleID = './20030224-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.jint16_t, %struct.jint16_t, i32 }
%struct.jint16_t = type { i16 }

@node = common global %struct.node zeroinitializer, align 1
@node_p = global %struct.node* @node, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %marker = alloca %struct.node, align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.node, %struct.node* %marker, i32 0, i32 0
  %3 = getelementptr inbounds %struct.jint16_t, %struct.jint16_t* %2, i32 0, i32 0
  store i16 6533, i16* %3, align 1
  %4 = getelementptr inbounds %struct.node, %struct.node* %marker, i32 0, i32 1
  %5 = getelementptr inbounds %struct.jint16_t, %struct.jint16_t* %4, i32 0, i32 0
  store i16 8195, i16* %5, align 1
  %6 = getelementptr inbounds %struct.node, %struct.node* %marker, i32 0, i32 2
  %7 = load %struct.node*, %struct.node** @node_p, align 8
  %8 = getelementptr inbounds %struct.node, %struct.node* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 1
  store i32 %9, i32* %6, align 1
  %10 = getelementptr inbounds %struct.node, %struct.node* %marker, i32 0, i32 0
  %11 = getelementptr inbounds %struct.jint16_t, %struct.jint16_t* %10, i32 0, i32 0
  %12 = load i16, i16* %11, align 1
  %13 = sext i16 %12 to i32
  %14 = icmp ne i32 %13, 6533
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.node, %struct.node* %marker, i32 0, i32 1
  %18 = getelementptr inbounds %struct.jint16_t, %struct.jint16_t* %17, i32 0, i32 0
  %19 = load i16, i16* %18, align 1
  %20 = sext i16 %19 to i32
  %21 = icmp ne i32 %20, 8195
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %16
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
