; ModuleID = 'chomp.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._list = type { i32*, %struct._list* }
%struct._play = type { i32, i32*, %struct._list*, %struct._play* }

@wanted = internal constant %struct._list* null   ; <%struct._list**> [#uses=1]
@.str2 = private constant [33 x i8] c"Mode : 1 -> multiple first moves\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str3 = private constant [24 x i8] c"       2 -> report game\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str4 = private constant [27 x i8] c"       3 -> good positions\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str5 = private constant [14 x i8] c" Selection : \00", align 1 ; <[14 x i8]*> [#uses=1]
@.str10 = private constant [27 x i8] c"Enter number of Columns : \00", align 1 ; <[27 x i8]*> [#uses=1]
@.str11 = private constant [27 x i8] c"Enter number of Rows    : \00", align 1 ; <[27 x i8]*> [#uses=1]
@.str12 = private constant [28 x i8] c"player %d plays at (%d,%d)\0A\00", align 1 ; <[28 x i8]*> [#uses=1]
@.str13 = private constant [17 x i8] c"player %d loses\0A\00", align 1 ; <[17 x i8]*> [#uses=1]

define internal fastcc void @dump_list(%struct._list* %list) nounwind {
entry:
  %0 = icmp eq %struct._list* %list, null         ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %struct._list* %list, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %2 = load %struct._list** %1, align 4           ; <%struct._list*> [#uses=4]
  %3 = icmp eq %struct._list* %2, null            ; <i1> [#uses=1]
  br i1 %3, label %dump_list.exit, label %bb.i

bb.i:                                             ; preds = %bb
  %4 = getelementptr inbounds %struct._list* %2, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %5 = load %struct._list** %4, align 4           ; <%struct._list*> [#uses=4]
  %6 = icmp eq %struct._list* %5, null            ; <i1> [#uses=1]
  br i1 %6, label %dump_list.exit2, label %bb.i1

bb.i1:                                            ; preds = %bb.i
  %7 = getelementptr inbounds %struct._list* %5, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %8 = load %struct._list** %7, align 4           ; <%struct._list*> [#uses=4]
  %9 = icmp eq %struct._list* %8, null            ; <i1> [#uses=1]
  br i1 %9, label %dump_list.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i1
  %10 = getelementptr inbounds %struct._list* %8, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %11 = load %struct._list** %10, align 4         ; <%struct._list*> [#uses=1]
  tail call fastcc void @dump_list(%struct._list* %11) nounwind
  %12 = getelementptr inbounds %struct._list* %8, i32 0, i32 0 ; <i32**> [#uses=1]
  %13 = load i32** %12, align 4                   ; <i32*> [#uses=1]
  free i32* %13
  free %struct._list* %8
  br label %dump_list.exit.i

dump_list.exit.i:                                 ; preds = %bb.i.i, %bb.i1
  %14 = getelementptr inbounds %struct._list* %5, i32 0, i32 0 ; <i32**> [#uses=1]
  %15 = load i32** %14, align 4                   ; <i32*> [#uses=1]
  free i32* %15
  free %struct._list* %5
  br label %dump_list.exit2

dump_list.exit2:                                  ; preds = %dump_list.exit.i, %bb.i
  %16 = getelementptr inbounds %struct._list* %2, i32 0, i32 0 ; <i32**> [#uses=1]
  %17 = load i32** %16, align 4                   ; <i32*> [#uses=1]
  free i32* %17
  free %struct._list* %2
  br label %dump_list.exit

dump_list.exit:                                   ; preds = %dump_list.exit2, %bb
  %18 = getelementptr inbounds %struct._list* %list, i32 0, i32 0 ; <i32**> [#uses=1]
  %19 = load i32** %18, align 4                   ; <i32*> [#uses=1]
  free i32* %19
  free %struct._list* %list
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @dump_play(%struct._play* %play) nounwind {
entry:
  %0 = icmp eq %struct._play* %play, null         ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %struct._play* %play, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  %2 = load %struct._play** %1, align 4           ; <%struct._play*> [#uses=5]
  %3 = icmp eq %struct._play* %2, null            ; <i1> [#uses=1]
  br i1 %3, label %dump_play.exit, label %bb.i1

bb.i1:                                            ; preds = %bb
  %4 = getelementptr inbounds %struct._play* %2, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  %5 = load %struct._play** %4, align 4           ; <%struct._play*> [#uses=1]
  tail call fastcc void @dump_play(%struct._play* %5) nounwind
  %6 = getelementptr inbounds %struct._play* %2, i32 0, i32 2 ; <%struct._list**> [#uses=1]
  %7 = load %struct._list** %6, align 4           ; <%struct._list*> [#uses=4]
  %8 = icmp eq %struct._list* %7, null            ; <i1> [#uses=1]
  br i1 %8, label %dump_list.exit.i3, label %bb.i.i2

bb.i.i2:                                          ; preds = %bb.i1
  %9 = getelementptr inbounds %struct._list* %7, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %10 = load %struct._list** %9, align 4          ; <%struct._list*> [#uses=4]
  %11 = icmp eq %struct._list* %10, null          ; <i1> [#uses=1]
  br i1 %11, label %dump_list.exit.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i2
  %12 = getelementptr inbounds %struct._list* %10, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %13 = load %struct._list** %12, align 4         ; <%struct._list*> [#uses=4]
  %14 = icmp eq %struct._list* %13, null          ; <i1> [#uses=1]
  br i1 %14, label %dump_list.exit17, label %bb.i8

bb.i8:                                            ; preds = %bb.i.i.i
  %15 = getelementptr inbounds %struct._list* %13, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %16 = load %struct._list** %15, align 4         ; <%struct._list*> [#uses=4]
  %17 = icmp eq %struct._list* %16, null          ; <i1> [#uses=1]
  br i1 %17, label %dump_list.exit.i15, label %bb.i.i9

bb.i.i9:                                          ; preds = %bb.i8
  %18 = getelementptr inbounds %struct._list* %16, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %19 = load %struct._list** %18, align 4         ; <%struct._list*> [#uses=4]
  %20 = icmp eq %struct._list* %19, null          ; <i1> [#uses=1]
  br i1 %20, label %dump_list.exit2.i14, label %bb.i1.i10

bb.i1.i10:                                        ; preds = %bb.i.i9
  %21 = getelementptr inbounds %struct._list* %19, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %22 = load %struct._list** %21, align 4         ; <%struct._list*> [#uses=4]
  %23 = icmp eq %struct._list* %22, null          ; <i1> [#uses=1]
  br i1 %23, label %dump_list.exit.i.i12, label %bb.i.i.i11

bb.i.i.i11:                                       ; preds = %bb.i1.i10
  %24 = getelementptr inbounds %struct._list* %22, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %25 = load %struct._list** %24, align 4         ; <%struct._list*> [#uses=1]
  tail call fastcc void @dump_list(%struct._list* %25) nounwind
  %26 = getelementptr inbounds %struct._list* %22, i32 0, i32 0 ; <i32**> [#uses=1]
  %27 = load i32** %26, align 4                   ; <i32*> [#uses=1]
  free i32* %27
  free %struct._list* %22
  br label %dump_list.exit.i.i12

dump_list.exit.i.i12:                             ; preds = %bb.i.i.i11, %bb.i1.i10
  %28 = getelementptr inbounds %struct._list* %19, i32 0, i32 0 ; <i32**> [#uses=1]
  %29 = load i32** %28, align 4                   ; <i32*> [#uses=1]
  free i32* %29
  free %struct._list* %19
  br label %dump_list.exit2.i14

dump_list.exit2.i14:                              ; preds = %dump_list.exit.i.i12, %bb.i.i9
  %30 = getelementptr inbounds %struct._list* %16, i32 0, i32 0 ; <i32**> [#uses=1]
  %31 = load i32** %30, align 4                   ; <i32*> [#uses=1]
  free i32* %31
  free %struct._list* %16
  br label %dump_list.exit.i15

dump_list.exit.i15:                               ; preds = %dump_list.exit2.i14, %bb.i8
  %32 = getelementptr inbounds %struct._list* %13, i32 0, i32 0 ; <i32**> [#uses=1]
  %33 = load i32** %32, align 4                   ; <i32*> [#uses=1]
  free i32* %33
  free %struct._list* %13
  br label %dump_list.exit17

dump_list.exit17:                                 ; preds = %dump_list.exit.i15, %bb.i.i.i
  %34 = getelementptr inbounds %struct._list* %10, i32 0, i32 0 ; <i32**> [#uses=1]
  %35 = load i32** %34, align 4                   ; <i32*> [#uses=1]
  free i32* %35
  free %struct._list* %10
  br label %dump_list.exit.i.i

dump_list.exit.i.i:                               ; preds = %dump_list.exit17, %bb.i.i2
  %36 = getelementptr inbounds %struct._list* %7, i32 0, i32 0 ; <i32**> [#uses=1]
  %37 = load i32** %36, align 4                   ; <i32*> [#uses=1]
  free i32* %37
  free %struct._list* %7
  br label %dump_list.exit.i3

dump_list.exit.i3:                                ; preds = %dump_list.exit.i.i, %bb.i1
  %38 = getelementptr inbounds %struct._play* %2, i32 0, i32 1 ; <i32**> [#uses=1]
  %39 = load i32** %38, align 4                   ; <i32*> [#uses=1]
  free i32* %39
  free %struct._play* %2
  br label %dump_play.exit

dump_play.exit:                                   ; preds = %dump_list.exit.i3, %bb
  %40 = getelementptr inbounds %struct._play* %play, i32 0, i32 2 ; <%struct._list**> [#uses=1]
  %41 = load %struct._list** %40, align 4         ; <%struct._list*> [#uses=4]
  %42 = icmp eq %struct._list* %41, null          ; <i1> [#uses=1]
  br i1 %42, label %dump_list.exit, label %bb.i

bb.i:                                             ; preds = %dump_play.exit
  %43 = getelementptr inbounds %struct._list* %41, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %44 = load %struct._list** %43, align 4         ; <%struct._list*> [#uses=4]
  %45 = icmp eq %struct._list* %44, null          ; <i1> [#uses=1]
  br i1 %45, label %dump_list.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i
  %46 = getelementptr inbounds %struct._list* %44, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %47 = load %struct._list** %46, align 4         ; <%struct._list*> [#uses=4]
  %48 = icmp eq %struct._list* %47, null          ; <i1> [#uses=1]
  br i1 %48, label %dump_list.exit7, label %bb.i2

bb.i2:                                            ; preds = %bb.i.i
  %49 = getelementptr inbounds %struct._list* %47, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %50 = load %struct._list** %49, align 4         ; <%struct._list*> [#uses=4]
  %51 = icmp eq %struct._list* %50, null          ; <i1> [#uses=1]
  br i1 %51, label %dump_list.exit.i6, label %bb.i.i3

bb.i.i3:                                          ; preds = %bb.i2
  %52 = getelementptr inbounds %struct._list* %50, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %53 = load %struct._list** %52, align 4         ; <%struct._list*> [#uses=4]
  %54 = icmp eq %struct._list* %53, null          ; <i1> [#uses=1]
  br i1 %54, label %dump_list.exit2.i, label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i.i3
  %55 = getelementptr inbounds %struct._list* %53, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %56 = load %struct._list** %55, align 4         ; <%struct._list*> [#uses=4]
  %57 = icmp eq %struct._list* %56, null          ; <i1> [#uses=1]
  br i1 %57, label %dump_list.exit.i.i5, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb.i1.i
  %58 = getelementptr inbounds %struct._list* %56, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %59 = load %struct._list** %58, align 4         ; <%struct._list*> [#uses=1]
  tail call fastcc void @dump_list(%struct._list* %59) nounwind
  %60 = getelementptr inbounds %struct._list* %56, i32 0, i32 0 ; <i32**> [#uses=1]
  %61 = load i32** %60, align 4                   ; <i32*> [#uses=1]
  free i32* %61
  free %struct._list* %56
  br label %dump_list.exit.i.i5

dump_list.exit.i.i5:                              ; preds = %bb.i.i.i4, %bb.i1.i
  %62 = getelementptr inbounds %struct._list* %53, i32 0, i32 0 ; <i32**> [#uses=1]
  %63 = load i32** %62, align 4                   ; <i32*> [#uses=1]
  free i32* %63
  free %struct._list* %53
  br label %dump_list.exit2.i

dump_list.exit2.i:                                ; preds = %dump_list.exit.i.i5, %bb.i.i3
  %64 = getelementptr inbounds %struct._list* %50, i32 0, i32 0 ; <i32**> [#uses=1]
  %65 = load i32** %64, align 4                   ; <i32*> [#uses=1]
  free i32* %65
  free %struct._list* %50
  br label %dump_list.exit.i6

dump_list.exit.i6:                                ; preds = %dump_list.exit2.i, %bb.i2
  %66 = getelementptr inbounds %struct._list* %47, i32 0, i32 0 ; <i32**> [#uses=1]
  %67 = load i32** %66, align 4                   ; <i32*> [#uses=1]
  free i32* %67
  free %struct._list* %47
  br label %dump_list.exit7

dump_list.exit7:                                  ; preds = %dump_list.exit.i6, %bb.i.i
  %68 = getelementptr inbounds %struct._list* %44, i32 0, i32 0 ; <i32**> [#uses=1]
  %69 = load i32** %68, align 4                   ; <i32*> [#uses=1]
  free i32* %69
  free %struct._list* %44
  br label %dump_list.exit.i

dump_list.exit.i:                                 ; preds = %dump_list.exit7, %bb.i
  %70 = getelementptr inbounds %struct._list* %41, i32 0, i32 0 ; <i32**> [#uses=1]
  %71 = load i32** %70, align 4                   ; <i32*> [#uses=1]
  free i32* %71
  free %struct._list* %41
  br label %dump_list.exit

dump_list.exit:                                   ; preds = %dump_list.exit.i, %dump_play.exit
  %72 = getelementptr inbounds %struct._play* %play, i32 0, i32 1 ; <i32**> [#uses=1]
  %73 = load i32** %72, align 4                   ; <i32*> [#uses=1]
  free i32* %73
  free %struct._play* %play
  ret void

return:                                           ; preds = %entry
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() nounwind {
bb2.i.i.preheader:
  %game_tree = alloca %struct._play*, align 4     ; <%struct._play**> [#uses=5]
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %4 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([27 x i8]* @.str10, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %6 = malloc %struct._play                       ; <%struct._play*> [#uses=3]
  store %struct._play* null, %struct._play** %game_tree, align 4
  %7 = malloc [7 x i32]                           ; <[7 x i32]*> [#uses=2]
  %.sub50 = getelementptr inbounds [7 x i32]* %7, i32 0, i32 0 ; <i32*> [#uses=3]
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb2.i.i, %bb2.i.i.preheader
  %indvar.i.i3 = phi i32 [ %indvar.next.i.i5, %bb2.i.i ], [ 0, %bb2.i.i.preheader ] ; <i32> [#uses=2]
  %scevgep.i.i4 = getelementptr [7 x i32]* %7, i32 0, i32 %indvar.i.i3 ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep.i.i4, align 4
  %indvar.next.i.i5 = add i32 %indvar.i.i3, 1     ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i5, 7  ; <i1> [#uses=1]
  br i1 %exitcond.i, label %make_data.exit.i, label %bb2.i.i

make_data.exit.i:                                 ; preds = %bb2.i.i
  %.pre.i = load i32* %.sub50, align 4            ; <i32> [#uses=1]
  %phitmp.i = add i32 %.pre.i, -1                 ; <i32> [#uses=1]
  store i32 %phitmp.i, i32* %.sub50, align 4
  br label %bb5.outer.outer.i

bb.i16.i:                                         ; preds = %bb2.i17.i
  %scevgep.i15.i = getelementptr i32* %temp.0.ph.ph.i, i32 %11 ; <i32*> [#uses=1]
  %8 = load i32* %scevgep.i15.i, align 4          ; <i32> [#uses=2]
  %9 = icmp sgt i32 %8, %low.0.i.i                ; <i1> [#uses=1]
  br i1 %9, label %valid_data.exit.i, label %bb1.i.i7

bb1.i.i7:                                         ; preds = %bb.i16.i
  %10 = add i32 %11, 1                            ; <i32> [#uses=1]
  br label %bb2.i17.i

bb2.i17.i:                                        ; preds = %bb3.outer.i.i, %bb1.i.i7
  %low.0.i.i = phi i32 [ %8, %bb1.i.i7 ], [ 8, %bb3.outer.i.i ] ; <i32> [#uses=1]
  %11 = phi i32 [ %10, %bb1.i.i7 ], [ 0, %bb3.outer.i.i ] ; <i32> [#uses=3]
  %12 = icmp eq i32 %11, 7                        ; <i1> [#uses=2]
  br i1 %12, label %bb1.i8, label %bb.i16.i

valid_data.exit.i:                                ; preds = %bb.i16.i
  br i1 %12, label %bb1.i8, label %bb3.outer.i.i

bb1.i8:                                           ; preds = %valid_data.exit.i, %bb2.i17.i
  %13 = malloc %struct._play                      ; <%struct._play*> [#uses=3]
  %14 = getelementptr inbounds %struct._play* %current.0.ph.i, i32 0, i32 3 ; <%struct._play**> [#uses=6]
  store %struct._play* %13, %struct._play** %14, align 4
  %15 = load %struct._play** %game_tree, align 4  ; <%struct._play*> [#uses=1]
  %16 = icmp eq %struct._play* %15, null          ; <i1> [#uses=1]
  br i1 %16, label %bb2.i, label %bb.nph.i18.i

bb2.i:                                            ; preds = %bb1.i8
  store %struct._play* %13, %struct._play** %game_tree, align 4
  %.pre43.i = load %struct._play** %14, align 4   ; <%struct._play*> [#uses=1]
  br label %bb.nph.i18.i

bb.nph.i18.i:                                     ; preds = %bb2.i, %bb1.i8
  %17 = phi %struct._play* [ %.pre43.i, %bb2.i ], [ %13, %bb1.i8 ] ; <%struct._play*> [#uses=1]
  %18 = malloc [7 x i32]                          ; <[7 x i32]*> [#uses=2]
  %.sub49 = getelementptr inbounds [7 x i32]* %18, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb.i23.i

bb.i23.i:                                         ; preds = %bb.i23.i, %bb.nph.i18.i
  %indvar.i19.i = phi i32 [ 0, %bb.nph.i18.i ], [ %indvar.next.i21.i, %bb.i23.i ] ; <i32> [#uses=2]
  %tmp36.i = sub i32 6, %indvar.i19.i             ; <i32> [#uses=2]
  %scevgep4.i.i = getelementptr i32* %temp.0.ph.ph.i, i32 %tmp36.i ; <i32*> [#uses=1]
  %scevgep.i20.i = getelementptr [7 x i32]* %18, i32 0, i32 %tmp36.i ; <i32*> [#uses=1]
  %19 = load i32* %scevgep4.i.i, align 4          ; <i32> [#uses=1]
  store i32 %19, i32* %scevgep.i20.i, align 4
  %indvar.next.i21.i = add i32 %indvar.i19.i, 1   ; <i32> [#uses=2]
  %exitcond35.i = icmp eq i32 %indvar.next.i21.i, 7 ; <i1> [#uses=1]
  br i1 %exitcond35.i, label %bb12.preheader.i.i.preheader, label %bb.i23.i

bb12.preheader.i.i.preheader:                     ; preds = %bb.i23.i
  %20 = getelementptr inbounds %struct._play* %17, i32 0, i32 1 ; <i32**> [#uses=1]
  store i32* %.sub49, i32** %20, align 4
  %21 = load %struct._play** %14, align 4         ; <%struct._play*> [#uses=1]
  %22 = malloc %struct._list                      ; <%struct._list*> [#uses=3]
  %23 = getelementptr inbounds %struct._list* %22, i32 0, i32 1 ; <%struct._list**> [#uses=2]
  store %struct._list* null, %struct._list** %23
  br label %bb1.i1.i

bb1.i1.i:                                         ; preds = %bb13.i.i, %bb11.i.i, %bb12.preheader.i.i.preheader
  %val.i.2 = phi i32 [ %val.i.1, %bb11.i.i ], [ %val.i.1, %bb13.i.i ], [ 1, %bb12.preheader.i.i.preheader ] ; <i32> [#uses=5]
  %all_addr.i.1 = phi i32 [ %all_addr.i.0, %bb11.i.i ], [ %all_addr.i.0, %bb13.i.i ], [ %all_addr.i.7, %bb12.preheader.i.i.preheader ] ; <i32> [#uses=5]
  %row.143.i.i = phi i32 [ %row.0.i.i, %bb11.i.i ], [ %69, %bb13.i.i ], [ 0, %bb12.preheader.i.i.preheader ] ; <i32> [#uses=3]
  %col.142.i.i = phi i32 [ %67, %bb11.i.i ], [ 0, %bb13.i.i ], [ 0, %bb12.preheader.i.i.preheader ] ; <i32> [#uses=5]
  %current.141.i.i = phi %struct._list* [ %current.0.i.i, %bb11.i.i ], [ %current.0.i.i, %bb13.i.i ], [ %22, %bb12.preheader.i.i.preheader ] ; <%struct._list*> [#uses=3]
  %24 = malloc [7 x i32]                          ; <[7 x i32]*> [#uses=8]
  %25 = icmp eq i32 %col.142.i.i, 0               ; <i1> [#uses=2]
  br i1 %25, label %bb.nph.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb1.i1.i
  %count.02.i.i.i = phi i32 [ %26, %bb.i.i.i ], [ 0, %bb1.i1.i ] ; <i32> [#uses=2]
  %scevgep8.i.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %count.02.i.i.i ; <i32*> [#uses=1]
  store i32 8, i32* %scevgep8.i.i.i, align 4
  %26 = add nsw i32 %count.02.i.i.i, 1            ; <i32> [#uses=2]
  %exitcond53.i.i = icmp eq i32 %26, %col.142.i.i ; <i1> [#uses=1]
  br i1 %exitcond53.i.i, label %bb3.loopexit.i.i.i, label %bb.i.i.i

bb.nph.i.i.i:                                     ; preds = %bb3.loopexit.i.i.i, %bb1.i1.i
  %count.0.lcssa.i.i.i.reg2mem.0 = phi i32 [ %col.142.i.i, %bb3.loopexit.i.i.i ], [ 0, %bb1.i1.i ] ; <i32> [#uses=2]
  %tmp55.i.i = sub i32 7, %count.0.lcssa.i.i.i.reg2mem.0 ; <i32> [#uses=1]
  br label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb2.i.i.i, %bb.nph.i.i.i
  %indvar.i.i.i = phi i32 [ 0, %bb.nph.i.i.i ], [ %indvar.next.i.i.i, %bb2.i.i.i ] ; <i32> [#uses=2]
  %tmp57.i.i = add i32 %indvar.i.i.i, %count.0.lcssa.i.i.i.reg2mem.0 ; <i32> [#uses=1]
  %scevgep.i.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp57.i.i ; <i32*> [#uses=1]
  store i32 %row.143.i.i, i32* %scevgep.i.i.i, align 4
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=2]
  %exitcond56.i.i = icmp eq i32 %indvar.next.i.i.i, %tmp55.i.i ; <i1> [#uses=1]
  br i1 %exitcond56.i.i, label %bb.i35.i.i, label %bb2.i.i.i

bb3.loopexit.i.i.i:                               ; preds = %bb.i.i.i
  %27 = icmp eq i32 %col.142.i.i, 7               ; <i1> [#uses=1]
  br i1 %27, label %bb.i35.i.i, label %bb.nph.i.i.i

bb.i35.i.i:                                       ; preds = %bb2.backedge.i.i.i, %bb3.loopexit.i.i.i, %bb2.i.i.i
  %indvar.i31.i.i = phi i32 [ %indvar.next.i37.i.i, %bb2.backedge.i.i.i ], [ 0, %bb2.i.i.i ], [ 0, %bb3.loopexit.i.i.i ] ; <i32> [#uses=2]
  %tmp52.i.i = sub i32 6, %indvar.i31.i.i         ; <i32> [#uses=2]
  %scevgep4.i34.i.i = getelementptr i32* %temp.0.ph.ph.i, i32 %tmp52.i.i ; <i32*> [#uses=1]
  %scevgep.i33.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp52.i.i ; <i32*> [#uses=2]
  %28 = load i32* %scevgep.i33.i.i, align 4       ; <i32> [#uses=1]
  %29 = load i32* %scevgep4.i34.i.i, align 4      ; <i32> [#uses=2]
  %30 = icmp sgt i32 %28, %29                     ; <i1> [#uses=1]
  br i1 %30, label %bb1.i36.i.i, label %bb2.backedge.i.i.i

bb1.i36.i.i:                                      ; preds = %bb.i35.i.i
  store i32 %29, i32* %scevgep.i33.i.i, align 4
  br label %bb2.backedge.i.i.i

bb2.backedge.i.i.i:                               ; preds = %bb1.i36.i.i, %bb.i35.i.i
  %indvar.next.i37.i.i = add i32 %indvar.i31.i.i, 1 ; <i32> [#uses=2]
  %exitcond50.i.i = icmp eq i32 %indvar.next.i37.i.i, 7 ; <i1> [#uses=1]
  br i1 %exitcond50.i.i, label %bb.i24.i.i, label %bb.i35.i.i

bb.i24.i.i:                                       ; preds = %bb1.i27.i.i, %bb2.backedge.i.i.i
  %indvar.i22.i.i = phi i32 [ %indvar.next.i26.i.i, %bb1.i27.i.i ], [ 0, %bb2.backedge.i.i.i ] ; <i32> [#uses=2]
  %tmp2.i23.i.i = sub i32 6, %indvar.i22.i.i      ; <i32> [#uses=4]
  %31 = icmp eq i32 %tmp2.i23.i.i, -1             ; <i1> [#uses=1]
  br i1 %31, label %equal_data.exit.i.i, label %bb1.i27.i.i

bb1.i27.i.i:                                      ; preds = %bb.i24.i.i
  %scevgep3.i.i.i = getelementptr i32* %temp.0.ph.ph.i, i32 %tmp2.i23.i.i ; <i32*> [#uses=1]
  %scevgep.i25.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp2.i23.i.i ; <i32*> [#uses=1]
  %32 = load i32* %scevgep.i25.i.i, align 4       ; <i32> [#uses=1]
  %33 = load i32* %scevgep3.i.i.i, align 4        ; <i32> [#uses=1]
  %34 = icmp eq i32 %32, %33                      ; <i1> [#uses=1]
  %indvar.next.i26.i.i = add i32 %indvar.i22.i.i, 1 ; <i32> [#uses=1]
  br i1 %34, label %bb.i24.i.i, label %equal_data.exit.i.i

equal_data.exit.i.i:                              ; preds = %bb1.i27.i.i, %bb.i24.i.i
  %35 = icmp slt i32 %tmp2.i23.i.i, 0             ; <i1> [#uses=1]
  br i1 %35, label %bb8.i.i, label %bb.nph.i15.i.i

bb.nph.i15.i.i:                                   ; preds = %equal_data.exit.i.i
  %36 = malloc %struct._list                      ; <%struct._list*> [#uses=2]
  %37 = getelementptr inbounds %struct._list* %current.141.i.i, i32 0, i32 1 ; <%struct._list**> [#uses=3]
  store %struct._list* %36, %struct._list** %37, align 4
  %38 = malloc [7 x i32]                          ; <[7 x i32]*> [#uses=2]
  %.sub47 = getelementptr inbounds [7 x i32]* %38, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb.i20.i.i

bb.i20.i.i:                                       ; preds = %bb.i20.i.i, %bb.nph.i15.i.i
  %indvar.i16.i.i = phi i32 [ 0, %bb.nph.i15.i.i ], [ %indvar.next.i18.i.i, %bb.i20.i.i ] ; <i32> [#uses=2]
  %tmp49.i.i = sub i32 6, %indvar.i16.i.i         ; <i32> [#uses=2]
  %scevgep4.i.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp49.i.i ; <i32*> [#uses=1]
  %scevgep.i17.i.i = getelementptr [7 x i32]* %38, i32 0, i32 %tmp49.i.i ; <i32*> [#uses=1]
  %39 = load i32* %scevgep4.i.i.i, align 4        ; <i32> [#uses=1]
  store i32 %39, i32* %scevgep.i17.i.i, align 4
  %indvar.next.i18.i.i = add i32 %indvar.i16.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %indvar.next.i18.i.i, 7 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %copy_data.exit.i.i, label %bb.i20.i.i

copy_data.exit.i.i:                               ; preds = %bb.i20.i.i
  %40 = getelementptr inbounds %struct._list* %36, i32 0, i32 0 ; <i32**> [#uses=1]
  store i32* %.sub47, i32** %40, align 4
  %41 = load %struct._list** %37, align 4         ; <%struct._list*> [#uses=1]
  %42 = getelementptr inbounds %struct._list* %41, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  store %struct._list* null, %struct._list** %42, align 4
  %43 = load %struct._list** %37, align 4         ; <%struct._list*> [#uses=3]
  %44 = icmp eq i32 %val.i.2, 1                   ; <i1> [#uses=1]
  br i1 %44, label %bb1.i5.i.i, label %bb4.i.i

bb.i4.i.i:                                        ; preds = %equal_data.exit.i13.i.i
  %45 = getelementptr inbounds %struct._play* %search.0.i.i.i, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  br label %bb1.i5.i.i

bb1.i5.i.i:                                       ; preds = %bb.i4.i.i, %copy_data.exit.i.i
  %search.0.in.i.i.i = phi %struct._play** [ %45, %bb.i4.i.i ], [ %game_tree, %copy_data.exit.i.i ] ; <%struct._play**> [#uses=1]
  %search.0.i.i.i = load %struct._play** %search.0.in.i.i.i ; <%struct._play*> [#uses=3]
  %46 = getelementptr inbounds %struct._play* %search.0.i.i.i, i32 0, i32 1 ; <i32**> [#uses=1]
  %47 = load i32** %46, align 4                   ; <i32*> [#uses=1]
  br label %bb.i.i8.i.i

bb.i.i8.i.i:                                      ; preds = %bb1.i.i12.i.i, %bb1.i5.i.i
  %indvar.i.i6.i.i = phi i32 [ 0, %bb1.i5.i.i ], [ %indvar.next.i.i11.i.i, %bb1.i.i12.i.i ] ; <i32> [#uses=2]
  %tmp2.i.i7.i.i = sub i32 6, %indvar.i.i6.i.i    ; <i32> [#uses=4]
  %48 = icmp eq i32 %tmp2.i.i7.i.i, -1            ; <i1> [#uses=1]
  br i1 %48, label %equal_data.exit.i13.i.i, label %bb1.i.i12.i.i

bb1.i.i12.i.i:                                    ; preds = %bb.i.i8.i.i
  %scevgep.i.i10.i.i = getelementptr i32* %47, i32 %tmp2.i.i7.i.i ; <i32*> [#uses=1]
  %scevgep3.i.i9.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp2.i.i7.i.i ; <i32*> [#uses=1]
  %49 = load i32* %scevgep.i.i10.i.i, align 4     ; <i32> [#uses=1]
  %50 = load i32* %scevgep3.i.i9.i.i, align 4     ; <i32> [#uses=1]
  %51 = icmp eq i32 %49, %50                      ; <i1> [#uses=1]
  %indvar.next.i.i11.i.i = add i32 %indvar.i.i6.i.i, 1 ; <i32> [#uses=1]
  br i1 %51, label %bb.i.i8.i.i, label %equal_data.exit.i13.i.i

equal_data.exit.i13.i.i:                          ; preds = %bb1.i.i12.i.i, %bb.i.i8.i.i
  %52 = icmp slt i32 %tmp2.i.i7.i.i, 0            ; <i1> [#uses=1]
  br i1 %52, label %get_value.exit.i.i, label %bb.i4.i.i

get_value.exit.i.i:                               ; preds = %equal_data.exit.i13.i.i
  %53 = getelementptr inbounds %struct._play* %search.0.i.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %54 = load i32* %53, align 4                    ; <i32> [#uses=2]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %get_value.exit.i.i, %copy_data.exit.i.i
  %val.i.0 = phi i32 [ %54, %get_value.exit.i.i ], [ %val.i.2, %copy_data.exit.i.i ] ; <i32> [#uses=3]
  %55 = phi i32 [ %54, %get_value.exit.i.i ], [ %val.i.2, %copy_data.exit.i.i ] ; <i32> [#uses=1]
  %56 = icmp eq i32 %all_addr.i.1, 0              ; <i1> [#uses=1]
  %57 = icmp eq i32 %55, 0                        ; <i1> [#uses=1]
  %or.cond.i.i = and i1 %56, %57                  ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb2.i2.i.i, label %bb11.i.i

bb.i1.i.i:                                        ; preds = %bb2.i2.i.i
  %58 = getelementptr inbounds %struct._list* %current.0.i.i.i, i32 0, i32 0 ; <i32**> [#uses=1]
  %59 = load i32** %58, align 4                   ; <i32*> [#uses=1]
  br label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb1.i.i.i.i, %bb.i1.i.i
  %indvar.i.i.i.i = phi i32 [ 0, %bb.i1.i.i ], [ %indvar.next.i.i.i.i, %bb1.i.i.i.i ] ; <i32> [#uses=2]
  %tmp2.i.i.i.i = sub i32 6, %indvar.i.i.i.i      ; <i32> [#uses=4]
  %60 = icmp eq i32 %tmp2.i.i.i.i, -1             ; <i1> [#uses=1]
  br i1 %60, label %equal_data.exit.i.i.i, label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  %scevgep.i.i.i.i = getelementptr i32* %59, i32 %tmp2.i.i.i.i ; <i32*> [#uses=1]
  %scevgep3.i.i.i.i = getelementptr [7 x i32]* %24, i32 0, i32 %tmp2.i.i.i.i ; <i32*> [#uses=1]
  %61 = load i32* %scevgep.i.i.i.i, align 4       ; <i32> [#uses=1]
  %62 = load i32* %scevgep3.i.i.i.i, align 4      ; <i32> [#uses=1]
  %63 = icmp eq i32 %61, %62                      ; <i1> [#uses=1]
  %indvar.next.i.i.i.i = add i32 %indvar.i.i.i.i, 1 ; <i32> [#uses=1]
  br i1 %63, label %bb.i.i.i.i, label %equal_data.exit.i.i.i

equal_data.exit.i.i.i:                            ; preds = %bb1.i.i.i.i, %bb.i.i.i.i
  %64 = icmp slt i32 %tmp2.i.i.i.i, 0             ; <i1> [#uses=1]
  br i1 %64, label %bb11.i.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %equal_data.exit.i.i.i
  %65 = getelementptr inbounds %struct._list* %current.0.i.i.i, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  br label %bb2.i2.i.i

bb2.i2.i.i:                                       ; preds = %bb1.i.i.i, %bb4.i.i
  %current.0.in.i.i.i = phi %struct._list** [ %65, %bb1.i.i.i ], [ @wanted, %bb4.i.i ] ; <%struct._list**> [#uses=1]
  %current.0.i.i.i = load %struct._list** %current.0.in.i.i.i ; <%struct._list*> [#uses=3]
  %66 = icmp eq %struct._list* %current.0.i.i.i, null ; <i1> [#uses=1]
  br i1 %66, label %bb11.i.i, label %bb.i1.i.i

bb8.i.i:                                          ; preds = %equal_data.exit.i.i
  br i1 %25, label %bb9.i.i, label %bb11.i.i

bb9.i.i:                                          ; preds = %bb8.i.i
  br label %bb11.i.i

bb11.i.i:                                         ; preds = %bb9.i.i, %bb8.i.i, %bb2.i2.i.i, %equal_data.exit.i.i.i, %bb4.i.i
  %val.i.1 = phi i32 [ %val.i.2, %bb9.i.i ], [ %val.i.2, %bb8.i.i ], [ %val.i.0, %bb4.i.i ], [ %val.i.0, %equal_data.exit.i.i.i ], [ %val.i.0, %bb2.i2.i.i ] ; <i32> [#uses=4]
  %all_addr.i.0 = phi i32 [ %all_addr.i.1, %bb9.i.i ], [ %all_addr.i.1, %bb8.i.i ], [ %all_addr.i.1, %bb4.i.i ], [ 2, %equal_data.exit.i.i.i ], [ %all_addr.i.1, %bb2.i2.i.i ] ; <i32> [#uses=5]
  %current.0.i.i = phi %struct._list* [ %43, %bb4.i.i ], [ %current.141.i.i, %bb8.i.i ], [ %current.141.i.i, %bb9.i.i ], [ %43, %equal_data.exit.i.i.i ], [ %43, %bb2.i2.i.i ] ; <%struct._list*> [#uses=2]
  %col.0.i.i = phi i32 [ %col.142.i.i, %bb4.i.i ], [ 6, %bb8.i.i ], [ 6, %bb9.i.i ], [ 6, %equal_data.exit.i.i.i ], [ 6, %bb2.i2.i.i ] ; <i32> [#uses=1]
  %row.0.i.i = phi i32 [ %row.143.i.i, %bb4.i.i ], [ 7, %bb9.i.i ], [ %row.143.i.i, %bb8.i.i ], [ 7, %equal_data.exit.i.i.i ], [ 7, %bb2.i2.i.i ] ; <i32> [#uses=2]
  free [7 x i32]* %24
  %67 = add nsw i32 %col.0.i.i, 1                 ; <i32> [#uses=2]
  %68 = icmp eq i32 %67, 7                        ; <i1> [#uses=1]
  br i1 %68, label %bb13.i.i, label %bb1.i1.i

bb13.i.i:                                         ; preds = %bb11.i.i
  %69 = add nsw i32 %row.0.i.i, 1                 ; <i32> [#uses=2]
  %70 = icmp eq i32 %69, 8                        ; <i1> [#uses=1]
  br i1 %70, label %bb15.i.i, label %bb1.i1.i

bb15.i.i:                                         ; preds = %bb13.i.i
  %.pre.i.i = load %struct._list** %23            ; <%struct._list*> [#uses=2]
  free %struct._list* %22
  %71 = icmp eq %struct._list* %.pre.i.i, null    ; <i1> [#uses=1]
  %72 = sub i32 1, %val.i.1                       ; <i32> [#uses=1]
  %val.i.6 = select i1 %71, i32 %val.i.1, i32 %72 ; <i32> [#uses=1]
  %73 = getelementptr inbounds %struct._play* %21, i32 0, i32 2 ; <%struct._list**> [#uses=1]
  store %struct._list* %.pre.i.i, %struct._list** %73, align 4
  %74 = load %struct._play** %14, align 4         ; <%struct._play*> [#uses=1]
  %75 = getelementptr inbounds %struct._play* %74, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 %val.i.6, i32* %75, align 4
  %76 = load %struct._play** %14, align 4         ; <%struct._play*> [#uses=1]
  %77 = getelementptr inbounds %struct._play* %76, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  store %struct._play* null, %struct._play** %77, align 4
  %78 = load %struct._play** %14, align 4         ; <%struct._play*> [#uses=2]
  %79 = icmp eq i32 %all_addr.i.0, 2              ; <i1> [#uses=1]
  br i1 %79, label %bb.nph3.i.i, label %bb5.outer.i

bb.nph3.i.i:                                      ; preds = %bb15.i.i
  free i32* %temp.0.ph.ph.i
  %80 = malloc [7 x i32]                          ; <[7 x i32]*> [#uses=2]
  %.sub46 = getelementptr inbounds [7 x i32]* %80, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb.i.i10

bb.i.i10:                                         ; preds = %bb.i.i10, %bb.nph3.i.i
  %count.02.i.i = phi i32 [ 0, %bb.nph3.i.i ], [ %81, %bb.i.i10 ] ; <i32> [#uses=2]
  %scevgep8.i.i = getelementptr [7 x i32]* %80, i32 0, i32 %count.02.i.i ; <i32*> [#uses=1]
  store i32 8, i32* %scevgep8.i.i, align 4
  %81 = add nsw i32 %count.02.i.i, 1              ; <i32> [#uses=2]
  %exitcond34.i = icmp eq i32 %81, 7              ; <i1> [#uses=1]
  br i1 %exitcond34.i, label %bb5.outer.outer.i, label %bb.i.i10

bb5.outer.outer.i:                                ; preds = %bb.i.i10, %make_data.exit.i
  %all_addr.i.6 = phi i32 [ 1, %make_data.exit.i ], [ %all_addr.i.0, %bb.i.i10 ] ; <i32> [#uses=1]
  %current.0.ph.ph.i = phi %struct._play* [ %6, %make_data.exit.i ], [ %78, %bb.i.i10 ] ; <%struct._play*> [#uses=1]
  %temp.0.ph.ph.i = phi i32* [ %.sub50, %make_data.exit.i ], [ %.sub46, %bb.i.i10 ] ; <i32*> [#uses=6]
  br label %bb5.outer.i

bb5.outer.i:                                      ; preds = %bb5.outer.outer.i, %bb15.i.i
  %all_addr.i.7 = phi i32 [ %all_addr.i.6, %bb5.outer.outer.i ], [ %all_addr.i.0, %bb15.i.i ] ; <i32> [#uses=1]
  %current.0.ph.i = phi %struct._play* [ %current.0.ph.ph.i, %bb5.outer.outer.i ], [ %78, %bb15.i.i ] ; <%struct._play*> [#uses=1]
  br label %bb3.outer.i.i

bb3.outer.i.i:                                    ; preds = %bb2.us.i.i, %bb5.outer.i, %valid_data.exit.i
  %valid.0.ph.i.i = phi i1 [ true, %bb5.outer.i ], [ false, %bb2.us.i.i ], [ true, %valid_data.exit.i ] ; <i1> [#uses=1]
  %counter.0.ph.i.i = phi i32 [ 0, %bb5.outer.i ], [ %counter.0.us.i.i, %bb2.us.i.i ], [ 0, %valid_data.exit.i ] ; <i32> [#uses=1]
  br i1 %valid.0.ph.i.i, label %bb3.us.i.i, label %bb2.i17.i

bb3.us.i.i:                                       ; preds = %bb1.us.i.i, %bb3.outer.i.i
  %indvar.i1.i = phi i32 [ %indvar.next.i3.i, %bb1.us.i.i ], [ 0, %bb3.outer.i.i ] ; <i32> [#uses=2]
  %counter.0.us.i.i = add i32 %indvar.i1.i, %counter.0.ph.i.i ; <i32> [#uses=3]
  %scevgep.i2.i = getelementptr i32* %temp.0.ph.ph.i, i32 %counter.0.us.i.i ; <i32*> [#uses=3]
  %82 = icmp eq i32 %counter.0.us.i.i, 7          ; <i1> [#uses=1]
  br i1 %82, label %bb.nph3.i, label %bb.us.i.i

bb1.us.i.i:                                       ; preds = %bb.us.i.i
  store i32 0, i32* %scevgep.i2.i, align 4
  %indvar.next.i3.i = add i32 %indvar.i1.i, 1     ; <i32> [#uses=1]
  br label %bb3.us.i.i

bb.us.i.i:                                        ; preds = %bb3.us.i.i
  %83 = load i32* %scevgep.i2.i, align 4          ; <i32> [#uses=2]
  %84 = icmp eq i32 %83, 8                        ; <i1> [#uses=1]
  br i1 %84, label %bb1.us.i.i, label %bb2.us.i.i

bb2.us.i.i:                                       ; preds = %bb.us.i.i
  %phitmp.i.i = add i32 %83, 1                    ; <i32> [#uses=1]
  store i32 %phitmp.i.i, i32* %scevgep.i2.i, align 4
  br label %bb3.outer.i.i

bb.nph3.i:                                        ; preds = %bb3.us.i.i
  %85 = getelementptr inbounds %struct._play* %6, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  %86 = load %struct._play** %85                  ; <%struct._play*> [#uses=2]
  free %struct._play* %6
  %87 = malloc [7 x i32]                          ; <[7 x i32]*> [#uses=2]
  %.sub45 = getelementptr inbounds [7 x i32]* %87, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb.nph3.i
  %count.02.i = phi i32 [ 0, %bb.nph3.i ], [ %88, %bb.i ] ; <i32> [#uses=2]
  %scevgep8.i = getelementptr [7 x i32]* %87, i32 0, i32 %count.02.i ; <i32*> [#uses=1]
  store i32 8, i32* %scevgep8.i, align 4
  %88 = add nsw i32 %count.02.i, 1                ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %88, 7                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb7.outer, label %bb.i

bb.i1:                                            ; preds = %equal_data.exit.i
  %89 = getelementptr inbounds %struct._play* %play_addr.0.i, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  %90 = load %struct._play** %89, align 4         ; <%struct._play*> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb7, %bb.i1
  %play_addr.0.i = phi %struct._play* [ %90, %bb.i1 ], [ %86, %bb7 ] ; <%struct._play*> [#uses=3]
  %91 = getelementptr inbounds %struct._play* %play_addr.0.i, i32 0, i32 1 ; <i32**> [#uses=1]
  %92 = load i32** %91, align 4                   ; <i32*> [#uses=1]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb1.i.i, %bb1.i
  %indvar.i.i = phi i32 [ 0, %bb1.i ], [ %indvar.next.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %tmp2.i.i = sub i32 6, %indvar.i.i              ; <i32> [#uses=4]
  %93 = icmp eq i32 %tmp2.i.i, -1                 ; <i1> [#uses=1]
  br i1 %93, label %equal_data.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i.i
  %scevgep.i.i = getelementptr i32* %92, i32 %tmp2.i.i ; <i32*> [#uses=1]
  %scevgep3.i.i = getelementptr i32* %current.0, i32 %tmp2.i.i ; <i32*> [#uses=1]
  %94 = load i32* %scevgep.i.i, align 4           ; <i32> [#uses=1]
  %95 = load i32* %scevgep3.i.i, align 4          ; <i32> [#uses=1]
  %96 = icmp eq i32 %94, %95                      ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %96, label %bb.i.i, label %equal_data.exit.i

equal_data.exit.i:                                ; preds = %bb1.i.i, %bb.i.i
  %97 = icmp slt i32 %tmp2.i.i, 0                 ; <i1> [#uses=1]
  br i1 %97, label %where.exit, label %bb.i1

where.exit:                                       ; preds = %equal_data.exit.i
  %98 = getelementptr inbounds %struct._play* %play_addr.0.i, i32 0, i32 2 ; <%struct._list**> [#uses=1]
  %99 = load %struct._list** %98, align 4         ; <%struct._list*> [#uses=2]
  %100 = icmp eq %struct._list* %99, null         ; <i1> [#uses=1]
  br i1 %100, label %bb7, label %bb2.i13

bb2.i13:                                          ; preds = %get_value.exit.i, %where.exit
  %list_addr.0.i = phi %struct._list* [ %102, %get_value.exit.i ], [ %99, %where.exit ] ; <%struct._list*> [#uses=3]
  %101 = getelementptr inbounds %struct._list* %list_addr.0.i, i32 0, i32 1 ; <%struct._list**> [#uses=1]
  %102 = load %struct._list** %101, align 4       ; <%struct._list*> [#uses=2]
  %103 = icmp eq %struct._list* %102, null        ; <i1> [#uses=1]
  br i1 %103, label %bb.nph.i.i, label %bb3.i14

bb3.i14:                                          ; preds = %bb2.i13
  %104 = getelementptr inbounds %struct._list* %list_addr.0.i, i32 0, i32 0 ; <i32**> [#uses=1]
  %105 = load i32** %104, align 4                 ; <i32*> [#uses=1]
  br label %bb1.i.i16

bb.i.i15:                                         ; preds = %equal_data.exit.i.i24
  %106 = getelementptr inbounds %struct._play* %search.0.i.i, i32 0, i32 3 ; <%struct._play**> [#uses=1]
  br label %bb1.i.i16

bb1.i.i16:                                        ; preds = %bb.i.i15, %bb3.i14
  %search.0.in.i.i = phi %struct._play** [ %game_tree, %bb3.i14 ], [ %106, %bb.i.i15 ] ; <%struct._play**> [#uses=1]
  %search.0.i.i = load %struct._play** %search.0.in.i.i ; <%struct._play*> [#uses=3]
  %107 = getelementptr inbounds %struct._play* %search.0.i.i, i32 0, i32 1 ; <i32**> [#uses=1]
  %108 = load i32** %107, align 4                 ; <i32*> [#uses=1]
  br label %bb.i.i.i19

bb.i.i.i19:                                       ; preds = %bb1.i.i.i23, %bb1.i.i16
  %indvar.i.i.i17 = phi i32 [ 0, %bb1.i.i16 ], [ %indvar.next.i.i.i22, %bb1.i.i.i23 ] ; <i32> [#uses=2]
  %tmp2.i.i.i18 = sub i32 6, %indvar.i.i.i17      ; <i32> [#uses=4]
  %109 = icmp eq i32 %tmp2.i.i.i18, -1            ; <i1> [#uses=1]
  br i1 %109, label %equal_data.exit.i.i24, label %bb1.i.i.i23

bb1.i.i.i23:                                      ; preds = %bb.i.i.i19
  %scevgep.i.i.i20 = getelementptr i32* %108, i32 %tmp2.i.i.i18 ; <i32*> [#uses=1]
  %scevgep3.i.i.i21 = getelementptr i32* %105, i32 %tmp2.i.i.i18 ; <i32*> [#uses=1]
  %110 = load i32* %scevgep.i.i.i20, align 4      ; <i32> [#uses=1]
  %111 = load i32* %scevgep3.i.i.i21, align 4     ; <i32> [#uses=1]
  %112 = icmp eq i32 %110, %111                   ; <i1> [#uses=1]
  %indvar.next.i.i.i22 = add i32 %indvar.i.i.i17, 1 ; <i32> [#uses=1]
  br i1 %112, label %bb.i.i.i19, label %equal_data.exit.i.i24

equal_data.exit.i.i24:                            ; preds = %bb1.i.i.i23, %bb.i.i.i19
  %113 = icmp slt i32 %tmp2.i.i.i18, 0            ; <i1> [#uses=1]
  br i1 %113, label %get_value.exit.i, label %bb.i.i15

get_value.exit.i:                                 ; preds = %equal_data.exit.i.i24
  %114 = getelementptr inbounds %struct._play* %search.0.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %115 = load i32* %114, align 4                  ; <i32> [#uses=1]
  %116 = icmp eq i32 %115, 0                      ; <i1> [#uses=1]
  br i1 %116, label %bb.nph.i.i, label %bb2.i13

bb.nph.i.i:                                       ; preds = %get_value.exit.i, %bb2.i13
  %117 = getelementptr inbounds %struct._list* %list_addr.0.i, i32 0, i32 0 ; <i32**> [#uses=1]
  %118 = load i32** %117, align 4                 ; <i32*> [#uses=1]
  %119 = malloc [7 x i32]                         ; <[7 x i32]*> [#uses=5]
  %.sub = getelementptr inbounds [7 x i32]* %119, i32 0, i32 0 ; <i32*> [#uses=3]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %bb.nph.i.i
  %indvar.i.i27 = phi i32 [ 0, %bb.nph.i.i ], [ %indvar.next.i.i30, %bb.i1.i ] ; <i32> [#uses=2]
  %tmp2.i = sub i32 6, %indvar.i.i27              ; <i32> [#uses=2]
  %scevgep4.i.i28 = getelementptr i32* %118, i32 %tmp2.i ; <i32*> [#uses=1]
  %scevgep.i.i29 = getelementptr [7 x i32]* %119, i32 0, i32 %tmp2.i ; <i32*> [#uses=1]
  %120 = load i32* %scevgep4.i.i28, align 4       ; <i32> [#uses=1]
  store i32 %120, i32* %scevgep.i.i29, align 4
  %indvar.next.i.i30 = add i32 %indvar.i.i27, 1   ; <i32> [#uses=2]
  %exitcond.i31 = icmp eq i32 %indvar.next.i.i30, 7 ; <i1> [#uses=1]
  br i1 %exitcond.i31, label %get_good_move.exit, label %bb.i1.i

get_good_move.exit:                               ; preds = %bb.i1.i
  %121 = icmp eq [7 x i32]* %119, null            ; <i1> [#uses=1]
  br i1 %121, label %bb7, label %bb5

bb5:                                              ; preds = %get_good_move.exit
  %122 = load i32* %.sub, align 4                 ; <i32> [#uses=1]
  %123 = load i32* %current.0, align 4            ; <i32> [#uses=1]
  %124 = icmp eq i32 %122, %123                   ; <i1> [#uses=1]
  br i1 %124, label %bb.i4, label %get_real_move.exit

bb.i4:                                            ; preds = %bb.i4, %bb5
  %storemerge1.i = phi i32 [ %tmp.i, %bb.i4 ], [ 0, %bb5 ] ; <i32> [#uses=1]
  %tmp.i = add i32 %storemerge1.i, 1              ; <i32> [#uses=5]
  %scevgep3.i = getelementptr [7 x i32]* %119, i32 0, i32 %tmp.i ; <i32*> [#uses=1]
  %scevgep.i3 = getelementptr i32* %current.0, i32 %tmp.i ; <i32*> [#uses=1]
  %125 = load i32* %scevgep3.i, align 4           ; <i32> [#uses=1]
  %126 = load i32* %scevgep.i3, align 4           ; <i32> [#uses=1]
  %127 = icmp eq i32 %125, %126                   ; <i1> [#uses=1]
  br i1 %127, label %bb.i4, label %get_real_move.exit

get_real_move.exit:                               ; preds = %bb.i4, %bb5
  %col.0 = phi i32 [ 0, %bb5 ], [ %tmp.i, %bb.i4 ] ; <i32> [#uses=1]
  %storemerge.lcssa.i = phi i32 [ 0, %bb5 ], [ %tmp.i, %bb.i4 ] ; <i32> [#uses=1]
  %128 = getelementptr inbounds [7 x i32]* %119, i32 0, i32 %storemerge.lcssa.i ; <i32*> [#uses=1]
  %129 = load i32* %128, align 4                  ; <i32> [#uses=1]
  %130 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %player.1.ph, i32 %129, i32 %col.0) nounwind ; <i32> [#uses=0]
  %131 = sub i32 1, %player.1.ph                  ; <i32> [#uses=1]
  free i32* %current.0
  br label %bb7.outer

bb7.outer:                                        ; preds = %get_real_move.exit, %bb.i
  %current.0.ph = phi i32* [ %.sub, %get_real_move.exit ], [ %.sub45, %bb.i ] ; <i32*> [#uses=1]
  %player.1.ph = phi i32 [ %131, %get_real_move.exit ], [ 0, %bb.i ] ; <i32> [#uses=3]
  br label %bb7

bb7:                                              ; preds = %bb7.outer, %get_good_move.exit, %where.exit
  %current.0 = phi i32* [ %current.0.ph, %bb7.outer ], [ %.sub, %get_good_move.exit ], [ null, %where.exit ] ; <i32*> [#uses=5]
  %132 = icmp eq i32* %current.0, null            ; <i1> [#uses=1]
  br i1 %132, label %bb8, label %bb1.i

bb8:                                              ; preds = %bb7
  tail call fastcc void @dump_play(%struct._play* %86) nounwind
  %133 = sub i32 1, %player.1.ph                  ; <i32> [#uses=1]
  %134 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str13, i32 0, i32 0), i32 %133) nounwind ; <i32> [#uses=0]
  ret i32 0
}
