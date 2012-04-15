; ModuleID = 'methcall.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.NthToggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)*, i32, i32 }
%struct.Toggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)* }

@.str = private constant [6 x i8] c"true\0A\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str1 = private constant [7 x i8] c"false\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

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
  %0 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 4 ; <i32*> [#uses=3]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=1]
  %2 = add nsw i32 %1, 1                          ; <i32> [#uses=2]
  store i32 %2, i32* %0, align 4
  %3 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 3 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = icmp slt i32 %2, %4                        ; <i1> [#uses=1]
  br i1 %5, label %bb1, label %bb

bb:                                               ; preds = %entry
  %6 = getelementptr inbounds %struct.NthToggle* %this, i32 0, i32 0 ; <i8*> [#uses=2]
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
  %iftmp.19.0 = phi i32 [ %3, %bb ], [ 500000000, %entry ] ; <i32> [#uses=3]
  %4 = malloc %struct.Toggle                      ; <%struct.Toggle*> [#uses=6]
  %5 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %5, align 4
  %6 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %6, align 4
  %7 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 2 ; <%struct.Toggle* (%struct.Toggle*)**> [#uses=2]
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %7, align 4
  %8 = icmp sgt i32 %iftmp.19.0, 0                ; <i1> [#uses=2]
  br i1 %8, label %bb3, label %bb5

bb3:                                              ; preds = %bb3, %bb2
  %i.04 = phi i32 [ %14, %bb3 ], [ 0, %bb2 ]      ; <i32> [#uses=1]
  %9 = load %struct.Toggle* (%struct.Toggle*)** %7, align 4 ; <%struct.Toggle* (%struct.Toggle*)*> [#uses=1]
  %10 = tail call %struct.Toggle* %9(%struct.Toggle* %4) nounwind ; <%struct.Toggle*> [#uses=1]
  %11 = getelementptr inbounds %struct.Toggle* %10, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  %12 = load i8 (%struct.Toggle*)** %11, align 4  ; <i8 (%struct.Toggle*)*> [#uses=1]
  %13 = tail call signext i8 %12(%struct.Toggle* %4) nounwind ; <i8> [#uses=1]
  %14 = add nsw i32 %i.04, 1                      ; <i32> [#uses=2]
  %exitcond10 = icmp eq i32 %14, %iftmp.19.0      ; <i1> [#uses=1]
  br i1 %exitcond10, label %bb4.bb5_crit_edge, label %bb3

bb4.bb5_crit_edge:                                ; preds = %bb3
  %phitmp8 = icmp eq i8 %13, 0                    ; <i1> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb4.bb5_crit_edge, %bb2
  %val.0.lcssa = phi i1 [ %phitmp8, %bb4.bb5_crit_edge ], [ false, %bb2 ] ; <i1> [#uses=1]
  %iftmp.20.0 = select i1 %val.0.lcssa, i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0) ; <i8*> [#uses=1]
  %15 = tail call i32 @puts(i8* %iftmp.20.0) nounwind ; <i32> [#uses=0]
  free %struct.Toggle* %4
  %16 = malloc %struct.NthToggle                  ; <%struct.NthToggle*> [#uses=7]
  %17 = getelementptr inbounds %struct.NthToggle* %16, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 1, i8* %17, align 4
  %18 = getelementptr %struct.NthToggle* %16, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %18, align 4
  %19 = getelementptr %struct.NthToggle* %16, i32 0, i32 2 ; <%struct.Toggle* (%struct.Toggle*)**> [#uses=2]
  %20 = getelementptr inbounds %struct.NthToggle* %16, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 3, i32* %20, align 4
  %21 = getelementptr inbounds %struct.NthToggle* %16, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %21, align 4
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %19, align 4
  br i1 %8, label %bb.nph, label %bb11

bb.nph:                                           ; preds = %bb5
  %22 = bitcast %struct.NthToggle* %16 to %struct.Toggle* ; <%struct.Toggle*> [#uses=2]
  br label %bb9

bb9:                                              ; preds = %bb9, %bb.nph
  %i.11 = phi i32 [ 0, %bb.nph ], [ %28, %bb9 ]   ; <i32> [#uses=1]
  %23 = load %struct.Toggle* (%struct.Toggle*)** %19, align 4 ; <%struct.Toggle* (%struct.Toggle*)*> [#uses=1]
  %24 = tail call %struct.Toggle* %23(%struct.Toggle* %22) nounwind ; <%struct.Toggle*> [#uses=1]
  %25 = getelementptr inbounds %struct.Toggle* %24, i32 0, i32 1 ; <i8 (%struct.Toggle*)**> [#uses=1]
  %26 = load i8 (%struct.Toggle*)** %25, align 4  ; <i8 (%struct.Toggle*)*> [#uses=1]
  %27 = tail call signext i8 %26(%struct.Toggle* %22) nounwind ; <i8> [#uses=1]
  %28 = add nsw i32 %i.11, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %28, %iftmp.19.0        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb10.bb11_crit_edge, label %bb9

bb10.bb11_crit_edge:                              ; preds = %bb9
  %phitmp = icmp eq i8 %27, 0                     ; <i1> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb10.bb11_crit_edge, %bb5
  %val.1.lcssa = phi i1 [ %phitmp, %bb10.bb11_crit_edge ], [ false, %bb5 ] ; <i1> [#uses=1]
  %iftmp.23.0 = select i1 %val.1.lcssa, i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0) ; <i8*> [#uses=1]
  %29 = tail call i32 @puts(i8* %iftmp.23.0) nounwind ; <i32> [#uses=0]
  free %struct.NthToggle* %16
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
