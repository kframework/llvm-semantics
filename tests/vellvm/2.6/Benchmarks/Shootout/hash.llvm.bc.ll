; ModuleID = 'hash.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.ht_ht = type { i32, %struct.ht_node**, i32, %struct.ht_node*, i32 }
%struct.ht_node = type { i8*, i32, %struct.ht_node* }

@ht_prime_list = internal constant [28 x i32] [i32 53, i32 97, i32 193, i32 389, i32 769, i32 1543, i32 3079, i32 6151, i32 12289, i32 24593, i32 49157, i32 98317, i32 196613, i32 393241, i32 786433, i32 1572869, i32 3145739, i32 6291469, i32 12582917, i32 25165843, i32 50331653, i32 100663319, i32 201326611, i32 402653189, i32 805306457, i32 1610612741, i32 -1073741823, i32 -5], align 32 ; <[28 x i32]*> [#uses=2]
@.str = private constant [15 x i8] c"malloc ht_node\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str1 = private constant [14 x i8] c"strdup newkey\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str2 = private constant [3 x i8] c"%x\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str3 = private constant [3 x i8] c"%d\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str4 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare noalias i8* @calloc(i32, i32) nounwind

declare void @perror(i8* nocapture) nounwind

declare noalias i8* @__strdup(i8* nocapture) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %buf = alloca [32 x i8], align 1                ; <[32 x i8]*> [#uses=5]
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb2.thread

bb2.thread:                                       ; preds = %entry
  %1 = malloc %struct.ht_ht                       ; <%struct.ht_ht*> [#uses=1]
  br label %bb.i19.preheader

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = call i32 @strtol(i8* noalias nocapture %3, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=3]
  %5 = malloc %struct.ht_ht                       ; <%struct.ht_ht*> [#uses=2]
  %6 = icmp ugt i32 %4, 53                        ; <i1> [#uses=1]
  br i1 %6, label %bb.i19.preheader, label %ht_create.exit

bb.i19.preheader:                                 ; preds = %bb2, %bb2.thread
  %iftmp.27.0.reg2mem.0.ph = phi i32 [ 3500000, %bb2.thread ], [ %4, %bb2 ] ; <i32> [#uses=2]
  %.reg2mem.0.ph = phi %struct.ht_ht* [ %1, %bb2.thread ], [ %5, %bb2 ] ; <%struct.ht_ht*> [#uses=1]
  br label %bb.i19

bb.i19:                                           ; preds = %bb.i19, %bb.i19.preheader
  %i.01.i = phi i32 [ 0, %bb.i19.preheader ], [ %tmp.i17, %bb.i19 ] ; <i32> [#uses=1]
  %tmp.i17 = add i32 %i.01.i, 1                   ; <i32> [#uses=3]
  %scevgep.i18 = getelementptr [28 x i32]* @ht_prime_list, i32 0, i32 %tmp.i17 ; <i32*> [#uses=1]
  %7 = load i32* %scevgep.i18, align 4            ; <i32> [#uses=1]
  %8 = icmp ult i32 %7, %iftmp.27.0.reg2mem.0.ph  ; <i1> [#uses=1]
  br i1 %8, label %bb.i19, label %ht_create.exit

ht_create.exit:                                   ; preds = %bb.i19, %bb2
  %iftmp.27.0.reg2mem.1 = phi i32 [ %4, %bb2 ], [ %iftmp.27.0.reg2mem.0.ph, %bb.i19 ] ; <i32> [#uses=4]
  %.reg2mem.1 = phi %struct.ht_ht* [ %5, %bb2 ], [ %.reg2mem.0.ph, %bb.i19 ] ; <%struct.ht_ht*> [#uses=6]
  %i.0.lcssa.i = phi i32 [ 0, %bb2 ], [ %tmp.i17, %bb.i19 ] ; <i32> [#uses=1]
  %9 = getelementptr inbounds [28 x i32]* @ht_prime_list, i32 0, i32 %i.0.lcssa.i ; <i32*> [#uses=1]
  %10 = load i32* %9, align 4                     ; <i32> [#uses=2]
  %11 = getelementptr inbounds %struct.ht_ht* %.reg2mem.1, i32 0, i32 0 ; <i32*> [#uses=4]
  store i32 %10, i32* %11, align 4
  %12 = call noalias i8* @calloc(i32 %10, i32 4) nounwind ; <i8*> [#uses=1]
  %13 = getelementptr inbounds %struct.ht_ht* %.reg2mem.1, i32 0, i32 1 ; <%struct.ht_node***> [#uses=4]
  %.c.i = bitcast i8* %12 to %struct.ht_node**    ; <%struct.ht_node**> [#uses=1]
  store %struct.ht_node** %.c.i, %struct.ht_node*** %13
  %14 = getelementptr inbounds %struct.ht_ht* %.reg2mem.1, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %14
  %15 = getelementptr inbounds %struct.ht_ht* %.reg2mem.1, i32 0, i32 3 ; <%struct.ht_node**> [#uses=1]
  store %struct.ht_node* null, %struct.ht_node** %15
  %16 = getelementptr inbounds %struct.ht_ht* %.reg2mem.1, i32 0, i32 4 ; <i32*> [#uses=3]
  store i32 0, i32* %16
  %buf4 = getelementptr inbounds [32 x i8]* %buf, i32 0, i32 0 ; <i8*> [#uses=8]
  br label %bb6

bb3:                                              ; preds = %bb6
  %17 = call i32 (i8*, i8*, ...)* @sprintf(i8* noalias %buf4, i8* noalias getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i32 %indvar50) nounwind ; <i32> [#uses=0]
  %18 = load i8* %buf4, align 1                   ; <i8> [#uses=1]
  %19 = icmp eq i8 %18, 0                         ; <i1> [#uses=1]
  br i1 %19, label %ht_hashcode.exit.i11, label %bb.i.i9

bb.i.i9:                                          ; preds = %bb.i.i9, %bb3
  %indvar.i.i4 = phi i32 [ %tmp47, %bb.i.i9 ], [ 0, %bb3 ] ; <i32> [#uses=2]
  %val.02.i.i5 = phi i32 [ %23, %bb.i.i9 ], [ 0, %bb3 ] ; <i32> [#uses=1]
  %tmp47 = add i32 %indvar.i.i4, 1                ; <i32> [#uses=2]
  %scevgep.i.i7 = getelementptr [32 x i8]* %buf, i32 0, i32 %tmp47 ; <i8*> [#uses=1]
  %key_addr.01.i.i8 = getelementptr [32 x i8]* %buf, i32 0, i32 %indvar.i.i4 ; <i8*> [#uses=1]
  %20 = mul i32 %val.02.i.i5, 5                   ; <i32> [#uses=1]
  %21 = load i8* %key_addr.01.i.i8, align 1       ; <i8> [#uses=1]
  %22 = sext i8 %21 to i32                        ; <i32> [#uses=1]
  %23 = add i32 %22, %20                          ; <i32> [#uses=2]
  %24 = load i8* %scevgep.i.i7, align 1           ; <i8> [#uses=1]
  %25 = icmp eq i8 %24, 0                         ; <i1> [#uses=1]
  br i1 %25, label %ht_hashcode.exit.i11, label %bb.i.i9

ht_hashcode.exit.i11:                             ; preds = %bb.i.i9, %bb3
  %val.0.lcssa.i.i10 = phi i32 [ 0, %bb3 ], [ %23, %bb.i.i9 ] ; <i32> [#uses=1]
  %26 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %27 = urem i32 %val.0.lcssa.i.i10, %26          ; <i32> [#uses=1]
  %28 = load %struct.ht_node*** %13, align 4      ; <%struct.ht_node**> [#uses=1]
  %29 = getelementptr inbounds %struct.ht_node** %28, i32 %27 ; <%struct.ht_node**> [#uses=2]
  br label %bb3.i16

bb.i12:                                           ; preds = %bb3.i16
  %30 = getelementptr inbounds %struct.ht_node* %node.0.i15, i32 0, i32 0 ; <i8**> [#uses=1]
  %31 = load i8** %30, align 4                    ; <i8*> [#uses=1]
  %32 = call i32 @strcmp(i8* %buf4, i8* %31) nounwind readonly ; <i32> [#uses=1]
  %33 = icmp eq i32 %32, 0                        ; <i1> [#uses=1]
  br i1 %33, label %ht_find_new.exit, label %bb2.i13

bb2.i13:                                          ; preds = %bb.i12
  %34 = getelementptr inbounds %struct.ht_node* %node.0.i15, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  br label %bb3.i16

bb3.i16:                                          ; preds = %bb2.i13, %ht_hashcode.exit.i11
  %node.0.in.i14 = phi %struct.ht_node** [ %29, %ht_hashcode.exit.i11 ], [ %34, %bb2.i13 ] ; <%struct.ht_node**> [#uses=1]
  %prev.0.i = phi %struct.ht_node* [ null, %ht_hashcode.exit.i11 ], [ %node.0.i15, %bb2.i13 ] ; <%struct.ht_node*> [#uses=2]
  %node.0.i15 = load %struct.ht_node** %node.0.in.i14 ; <%struct.ht_node*> [#uses=5]
  %35 = icmp eq %struct.ht_node* %node.0.i15, null ; <i1> [#uses=1]
  br i1 %35, label %bb4.i, label %bb.i12

bb4.i:                                            ; preds = %bb3.i16
  %36 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %37 = add nsw i32 %36, 1                        ; <i32> [#uses=1]
  store i32 %37, i32* %16, align 4
  %38 = icmp eq %struct.ht_node* %prev.0.i, null  ; <i1> [#uses=1]
  %39 = malloc %struct.ht_node                    ; <%struct.ht_node*> [#uses=11]
  %40 = icmp eq %struct.ht_node* %39, null        ; <i1> [#uses=2]
  br i1 %38, label %bb6.i, label %bb5.i

bb5.i:                                            ; preds = %bb4.i
  br i1 %40, label %bb.i2.i, label %bb1.i3.i

bb.i2.i:                                          ; preds = %bb5.i
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0)) nounwind
  ret i32 1

bb1.i3.i:                                         ; preds = %bb5.i
  %41 = call noalias i8* @__strdup(i8* %buf4) nounwind ; <i8*> [#uses=2]
  %42 = icmp eq i8* %41, null                     ; <i1> [#uses=1]
  br i1 %42, label %bb2.i4.i, label %ht_node_create.exit5.i

bb2.i4.i:                                         ; preds = %bb1.i3.i
  call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)) nounwind
  ret i32 1

ht_node_create.exit5.i:                           ; preds = %bb1.i3.i
  %43 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* %41, i8** %43, align 4
  %44 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %44
  %45 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  store %struct.ht_node* null, %struct.ht_node** %45
  %46 = getelementptr inbounds %struct.ht_node* %prev.0.i, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  store %struct.ht_node* %39, %struct.ht_node** %46, align 4
  br label %ht_find_new.exit

bb6.i:                                            ; preds = %bb4.i
  br i1 %40, label %bb.i1.i, label %bb1.i.i

bb.i1.i:                                          ; preds = %bb6.i
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0)) nounwind
  ret i32 1

bb1.i.i:                                          ; preds = %bb6.i
  %47 = call noalias i8* @__strdup(i8* %buf4) nounwind ; <i8*> [#uses=2]
  %48 = icmp eq i8* %47, null                     ; <i1> [#uses=1]
  br i1 %48, label %bb2.i.i, label %ht_node_create.exit.i

bb2.i.i:                                          ; preds = %bb1.i.i
  call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)) nounwind
  ret i32 1

ht_node_create.exit.i:                            ; preds = %bb1.i.i
  %49 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* %47, i8** %49, align 4
  %50 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %50
  %51 = getelementptr inbounds %struct.ht_node* %39, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  store %struct.ht_node* null, %struct.ht_node** %51
  store %struct.ht_node* %39, %struct.ht_node** %29, align 4
  br label %ht_find_new.exit

ht_find_new.exit:                                 ; preds = %ht_node_create.exit.i, %ht_node_create.exit5.i, %bb.i12
  %52 = phi %struct.ht_node* [ %39, %ht_node_create.exit5.i ], [ %39, %ht_node_create.exit.i ], [ %node.0.i15, %bb.i12 ] ; <%struct.ht_node*> [#uses=1]
  %53 = getelementptr inbounds %struct.ht_node* %52, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %indvar50, i32* %53, align 4
  %phitmp = add i32 %indvar50, 1                  ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %ht_find_new.exit, %ht_create.exit
  %indvar50 = phi i32 [ 1, %ht_create.exit ], [ %phitmp, %ht_find_new.exit ] ; <i32> [#uses=4]
  %54 = icmp sgt i32 %indvar50, %iftmp.27.0.reg2mem.1 ; <i1> [#uses=1]
  br i1 %54, label %bb13.loopexit, label %bb3

bb8:                                              ; preds = %bb13.loopexit, %ht_find.exit
  %indvar = phi i32 [ %indvar.next, %ht_find.exit ], [ 0, %bb13.loopexit ] ; <i32> [#uses=2]
  %c.137 = phi i32 [ %c.1., %ht_find.exit ], [ 0, %bb13.loopexit ] ; <i32> [#uses=1]
  %i.138 = sub i32 %iftmp.27.0.reg2mem.1, %indvar ; <i32> [#uses=1]
  %55 = call i32 (i8*, i8*, ...)* @sprintf(i8* noalias %buf4, i8* noalias getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 %i.138) nounwind ; <i32> [#uses=0]
  %56 = load i8* %buf4, align 1                   ; <i8> [#uses=1]
  %57 = icmp eq i8 %56, 0                         ; <i1> [#uses=1]
  br i1 %57, label %ht_hashcode.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb8
  %indvar.i.i = phi i32 [ %tmp, %bb.i.i ], [ 0, %bb8 ] ; <i32> [#uses=2]
  %val.02.i.i = phi i32 [ %61, %bb.i.i ], [ 0, %bb8 ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar.i.i, 1                   ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr [32 x i8]* %buf, i32 0, i32 %tmp ; <i8*> [#uses=1]
  %key_addr.01.i.i = getelementptr [32 x i8]* %buf, i32 0, i32 %indvar.i.i ; <i8*> [#uses=1]
  %58 = mul i32 %val.02.i.i, 5                    ; <i32> [#uses=1]
  %59 = load i8* %key_addr.01.i.i, align 1        ; <i8> [#uses=1]
  %60 = sext i8 %59 to i32                        ; <i32> [#uses=1]
  %61 = add i32 %60, %58                          ; <i32> [#uses=2]
  %62 = load i8* %scevgep.i.i, align 1            ; <i8> [#uses=1]
  %63 = icmp eq i8 %62, 0                         ; <i1> [#uses=1]
  br i1 %63, label %ht_hashcode.exit.i, label %bb.i.i

ht_hashcode.exit.i:                               ; preds = %bb.i.i, %bb8
  %val.0.lcssa.i.i = phi i32 [ 0, %bb8 ], [ %61, %bb.i.i ] ; <i32> [#uses=1]
  %64 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %65 = urem i32 %val.0.lcssa.i.i, %64            ; <i32> [#uses=1]
  %66 = load %struct.ht_node*** %13, align 4      ; <%struct.ht_node**> [#uses=1]
  %67 = getelementptr inbounds %struct.ht_node** %66, i32 %65 ; <%struct.ht_node**> [#uses=1]
  br label %bb3.i3

bb.i2:                                            ; preds = %bb3.i3
  %68 = getelementptr inbounds %struct.ht_node* %node.0.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %69 = load i8** %68, align 4                    ; <i8*> [#uses=1]
  %70 = call i32 @strcmp(i8* %buf4, i8* %69) nounwind readonly ; <i32> [#uses=1]
  %71 = icmp eq i32 %70, 0                        ; <i1> [#uses=1]
  br i1 %71, label %ht_find.exit, label %bb2.i

bb2.i:                                            ; preds = %bb.i2
  %72 = getelementptr inbounds %struct.ht_node* %node.0.i, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  br label %bb3.i3

bb3.i3:                                           ; preds = %bb2.i, %ht_hashcode.exit.i
  %node.0.in.i = phi %struct.ht_node** [ %67, %ht_hashcode.exit.i ], [ %72, %bb2.i ] ; <%struct.ht_node**> [#uses=1]
  %node.0.i = load %struct.ht_node** %node.0.in.i ; <%struct.ht_node*> [#uses=4]
  %73 = icmp eq %struct.ht_node* %node.0.i, null  ; <i1> [#uses=1]
  br i1 %73, label %ht_find.exit, label %bb.i2

ht_find.exit:                                     ; preds = %bb3.i3, %bb.i2
  %.0.i = phi %struct.ht_node* [ %node.0.i, %bb.i2 ], [ null, %bb3.i3 ] ; <%struct.ht_node*> [#uses=1]
  %not. = icmp ne %struct.ht_node* %.0.i, null    ; <i1> [#uses=1]
  %74 = zext i1 %not. to i32                      ; <i32> [#uses=1]
  %c.1. = add i32 %74, %c.137                     ; <i32> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond43 = icmp eq i32 %indvar.next, %iftmp.27.0.reg2mem.1 ; <i1> [#uses=1]
  br i1 %exitcond43, label %bb14, label %bb8

bb13.loopexit:                                    ; preds = %bb6
  %75 = icmp sgt i32 %iftmp.27.0.reg2mem.1, 0     ; <i1> [#uses=1]
  br i1 %75, label %bb8, label %bb14

bb14:                                             ; preds = %bb13.loopexit, %ht_find.exit
  %c.1.lcssa = phi i32 [ 0, %bb13.loopexit ], [ %c.1., %ht_find.exit ] ; <i32> [#uses=1]
  %76 = load i32* %11, align 4                    ; <i32> [#uses=2]
  %77 = icmp sgt i32 %76, 0                       ; <i1> [#uses=1]
  %78 = load %struct.ht_node*** %13, align 4      ; <%struct.ht_node**> [#uses=2]
  br i1 %77, label %bb.i, label %ht_destroy.exit

bb.i:                                             ; preds = %bb3.i, %bb14
  %i.02.i = phi i32 [ %tmp.i, %bb3.i ], [ 0, %bb14 ] ; <i32> [#uses=2]
  %scevgep.i = getelementptr %struct.ht_node** %78, i32 %i.02.i ; <%struct.ht_node**> [#uses=1]
  %tmp.i = add i32 %i.02.i, 1                     ; <i32> [#uses=2]
  %79 = load %struct.ht_node** %scevgep.i, align 4 ; <%struct.ht_node*> [#uses=2]
  %80 = icmp eq %struct.ht_node* %79, null        ; <i1> [#uses=1]
  br i1 %80, label %bb3.i, label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb.i
  %next.01.i = phi %struct.ht_node* [ %82, %bb1.i ], [ %79, %bb.i ] ; <%struct.ht_node*> [#uses=3]
  %81 = getelementptr inbounds %struct.ht_node* %next.01.i, i32 0, i32 2 ; <%struct.ht_node**> [#uses=1]
  %82 = load %struct.ht_node** %81, align 4       ; <%struct.ht_node*> [#uses=2]
  %83 = getelementptr inbounds %struct.ht_node* %next.01.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %84 = load i8** %83, align 4                    ; <i8*> [#uses=1]
  free i8* %84
  free %struct.ht_node* %next.01.i
  %phitmp.i = icmp eq %struct.ht_node* %82, null  ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %bb1.i, %bb.i
  %exitcond = icmp eq i32 %tmp.i, %76             ; <i1> [#uses=1]
  br i1 %exitcond, label %ht_destroy.exit, label %bb.i

ht_destroy.exit:                                  ; preds = %bb3.i, %bb14
  free %struct.ht_node** %78
  free %struct.ht_ht* %.reg2mem.1
  %85 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %c.1.lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @sprintf(i8* nocapture, i8* nocapture, ...) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
