; ModuleID = 'fasta.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aminoacid_t = type { float, i8 }

@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=7]
@iub.2930 = internal global [15 x %struct.aminoacid_t] [%struct.aminoacid_t { float 0x3FD147AE20000000, i8 97 }, %struct.aminoacid_t { float 0x3FBEB851E0000000, i8 99 }, %struct.aminoacid_t { float 0x3FBEB851E0000000, i8 103 }, %struct.aminoacid_t { float 0x3FD147AE20000000, i8 116 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 66 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 68 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 72 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 75 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 77 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 78 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 82 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 83 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 86 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 87 }, %struct.aminoacid_t { float 0x3F947AE140000000, i8 89 }], align 32 ; <[15 x %struct.aminoacid_t]*> [#uses=17]
@homosapiens.2931 = internal global [4 x %struct.aminoacid_t] [%struct.aminoacid_t { float 0x3FD3639D20000000, i8 97 }, %struct.aminoacid_t { float 0x3FC957AE40000000, i8 99 }, %struct.aminoacid_t { float 0x3FC9493AE0000000, i8 103 }, %struct.aminoacid_t { float 0x3FD34BEE40000000, i8 116 }], align 32 ; <[4 x %struct.aminoacid_t]*> [#uses=6]
@.str = private constant [23 x i8] c">ONE Homo sapiens alu\0A\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str1 = private constant [288 x i8] c"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\00", align 1 ; <[288 x i8]*> [#uses=1]
@.str2 = private constant [26 x i8] c">TWO IUB ambiguity codes\0A\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str3 = private constant [31 x i8] c">THREE Homo sapiens frequency\0A\00", align 1 ; <[31 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %buf.i5 = alloca [61 x i8], align 1             ; <[61 x i8]*> [#uses=3]
  %buf.i = alloca [61 x i8], align 1              ; <[61 x i8]*> [#uses=3]
  %0 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 0, i32 0), align 32 ; <float> [#uses=1]
  %1 = fadd float %0, 0.000000e+00                ; <float> [#uses=2]
  store float %1, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 0, i32 0), align 32
  %2 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 1, i32 0), align 8 ; <float> [#uses=1]
  %3 = fadd float %2, %1                          ; <float> [#uses=2]
  store float %3, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 1, i32 0), align 8
  %4 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 2, i32 0), align 16 ; <float> [#uses=1]
  %5 = fadd float %4, %3                          ; <float> [#uses=2]
  store float %5, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 2, i32 0), align 16
  %6 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 3, i32 0), align 8 ; <float> [#uses=1]
  %7 = fadd float %6, %5                          ; <float> [#uses=2]
  store float %7, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 3, i32 0), align 8
  %8 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 4, i32 0), align 32 ; <float> [#uses=1]
  %9 = fadd float %8, %7                          ; <float> [#uses=2]
  store float %9, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 4, i32 0), align 32
  %10 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 5, i32 0), align 8 ; <float> [#uses=1]
  %11 = fadd float %10, %9                        ; <float> [#uses=2]
  store float %11, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 5, i32 0), align 8
  %12 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 6, i32 0), align 16 ; <float> [#uses=1]
  %13 = fadd float %12, %11                       ; <float> [#uses=2]
  store float %13, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 6, i32 0), align 16
  %14 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 7, i32 0), align 8 ; <float> [#uses=1]
  %15 = fadd float %14, %13                       ; <float> [#uses=2]
  store float %15, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 7, i32 0), align 8
  %16 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 8, i32 0), align 32 ; <float> [#uses=1]
  %17 = fadd float %16, %15                       ; <float> [#uses=2]
  store float %17, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 8, i32 0), align 32
  %18 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 9, i32 0), align 8 ; <float> [#uses=1]
  %19 = fadd float %18, %17                       ; <float> [#uses=2]
  store float %19, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 9, i32 0), align 8
  %20 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 10, i32 0), align 16 ; <float> [#uses=1]
  %21 = fadd float %20, %19                       ; <float> [#uses=2]
  store float %21, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 10, i32 0), align 16
  %22 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 11, i32 0), align 8 ; <float> [#uses=1]
  %23 = fadd float %22, %21                       ; <float> [#uses=2]
  store float %23, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 11, i32 0), align 8
  %24 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 12, i32 0), align 32 ; <float> [#uses=1]
  %25 = fadd float %24, %23                       ; <float> [#uses=2]
  store float %25, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 12, i32 0), align 32
  %26 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 13, i32 0), align 8 ; <float> [#uses=1]
  %27 = fadd float %26, %25                       ; <float> [#uses=2]
  store float %27, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 13, i32 0), align 8
  %28 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 14, i32 0), align 16 ; <float> [#uses=1]
  %29 = fadd float %28, %27                       ; <float> [#uses=1]
  store float %29, float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 14, i32 0), align 16
  %30 = load float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 0, i32 0), align 32 ; <float> [#uses=1]
  %31 = fadd float %30, 0.000000e+00              ; <float> [#uses=2]
  store float %31, float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 0, i32 0), align 32
  %32 = load float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 1, i32 0), align 8 ; <float> [#uses=1]
  %33 = fadd float %32, %31                       ; <float> [#uses=2]
  store float %33, float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 1, i32 0), align 8
  %34 = load float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 2, i32 0), align 16 ; <float> [#uses=1]
  %35 = fadd float %34, %33                       ; <float> [#uses=2]
  store float %35, float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 2, i32 0), align 16
  %36 = load float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 3, i32 0), align 8 ; <float> [#uses=1]
  %37 = fadd float %36, %35                       ; <float> [#uses=1]
  store float %37, float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 3, i32 0), align 8
  %38 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %39 = call i32 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 1, i32 22, %struct._IO_FILE* %38) nounwind ; <i32> [#uses=0]
  %40 = malloc [347 x i8]                         ; <[347 x i8]*> [#uses=4]
  %.sub.i = getelementptr inbounds [347 x i8]* %40, i32 0, i32 0 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %.sub.i, i8* getelementptr inbounds ([288 x i8]* @.str1, i32 0, i32 0), i32 287, i32 1) nounwind
  %41 = getelementptr inbounds [347 x i8]* %40, i32 0, i32 287 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %41, i8* getelementptr inbounds ([288 x i8]* @.str1, i32 0, i32 0), i32 60, i32 1) nounwind
  br label %bb.i30

bb.i30:                                           ; preds = %bb.i30, %entry
  %count_addr.0.i27 = phi i32 [ 10000000, %entry ], [ %51, %bb.i30 ] ; <i32> [#uses=4]
  %pos.0.i28 = phi i32 [ 0, %entry ], [ %..i, %bb.i30 ] ; <i32> [#uses=2]
  %42 = icmp ugt i32 %count_addr.0.i27, 60        ; <i1> [#uses=1]
  %min.i29 = select i1 %42, i32 60, i32 %count_addr.0.i27 ; <i32> [#uses=4]
  %43 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %44 = getelementptr inbounds [347 x i8]* %40, i32 0, i32 %pos.0.i28 ; <i8*> [#uses=1]
  %45 = call i32 @fwrite(i8* noalias %44, i32 1, i32 %min.i29, %struct._IO_FILE* noalias %43) nounwind ; <i32> [#uses=0]
  %46 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %47 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %46) nounwind ; <i32> [#uses=0]
  %48 = add i32 %min.i29, %pos.0.i28              ; <i32> [#uses=3]
  %49 = add i32 %48, -287                         ; <i32> [#uses=1]
  %50 = icmp ult i32 %48, 287                     ; <i1> [#uses=1]
  %..i = select i1 %50, i32 %48, i32 %49          ; <i32> [#uses=1]
  %51 = sub i32 %count_addr.0.i27, %min.i29       ; <i32> [#uses=1]
  %52 = icmp eq i32 %count_addr.0.i27, %min.i29   ; <i1> [#uses=1]
  br i1 %52, label %repeat_fasta.exit, label %bb.i30

repeat_fasta.exit:                                ; preds = %bb.i30
  free [347 x i8]* %40
  %53 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %54 = call i32 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 1, i32 25, %struct._IO_FILE* %53) nounwind ; <i32> [#uses=0]
  %buf6.i6 = getelementptr inbounds [61 x i8]* %buf.i5, i32 0, i32 0 ; <i8*> [#uses=1]
  br label %bb.i13

bb.i13:                                           ; preds = %bb5.i25, %repeat_fasta.exit
  %last.2863.1 = phi i32 [ 42, %repeat_fasta.exit ], [ %59, %bb5.i25 ] ; <i32> [#uses=1]
  %count_addr.0.i7 = phi i32 [ 15000000, %repeat_fasta.exit ], [ %73, %bb5.i25 ] ; <i32> [#uses=6]
  %55 = load float* getelementptr inbounds ([15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 0, i32 0), align 32 ; <float> [#uses=1]
  %tmp53 = icmp ult i32 %count_addr.0.i7, 60      ; <i1> [#uses=1]
  %tmp56 = select i1 %tmp53, i32 %count_addr.0.i7, i32 60 ; <i32> [#uses=2]
  %tmp57 = icmp ugt i32 %tmp56, 1                 ; <i1> [#uses=1]
  %umax58 = select i1 %tmp57, i32 %tmp56, i32 1   ; <i32> [#uses=1]
  br label %bb1.i16

bb1.i16:                                          ; preds = %bb4.i23, %bb.i13
  %56 = phi i32 [ %last.2863.1, %bb.i13 ], [ %59, %bb4.i23 ] ; <i32> [#uses=1]
  %pos.0.i14 = phi i32 [ 0, %bb.i13 ], [ %67, %bb4.i23 ] ; <i32> [#uses=2]
  %scevgep11.i15 = getelementptr [61 x i8]* %buf.i5, i32 0, i32 %pos.0.i14 ; <i8*> [#uses=1]
  %57 = mul i32 %56, 3877                         ; <i32> [#uses=1]
  %58 = add i32 %57, 29573                        ; <i32> [#uses=1]
  %59 = urem i32 %58, 139968                      ; <i32> [#uses=4]
  %60 = sitofp i32 %59 to float                   ; <float> [#uses=1]
  %61 = fdiv float %60, 1.399680e+05              ; <float> [#uses=2]
  %62 = fcmp olt float %55, %61                   ; <i1> [#uses=1]
  br i1 %62, label %bb2.i20, label %bb4.i23

bb2.i20:                                          ; preds = %bb2.i20, %bb1.i16
  %i.01.i17 = phi i32 [ %tmp.i18, %bb2.i20 ], [ 0, %bb1.i16 ] ; <i32> [#uses=1]
  %tmp.i18 = add i32 %i.01.i17, 1                 ; <i32> [#uses=3]
  %scevgep3.i19 = getelementptr [15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 %tmp.i18, i32 0 ; <float*> [#uses=1]
  %63 = load float* %scevgep3.i19, align 8        ; <float> [#uses=1]
  %64 = fcmp olt float %63, %61                   ; <i1> [#uses=1]
  br i1 %64, label %bb2.i20, label %bb4.i23

bb4.i23:                                          ; preds = %bb2.i20, %bb1.i16
  %i.0.lcssa.i21 = phi i32 [ 0, %bb1.i16 ], [ %tmp.i18, %bb2.i20 ] ; <i32> [#uses=1]
  %65 = getelementptr inbounds [15 x %struct.aminoacid_t]* @iub.2930, i32 0, i32 %i.0.lcssa.i21, i32 1 ; <i8*> [#uses=1]
  %66 = load i8* %65, align 4                     ; <i8> [#uses=1]
  store i8 %66, i8* %scevgep11.i15, align 1
  %67 = add i32 %pos.0.i14, 1                     ; <i32> [#uses=2]
  %exitcond59 = icmp eq i32 %67, %umax58          ; <i1> [#uses=1]
  br i1 %exitcond59, label %bb5.i25, label %bb1.i16

bb5.i25:                                          ; preds = %bb4.i23
  %68 = icmp ugt i32 %count_addr.0.i7, 60         ; <i1> [#uses=1]
  %min.i24 = select i1 %68, i32 60, i32 %count_addr.0.i7 ; <i32> [#uses=4]
  %69 = getelementptr inbounds [61 x i8]* %buf.i5, i32 0, i32 %min.i24 ; <i8*> [#uses=1]
  store i8 10, i8* %69, align 1
  %70 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %71 = add i32 %min.i24, 1                       ; <i32> [#uses=1]
  %72 = call i32 @fwrite(i8* noalias %buf6.i6, i32 1, i32 %71, %struct._IO_FILE* noalias %70) nounwind ; <i32> [#uses=0]
  %73 = sub i32 %count_addr.0.i7, %min.i24        ; <i32> [#uses=1]
  %74 = icmp eq i32 %count_addr.0.i7, %min.i24    ; <i1> [#uses=1]
  br i1 %74, label %random_fasta.exit26, label %bb.i13

random_fasta.exit26:                              ; preds = %bb5.i25
  %75 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %76 = call i32 @fwrite(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 1, i32 30, %struct._IO_FILE* %75) nounwind ; <i32> [#uses=0]
  %buf6.i = getelementptr inbounds [61 x i8]* %buf.i, i32 0, i32 0 ; <i8*> [#uses=1]
  br label %bb.i1

bb.i1:                                            ; preds = %bb5.i, %random_fasta.exit26
  %last.2863.0 = phi i32 [ %59, %random_fasta.exit26 ], [ %81, %bb5.i ] ; <i32> [#uses=1]
  %count_addr.0.i = phi i32 [ 25000000, %random_fasta.exit26 ], [ %95, %bb5.i ] ; <i32> [#uses=6]
  %77 = load float* getelementptr inbounds ([4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 0, i32 0), align 32 ; <float> [#uses=1]
  %tmp41 = icmp ult i32 %count_addr.0.i, 60       ; <i1> [#uses=1]
  %tmp43 = select i1 %tmp41, i32 %count_addr.0.i, i32 60 ; <i32> [#uses=2]
  %tmp44 = icmp ugt i32 %tmp43, 1                 ; <i1> [#uses=1]
  %umax45 = select i1 %tmp44, i32 %tmp43, i32 1   ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb4.i, %bb.i1
  %78 = phi i32 [ %last.2863.0, %bb.i1 ], [ %81, %bb4.i ] ; <i32> [#uses=1]
  %pos.0.i = phi i32 [ 0, %bb.i1 ], [ %89, %bb4.i ] ; <i32> [#uses=2]
  %scevgep11.i = getelementptr [61 x i8]* %buf.i, i32 0, i32 %pos.0.i ; <i8*> [#uses=1]
  %79 = mul i32 %78, 3877                         ; <i32> [#uses=1]
  %80 = add i32 %79, 29573                        ; <i32> [#uses=1]
  %81 = urem i32 %80, 139968                      ; <i32> [#uses=3]
  %82 = sitofp i32 %81 to float                   ; <float> [#uses=1]
  %83 = fdiv float %82, 1.399680e+05              ; <float> [#uses=2]
  %84 = fcmp olt float %77, %83                   ; <i1> [#uses=1]
  br i1 %84, label %bb2.i, label %bb4.i

bb2.i:                                            ; preds = %bb2.i, %bb1.i
  %i.01.i2 = phi i32 [ %tmp.i, %bb2.i ], [ 0, %bb1.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %i.01.i2, 1                    ; <i32> [#uses=3]
  %scevgep3.i3 = getelementptr [4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 %tmp.i, i32 0 ; <float*> [#uses=1]
  %85 = load float* %scevgep3.i3, align 8         ; <float> [#uses=1]
  %86 = fcmp olt float %85, %83                   ; <i1> [#uses=1]
  br i1 %86, label %bb2.i, label %bb4.i

bb4.i:                                            ; preds = %bb2.i, %bb1.i
  %i.0.lcssa.i = phi i32 [ 0, %bb1.i ], [ %tmp.i, %bb2.i ] ; <i32> [#uses=1]
  %87 = getelementptr inbounds [4 x %struct.aminoacid_t]* @homosapiens.2931, i32 0, i32 %i.0.lcssa.i, i32 1 ; <i8*> [#uses=1]
  %88 = load i8* %87, align 4                     ; <i8> [#uses=1]
  store i8 %88, i8* %scevgep11.i, align 1
  %89 = add i32 %pos.0.i, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %89, %umax45            ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5.i, label %bb1.i

bb5.i:                                            ; preds = %bb4.i
  %90 = icmp ugt i32 %count_addr.0.i, 60          ; <i1> [#uses=1]
  %min.i = select i1 %90, i32 60, i32 %count_addr.0.i ; <i32> [#uses=4]
  %91 = getelementptr inbounds [61 x i8]* %buf.i, i32 0, i32 %min.i ; <i8*> [#uses=1]
  store i8 10, i8* %91, align 1
  %92 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %93 = add i32 %min.i, 1                         ; <i32> [#uses=1]
  %94 = call i32 @fwrite(i8* noalias %buf6.i, i32 1, i32 %93, %struct._IO_FILE* noalias %92) nounwind ; <i32> [#uses=0]
  %95 = sub i32 %count_addr.0.i, %min.i           ; <i32> [#uses=1]
  %96 = icmp eq i32 %count_addr.0.i, %min.i       ; <i1> [#uses=1]
  br i1 %96, label %random_fasta.exit, label %bb.i1

random_fasta.exit:                                ; preds = %bb5.i
  ret i32 0
}

declare i32 @fwrite(i8* noalias nocapture, i32, i32, %struct._IO_FILE* noalias nocapture) nounwind

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind
