; ModuleID = 'objinst.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.NthToggle = type { %struct.Toggle, i32, i32 }
%struct.Toggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)* }

@.str = private constant [5 x i8] c"true\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str1 = private constant [6 x i8] c"false\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str2 = private constant [1 x i8] zeroinitializer, align 1 ; <[1 x i8]*> [#uses=1]

define internal signext i8 @toggle_value(%struct.Toggle* nocapture %this) nounwind readonly {
entry:
  %0 = getelementptr inbounds %struct.Toggle* %this, i32 0, i32 0 ; <i8*> [#uses=1]
  %1 = load i8* %0, align 4                       ; <i8> [#uses=1]
  ret i8 %1
}

define internal %struct.Toggle* @toggle_activate(%struct.Toggle* %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Toggle* %this, i32 0, i32 0 ; <i8*> [#uses=2]
  %1 = load i8* %0, align 4                       ; <i8> [#uses=1]
  %2 = icmp eq i8 %1, 0                           ; <i1> [#uses=1]
  %3 = zext i1 %2 to i8                           ; <i8> [#uses=1]
  store i8 %3, i8* %0, align 4
  ret %struct.Toggle* %this
}

define internal %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 2 ; <i32*> [#uses=3]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=1]
  %2 = add nsw i32 %1, 1                          ; <i32> [#uses=2]
  store i32 %2, i32* %0, align 4
  %3 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 1 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = icmp slt i32 %2, %4                        ; <i1> [#uses=1]
  br i1 %5, label %bb1, label %bb

bb:                                               ; preds = %entry
  %6 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 0, i32 0 ; <i8*> [#uses=2]
  %7 = load i8* %6, align 4                       ; <i8> [#uses=1]
  %8 = icmp eq i8 %7, 0                           ; <i1> [#uses=1]
  %9 = zext i1 %8 to i8                           ; <i8> [#uses=1]
  store i8 %9, i8* %6, align 4
  store i32 0, i32* %0, align 4
  ret %struct.NthToggle* %this

bb1:                                              ; preds = %entry
  ret %struct.NthToggle* %this
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.19.0 = phi i32 [ %3, %bb ], [ 70000000, %entry ] ; <i32> [#uses=3]
  %4 = malloc %struct.Toggle                      ; <%struct.Toggle*> [#uses=6]
  %5 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %5, align 4
  %6 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %6, align 4
  %7 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 2 ; <%struct.Toggle* (%struct.Toggle*)**> [#uses=2]
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %7, align 4
  br label %bb3

bb3:                                              ; preds = %bb3, %bb2
  %i.06 = phi i32 [ 0, %bb2 ], [ %15, %bb3 ]      ; <i32> [#uses=1]
  %8 = load %struct.Toggle* (%struct.Toggle*)** %7, align 4 ; <%struct.Toggle* (%struct.Toggle*)*> [#uses=1]
  %9 = tail call %struct.Toggle* %8(%struct.Toggle* %4) nounwind ; <%struct.Toggle*> [#uses=1]
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  %11 = load i8 (%struct.Toggle*)** %10, align 4  ; <i8 (%struct.Toggle*)*> [#uses=1]
  %12 = tail call signext i8 %11(%struct.Toggle* %4) nounwind ; <i8> [#uses=1]
  %13 = icmp eq i8 %12, 0                         ; <i1> [#uses=1]
  %iftmp.20.0 = select i1 %13, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0) ; <i8*> [#uses=1]
  %14 = tail call i32 @puts(i8* %iftmp.20.0) nounwind ; <i32> [#uses=0]
  %15 = add nsw i32 %i.06, 1                      ; <i32> [#uses=2]
  %exitcond11 = icmp eq i32 %15, 5                ; <i1> [#uses=1]
  br i1 %exitcond11, label %bb8, label %bb3

bb8:                                              ; preds = %bb3
  free %struct.Toggle* %4
  %16 = icmp sgt i32 %iftmp.19.0, 0               ; <i1> [#uses=2]
  br i1 %16, label %bb9, label %bb11

bb9:                                              ; preds = %bb9, %bb8
  %i.14 = phi i32 [ %19, %bb9 ], [ 0, %bb8 ]      ; <i32> [#uses=1]
  %17 = malloc %struct.Toggle                     ; <%struct.Toggle*> [#uses=2]
  %18 = getelementptr inbounds %struct.Toggle* %17, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %18, align 4
  free %struct.Toggle* %17
  %19 = add nsw i32 %i.14, 1                      ; <i32> [#uses=2]
  %exitcond10 = icmp eq i32 %19, %iftmp.19.0      ; <i1> [#uses=1]
  br i1 %exitcond10, label %bb11, label %bb9

bb11:                                             ; preds = %bb9, %bb8
  %20 = tail call i32 @puts(i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %21 = malloc %struct.NthToggle                  ; <%struct.NthToggle*> [#uses=7]
  %22 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %22, align 4
  %23 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %23, align 4
  %24 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 0, i32 2 ; <%struct.Toggle* (%struct.Toggle*)**> [#uses=2]
  %25 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 3, i32* %25, align 4
  %26 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %26, align 4
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %24, align 4
  %27 = getelementptr inbounds %struct.NthToggle* %21, i32 0, i32 0 ; <%struct.Toggle*> [#uses=2]
  br label %bb12

bb12:                                             ; preds = %bb12, %bb11
  %i.22 = phi i32 [ 0, %bb11 ], [ %35, %bb12 ]    ; <i32> [#uses=1]
  %28 = load %struct.Toggle* (%struct.Toggle*)** %24, align 4 ; <%struct.Toggle* (%struct.Toggle*)*> [#uses=1]
  %29 = tail call %struct.Toggle* %28(%struct.Toggle* %27) nounwind ; <%struct.Toggle*> [#uses=1]
  %30 = getelementptr inbounds %struct.Toggle* %29, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  %31 = load i8 (%struct.Toggle*)** %30, align 4  ; <i8 (%struct.Toggle*)*> [#uses=1]
  %32 = tail call signext i8 %31(%struct.Toggle* %27) nounwind ; <i8> [#uses=1]
  %33 = icmp eq i8 %32, 0                         ; <i1> [#uses=1]
  %Msg.0 = select i1 %33, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0) ; <i8*> [#uses=1]
  %34 = tail call i32 @puts(i8* %Msg.0) nounwind  ; <i32> [#uses=0]
  %35 = add nsw i32 %i.22, 1                      ; <i32> [#uses=2]
  %exitcond9 = icmp eq i32 %35, 8                 ; <i1> [#uses=1]
  br i1 %exitcond9, label %bb17, label %bb12

bb17:                                             ; preds = %bb12
  free %struct.NthToggle* %21
  br i1 %16, label %bb18, label %bb20

bb18:                                             ; preds = %bb18, %bb17
  %i.31 = phi i32 [ %40, %bb18 ], [ 0, %bb17 ]    ; <i32> [#uses=1]
  %36 = malloc %struct.NthToggle                  ; <%struct.NthToggle*> [#uses=4]
  %37 = getelementptr inbounds %struct.NthToggle* %36, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %37, align 4
  %38 = getelementptr inbounds %struct.NthToggle* %36, i32 0, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %38, align 4
  %39 = getelementptr inbounds %struct.NthToggle* %36, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 3, i32* %39, align 4
  free %struct.NthToggle* %36
  %40 = add nsw i32 %i.31, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %40, %iftmp.19.0        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb20, label %bb18

bb20:                                             ; preds = %bb18, %bb17
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
