; ModuleID = 'lists.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.DLL = type { i32, %struct.DLL*, %struct.DLL* }

@.str = private constant [26 x i8] c"li2 and li1 are not equal\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str1 = private constant [24 x i8] c"li2 should be empty now\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str3 = private constant [42 x i8] c"li1 first value wrong, wanted %d, got %d\0A\00", align 1 ; <[42 x i8]*> [#uses=1]
@.str4 = private constant [37 x i8] c"last value wrong, wanted %d, got %d\0A\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str5 = private constant [42 x i8] c"li2 first value wrong, wanted %d, got %d\0A\00", align 1 ; <[42 x i8]*> [#uses=1]
@.str6 = private constant [35 x i8] c"li1 size wrong, wanted %d, got %d\0A\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str7 = private constant [26 x i8] c"li1 and li2 are not equal\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str8 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare void @exit(i32) noreturn nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb4.preheader, label %bb.nph

bb4.preheader:                                    ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  %phitmp = add i32 %3, -1                        ; <i32> [#uses=2]
  %4 = icmp eq i32 %phitmp, -1                    ; <i1> [#uses=1]
  br i1 %4, label %bb5, label %bb.nph

bb.nph:                                           ; preds = %bb4.preheader, %entry
  %n.0.ph.reg2mem.0 = phi i32 [ %phitmp, %bb4.preheader ], [ 2999999, %entry ] ; <i32> [#uses=1]
  %tmp = add i32 %n.0.ph.reg2mem.0, 1             ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %test_lists.exit, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %test_lists.exit ] ; <i32> [#uses=1]
  %5 = malloc [101 x %struct.DLL]                 ; <[101 x %struct.DLL]*> [#uses=15]
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb2.i.i, %bb3
  %6 = phi i32 [ 0, %bb3 ], [ %tmp65.i, %bb2.i.i ] ; <i32> [#uses=5]
  %tmp65.i = add i32 %6, 1                        ; <i32> [#uses=4]
  %scevgep20.i.i = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 %tmp65.i, i32 2 ; <%struct.DLL**> [#uses=1]
  %scevgep19.i.i = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 %tmp65.i ; <%struct.DLL*> [#uses=1]
  %scevgep.i.i = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 %6 ; <%struct.DLL*> [#uses=1]
  %scevgep17.i.i = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 %6, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %scevgep19.i.i, %struct.DLL** %scevgep17.i.i, align 4
  store %struct.DLL* %scevgep.i.i, %struct.DLL** %scevgep20.i.i, align 4
  %7 = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 %6, i32 0 ; <i32*> [#uses=1]
  store i32 %6, i32* %7
  %exitcond64.i = icmp eq i32 %tmp65.i, 100       ; <i1> [#uses=1]
  br i1 %exitcond64.i, label %list_sequence.exit.i, label %bb2.i.i

list_sequence.exit.i:                             ; preds = %bb2.i.i
  %.sub36.i = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 0 ; <%struct.DLL*> [#uses=9]
  %8 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 100 ; <%struct.DLL*> [#uses=1]
  %9 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 0, i32 2 ; <%struct.DLL**> [#uses=2]
  store %struct.DLL* %8, %struct.DLL** %9, align 4
  %10 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 100, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %.sub36.i, %struct.DLL** %10, align 4
  %11 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 99 ; <%struct.DLL*> [#uses=1]
  %12 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 100, i32 2 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %11, %struct.DLL** %12, align 4
  %13 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 100, i32 0 ; <i32*> [#uses=1]
  store i32 100, i32* %13, align 4
  %14 = getelementptr inbounds [101 x %struct.DLL]* %5, i32 0, i32 0, i32 0 ; <i32*> [#uses=2]
  store i32 100, i32* %14, align 4
  %15 = malloc [101 x %struct.DLL]                ; <[101 x %struct.DLL]*> [#uses=14]
  br label %bb.i33.i

bb.i33.i:                                         ; preds = %bb.i33.i, %list_sequence.exit.i
  %i.04.i.i = phi i32 [ 0, %list_sequence.exit.i ], [ %tmp.i, %bb.i33.i ] ; <i32> [#uses=4]
  %xp.02.i.i = phi %struct.DLL* [ %.sub36.i, %list_sequence.exit.i ], [ %20, %bb.i33.i ] ; <%struct.DLL*> [#uses=2]
  %tmp.i = add i32 %i.04.i.i, 1                   ; <i32> [#uses=4]
  %scevgep8.i.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 %tmp.i, i32 2 ; <%struct.DLL**> [#uses=1]
  %scevgep7.i.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 %tmp.i ; <%struct.DLL*> [#uses=1]
  %scevgep.i31.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 %i.04.i.i ; <%struct.DLL*> [#uses=1]
  %scevgep6.i.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 %i.04.i.i, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %scevgep7.i.i, %struct.DLL** %scevgep6.i.i, align 4
  store %struct.DLL* %scevgep.i31.i, %struct.DLL** %scevgep8.i.i, align 4
  %16 = getelementptr inbounds %struct.DLL* %xp.02.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %18 = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 %i.04.i.i, i32 0 ; <i32*> [#uses=1]
  store i32 %17, i32* %18
  %19 = getelementptr inbounds %struct.DLL* %xp.02.i.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %20 = load %struct.DLL** %19, align 4           ; <%struct.DLL*> [#uses=1]
  %exitcond.i = icmp eq i32 %tmp.i, 100           ; <i1> [#uses=1]
  br i1 %exitcond.i, label %list_copy.exit.i, label %bb.i33.i

list_copy.exit.i:                                 ; preds = %bb.i33.i
  %.sub.i = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 0 ; <%struct.DLL*> [#uses=7]
  %21 = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 100 ; <%struct.DLL*> [#uses=1]
  %22 = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 0, i32 2 ; <%struct.DLL**> [#uses=4]
  store %struct.DLL* %21, %struct.DLL** %22
  %23 = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 100, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %.sub.i, %struct.DLL** %23, align 4
  %24 = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 100, i32 0 ; <i32*> [#uses=1]
  store i32 100, i32* %24, align 4
  %25 = malloc %struct.DLL                        ; <%struct.DLL*> [#uses=8]
  %26 = getelementptr inbounds %struct.DLL* %25, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %25, %struct.DLL** %26, align 4
  %27 = getelementptr inbounds %struct.DLL* %25, i32 0, i32 2 ; <%struct.DLL**> [#uses=5]
  store %struct.DLL* %25, %struct.DLL** %27, align 4
  %28 = getelementptr inbounds %struct.DLL* %25, i32 0, i32 0 ; <i32*> [#uses=6]
  store i32 0, i32* %28, align 4
  br label %bb3.i26.i

bb.i22.i:                                         ; preds = %bb3.i26.i
  br i1 %38, label %bb.i, label %bb2.i23.i

bb2.i23.i:                                        ; preds = %bb.i22.i
  %29 = getelementptr inbounds %struct.DLL* %yp.0.i24.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %30 = load %struct.DLL** %29, align 4           ; <%struct.DLL*> [#uses=1]
  br label %bb3.i26.i

bb3.i26.i:                                        ; preds = %bb2.i23.i, %list_copy.exit.i
  %yp.0.i24.i = phi %struct.DLL* [ %.sub36.i, %list_copy.exit.i ], [ %30, %bb2.i23.i ] ; <%struct.DLL*> [#uses=3]
  %xp.0.i25.i = phi %struct.DLL* [ %.sub.i, %list_copy.exit.i ], [ %32, %bb2.i23.i ] ; <%struct.DLL*> [#uses=2]
  %31 = getelementptr inbounds %struct.DLL* %xp.0.i25.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %32 = load %struct.DLL** %31, align 4           ; <%struct.DLL*> [#uses=2]
  %33 = icmp eq %struct.DLL* %32, %.sub.i         ; <i1> [#uses=1]
  %34 = getelementptr inbounds %struct.DLL* %xp.0.i25.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=1]
  %36 = getelementptr inbounds %struct.DLL* %yp.0.i24.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4                    ; <i32> [#uses=1]
  %38 = icmp ne i32 %35, %37                      ; <i1> [#uses=2]
  br i1 %33, label %bb4.i27.i, label %bb.i22.i

bb4.i27.i:                                        ; preds = %bb3.i26.i
  br i1 %38, label %bb.i, label %list_equal.exit30.i

list_equal.exit30.i:                              ; preds = %bb4.i27.i
  %39 = getelementptr inbounds %struct.DLL* %yp.0.i24.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %40 = load %struct.DLL** %39, align 4           ; <%struct.DLL*> [#uses=1]
  %phitmp35.i = icmp eq %struct.DLL* %40, %.sub36.i ; <i1> [#uses=1]
  br i1 %phitmp35.i, label %bb2.preheader.i, label %bb.i

bb2.preheader.i:                                  ; preds = %list_equal.exit30.i
  %.idx646.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 0, i32 0 ; <i32*> [#uses=6]
  %.idx6.val47.i = load i32* %.idx646.i           ; <i32> [#uses=1]
  %41 = icmp eq i32 %.idx6.val47.i, 0             ; <i1> [#uses=2]
  br i1 %41, label %bb3.i, label %bb.nph50.i

bb.i:                                             ; preds = %list_equal.exit30.i, %bb4.i27.i, %bb.i22.i
  %42 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb.nph50.i:                                       ; preds = %bb2.preheader.i
  %43 = getelementptr inbounds [101 x %struct.DLL]* %15, i32 0, i32 0, i32 1 ; <%struct.DLL**> [#uses=2]
  br label %bb1.i20.i

bb1.i20.i:                                        ; preds = %bb1.i20.i, %bb.nph50.i
  %44 = load %struct.DLL** %43, align 4           ; <%struct.DLL*> [#uses=4]
  %45 = getelementptr inbounds %struct.DLL* %44, i32 0, i32 1 ; <%struct.DLL**> [#uses=3]
  %46 = load %struct.DLL** %45, align 4           ; <%struct.DLL*> [#uses=1]
  store %struct.DLL* %46, %struct.DLL** %43, align 4
  %47 = load %struct.DLL** %45, align 4           ; <%struct.DLL*> [#uses=1]
  %48 = getelementptr inbounds %struct.DLL* %47, i32 0, i32 2 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %.sub.i, %struct.DLL** %48, align 4
  %49 = load i32* %.idx646.i, align 4             ; <i32> [#uses=1]
  %50 = add i32 %49, -1                           ; <i32> [#uses=1]
  store i32 %50, i32* %.idx646.i, align 4
  %51 = load %struct.DLL** %27, align 4           ; <%struct.DLL*> [#uses=2]
  %52 = getelementptr inbounds %struct.DLL* %51, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %44, %struct.DLL** %52, align 4
  store %struct.DLL* %25, %struct.DLL** %45, align 4
  store %struct.DLL* %44, %struct.DLL** %27, align 4
  %53 = getelementptr inbounds %struct.DLL* %44, i32 0, i32 2 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %51, %struct.DLL** %53, align 4
  %54 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %55 = add nsw i32 %54, 1                        ; <i32> [#uses=2]
  store i32 %55, i32* %28, align 4
  %.idx6.val.i = load i32* %.idx646.i             ; <i32> [#uses=1]
  %56 = icmp eq i32 %.idx6.val.i, 0               ; <i1> [#uses=2]
  br i1 %56, label %bb3.i, label %bb1.i20.i

bb3.i:                                            ; preds = %bb1.i20.i, %bb2.preheader.i
  %.idx4.val41.i = phi i32 [ 0, %bb2.preheader.i ], [ %55, %bb1.i20.i ] ; <i32> [#uses=1]
  %.lcssa45.i = phi i1 [ %41, %bb2.preheader.i ], [ %56, %bb1.i20.i ] ; <i1> [#uses=1]
  br i1 %.lcssa45.i, label %bb6.preheader.i, label %bb4.i

bb6.preheader.i:                                  ; preds = %bb3.i
  %57 = icmp eq i32 %.idx4.val41.i, 0             ; <i1> [#uses=1]
  br i1 %57, label %bb.i16.i, label %bb1.i.i

bb4.i:                                            ; preds = %bb3.i
  %58 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb1.i.i:                                          ; preds = %bb1.i.i, %bb6.preheader.i
  %59 = load %struct.DLL** %27, align 4           ; <%struct.DLL*> [#uses=4]
  %60 = getelementptr inbounds %struct.DLL* %59, i32 0, i32 2 ; <%struct.DLL**> [#uses=2]
  %61 = load %struct.DLL** %60, align 4           ; <%struct.DLL*> [#uses=2]
  %62 = getelementptr inbounds %struct.DLL* %61, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %25, %struct.DLL** %62, align 4
  store %struct.DLL* %61, %struct.DLL** %27, align 4
  %63 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %64 = add i32 %63, -1                           ; <i32> [#uses=1]
  store i32 %64, i32* %28, align 4
  %65 = load %struct.DLL** %22, align 4           ; <%struct.DLL*> [#uses=2]
  %66 = getelementptr inbounds %struct.DLL* %65, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %59, %struct.DLL** %66, align 4
  %67 = getelementptr inbounds %struct.DLL* %59, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  store %struct.DLL* %.sub.i, %struct.DLL** %67, align 4
  store %struct.DLL* %59, %struct.DLL** %22, align 4
  store %struct.DLL* %65, %struct.DLL** %60, align 4
  %68 = load i32* %.idx646.i, align 4             ; <i32> [#uses=1]
  %69 = add nsw i32 %68, 1                        ; <i32> [#uses=1]
  store i32 %69, i32* %.idx646.i, align 4
  %.idx4.val.i = load i32* %28                    ; <i32> [#uses=1]
  %70 = icmp eq i32 %.idx4.val.i, 0               ; <i1> [#uses=1]
  br i1 %70, label %bb.i16.i, label %bb1.i.i

bb.i16.i:                                         ; preds = %bb.i16.i, %bb1.i.i, %bb6.preheader.i
  %p.0.i.i = phi %struct.DLL* [ %72, %bb.i16.i ], [ %.sub36.i, %bb1.i.i ], [ %.sub36.i, %bb6.preheader.i ] ; <%struct.DLL*> [#uses=2]
  %71 = getelementptr inbounds %struct.DLL* %p.0.i.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=2]
  %72 = load %struct.DLL** %71, align 4           ; <%struct.DLL*> [#uses=3]
  %73 = getelementptr inbounds %struct.DLL* %p.0.i.i, i32 0, i32 2 ; <%struct.DLL**> [#uses=2]
  %74 = load %struct.DLL** %73, align 4           ; <%struct.DLL*> [#uses=1]
  store %struct.DLL* %74, %struct.DLL** %71, align 4
  store %struct.DLL* %72, %struct.DLL** %73, align 4
  %75 = icmp eq %struct.DLL* %72, %.sub36.i       ; <i1> [#uses=1]
  br i1 %75, label %list_reverse.exit.i, label %bb.i16.i

list_reverse.exit.i:                              ; preds = %bb.i16.i
  %.idx14.i = getelementptr [101 x %struct.DLL]* %5, i32 0, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %.idx14.val.i = load %struct.DLL** %.idx14.i    ; <%struct.DLL*> [#uses=1]
  %76 = getelementptr inbounds %struct.DLL* %.idx14.val.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %77 = load i32* %76, align 4                    ; <i32> [#uses=2]
  %78 = icmp eq i32 %77, 100                      ; <i1> [#uses=1]
  br i1 %78, label %bb11.i, label %bb10.i

bb10.i:                                           ; preds = %list_reverse.exit.i
  %79 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([42 x i8]* @.str3, i32 0, i32 0), i32 100, i32 %77) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb11.i:                                           ; preds = %list_reverse.exit.i
  %.idx10.val.i = load %struct.DLL** %9           ; <%struct.DLL*> [#uses=1]
  %80 = getelementptr inbounds %struct.DLL* %.idx10.val.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=2]
  %82 = icmp eq i32 %81, 1                        ; <i1> [#uses=1]
  br i1 %82, label %bb13.i, label %bb12.i

bb12.i:                                           ; preds = %bb11.i
  %83 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([37 x i8]* @.str4, i32 0, i32 0), i32 100, i32 %81) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb13.i:                                           ; preds = %bb11.i
  %.idx12.i = getelementptr [101 x %struct.DLL]* %15, i32 0, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %.idx12.val.i = load %struct.DLL** %.idx12.i    ; <%struct.DLL*> [#uses=1]
  %84 = getelementptr inbounds %struct.DLL* %.idx12.val.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=2]
  %86 = icmp eq i32 %85, 100                      ; <i1> [#uses=1]
  br i1 %86, label %bb15.i, label %bb14.i

bb14.i:                                           ; preds = %bb13.i
  %87 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([42 x i8]* @.str5, i32 0, i32 0), i32 100, i32 %85) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb15.i:                                           ; preds = %bb13.i
  %.idx8.val.i = load %struct.DLL** %22           ; <%struct.DLL*> [#uses=1]
  %88 = getelementptr inbounds %struct.DLL* %.idx8.val.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %89 = load i32* %88, align 4                    ; <i32> [#uses=2]
  %90 = icmp eq i32 %89, 1                        ; <i1> [#uses=1]
  br i1 %90, label %bb17.i, label %bb16.i

bb16.i:                                           ; preds = %bb15.i
  %91 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([37 x i8]* @.str4, i32 0, i32 0), i32 100, i32 %89) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb17.i:                                           ; preds = %bb15.i
  %.idx2.val.i = load i32* %14                    ; <i32> [#uses=3]
  %92 = icmp eq i32 %.idx2.val.i, 100             ; <i1> [#uses=1]
  br i1 %92, label %bb3.i.i, label %bb18.i

bb18.i:                                           ; preds = %bb17.i
  %93 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0), i32 100, i32 %.idx2.val.i) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

bb.i.i:                                           ; preds = %bb3.i.i
  br i1 %103, label %bb20.i, label %bb2.i15.i

bb2.i15.i:                                        ; preds = %bb.i.i
  %94 = getelementptr inbounds %struct.DLL* %yp.0.i.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %95 = load %struct.DLL** %94, align 4           ; <%struct.DLL*> [#uses=1]
  br label %bb3.i.i

bb3.i.i:                                          ; preds = %bb2.i15.i, %bb17.i
  %yp.0.i.i = phi %struct.DLL* [ %95, %bb2.i15.i ], [ %.sub.i, %bb17.i ] ; <%struct.DLL*> [#uses=3]
  %xp.0.i.i = phi %struct.DLL* [ %97, %bb2.i15.i ], [ %.sub36.i, %bb17.i ] ; <%struct.DLL*> [#uses=2]
  %96 = getelementptr inbounds %struct.DLL* %xp.0.i.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %97 = load %struct.DLL** %96, align 4           ; <%struct.DLL*> [#uses=2]
  %98 = icmp eq %struct.DLL* %97, %.sub36.i       ; <i1> [#uses=1]
  %99 = getelementptr inbounds %struct.DLL* %xp.0.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = getelementptr inbounds %struct.DLL* %yp.0.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = icmp ne i32 %100, %102                   ; <i1> [#uses=2]
  br i1 %98, label %bb4.i.i, label %bb.i.i

bb4.i.i:                                          ; preds = %bb3.i.i
  br i1 %103, label %bb20.i, label %list_equal.exit.i

list_equal.exit.i:                                ; preds = %bb4.i.i
  %104 = getelementptr inbounds %struct.DLL* %yp.0.i.i, i32 0, i32 1 ; <%struct.DLL**> [#uses=1]
  %105 = load %struct.DLL** %104, align 4         ; <%struct.DLL*> [#uses=1]
  %phitmp.i = icmp eq %struct.DLL* %105, %.sub.i  ; <i1> [#uses=1]
  br i1 %phitmp.i, label %test_lists.exit, label %bb20.i

bb20.i:                                           ; preds = %list_equal.exit.i, %bb4.i.i, %bb.i.i
  %106 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

test_lists.exit:                                  ; preds = %list_equal.exit.i
  free [101 x %struct.DLL]* %5
  free [101 x %struct.DLL]* %15
  free %struct.DLL* %25
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %tmp      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb3

bb5:                                              ; preds = %test_lists.exit, %bb4.preheader
  %result.0.lcssa = phi i32 [ 0, %bb4.preheader ], [ %.idx2.val.i, %test_lists.exit ] ; <i32> [#uses=1]
  %107 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i32 %result.0.lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}
