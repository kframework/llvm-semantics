; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/fib.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %a.i = alloca [3 x i32], align 4
  %0 = bitcast [3 x i32]* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arraydecay.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 0
  %add.ptr41.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 2
  %add.ptr.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 1
  br label %for.body.i

for.body.i:                                       ; preds = %if.end38.i, %entry
  %1 = phi i32 [ 0, %entry ], [ %2, %if.end38.i ]
  %storemerge123.i = phi i32* [ %arraydecay.i, %entry ], [ %storemerge1.i, %if.end38.i ]
  %2 = add i32 %1, 1
  %cmp3.i = icmp ult i32 %1, 2
  br i1 %cmp3.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body.i
  store i32 %1, i32* %storemerge123.i, align 4
  br label %if.end38.i

if.else.i:                                        ; preds = %for.body.i
  %cmp8.i = icmp eq i32* %storemerge123.i, %arraydecay.i
  br i1 %cmp8.i, label %if.then9.i, label %if.else16.i

if.then9.i:                                       ; preds = %if.else.i
  %tmp11.i = load i32* %add.ptr.i, align 4
  %tmp14.i = load i32* %add.ptr41.i, align 4
  %add.i = add i32 %tmp14.i, %tmp11.i
  store i32 %add.i, i32* %storemerge123.i, align 4
  br label %if.end38.i

if.else16.i:                                      ; preds = %if.else.i
  %cmp20.i = icmp eq i32* %storemerge123.i, %add.ptr.i
  %tmp23.i = load i32* %arraydecay.i, align 4
  br i1 %cmp20.i, label %if.then21.i, label %if.else29.i

if.then21.i:                                      ; preds = %if.else16.i
  %tmp26.i = load i32* %add.ptr41.i, align 4
  %add27.i = add i32 %tmp26.i, %tmp23.i
  store i32 %add27.i, i32* %storemerge123.i, align 4
  br label %if.end38.i

if.else29.i:                                      ; preds = %if.else16.i
  %tmp34.i = load i32* %add.ptr.i, align 4
  %add35.i = add i32 %tmp34.i, %tmp23.i
  store i32 %add35.i, i32* %storemerge123.i, align 4
  br label %if.end38.i

if.end38.i:                                       ; preds = %if.else29.i, %if.then21.i, %if.then9.i, %if.then.i
  %incdec.ptr.i = getelementptr inbounds i32* %storemerge123.i, i64 1
  %cmp42.i = icmp ugt i32* %incdec.ptr.i, %add.ptr41.i
  %storemerge1.i = select i1 %cmp42.i, i32* %arraydecay.i, i32* %incdec.ptr.i
  %exitcond = icmp eq i32 %2, 11
  br i1 %exitcond, label %fastfib.exit, label %for.body.i

fastfib.exit:                                     ; preds = %if.end38.i
  %call = call i32 @fib(i32 10)
  %cmp49.i = icmp eq i32* %storemerge1.i, %arraydecay.i
  %add.ptr51.i = getelementptr inbounds i32* %storemerge1.i, i64 2
  %sub.ptr.i = getelementptr inbounds i32* %storemerge1.i, i64 -1
  %cond.in.i = select i1 %cmp49.i, i32* %add.ptr51.i, i32* %sub.ptr.i
  %cond.i = load i32* %cond.in.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %add3 = add i32 %cond.i, %call
  %add6 = add i32 %add3, 55
  ret i32 %add6
}

define i32 @fib(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i32 %n, 2
  br i1 %cmp, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %sub = add i32 %n, -1
  %call = tail call i32 @fib(i32 %sub)
  %sub4 = add i32 %n, -2
  %call5 = tail call i32 @fib(i32 %sub4)
  %add = add i32 %call5, %call
  ret i32 %add

cond.end:                                         ; preds = %entry
  ret i32 %n
}

define i32 @fastfib(i32 %n) nounwind uwtable {
entry:
  %a = alloca [3 x i32], align 4
  %arraydecay = getelementptr inbounds [3 x i32]* %a, i64 0, i64 0
  %add.ptr41 = getelementptr inbounds [3 x i32]* %a, i64 0, i64 2
  %add.ptr = getelementptr inbounds [3 x i32]* %a, i64 0, i64 1
  br label %for.body

for.body:                                         ; preds = %entry, %if.end38
  %0 = phi i32 [ 0, %entry ], [ %inc, %if.end38 ]
  %storemerge123 = phi i32* [ %arraydecay, %entry ], [ %storemerge1, %if.end38 ]
  %inc = add i32 %0, 1
  %cmp3 = icmp ult i32 %0, 2
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 %0, i32* %storemerge123, align 4
  br label %if.end38

if.else:                                          ; preds = %for.body
  %cmp8 = icmp eq i32* %storemerge123, %arraydecay
  br i1 %cmp8, label %if.then9, label %if.else16

if.then9:                                         ; preds = %if.else
  %tmp11 = load i32* %add.ptr, align 4
  %tmp14 = load i32* %add.ptr41, align 4
  %add = add i32 %tmp14, %tmp11
  store i32 %add, i32* %storemerge123, align 4
  br label %if.end38

if.else16:                                        ; preds = %if.else
  %cmp20 = icmp eq i32* %storemerge123, %add.ptr
  %tmp23 = load i32* %arraydecay, align 4
  br i1 %cmp20, label %if.then21, label %if.else29

if.then21:                                        ; preds = %if.else16
  %tmp26 = load i32* %add.ptr41, align 4
  %add27 = add i32 %tmp26, %tmp23
  store i32 %add27, i32* %storemerge123, align 4
  br label %if.end38

if.else29:                                        ; preds = %if.else16
  %tmp34 = load i32* %add.ptr, align 4
  %add35 = add i32 %tmp34, %tmp23
  store i32 %add35, i32* %storemerge123, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then9, %if.else29, %if.then21, %if.then
  %incdec.ptr = getelementptr inbounds i32* %storemerge123, i64 1
  %cmp42 = icmp ugt i32* %incdec.ptr, %add.ptr41
  %storemerge1 = select i1 %cmp42, i32* %arraydecay, i32* %incdec.ptr
  %cmp = icmp ugt i32 %inc, %n
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %if.end38
  %cmp49 = icmp eq i32* %storemerge1, %arraydecay
  %add.ptr51 = getelementptr inbounds i32* %storemerge1, i64 2
  %sub.ptr = getelementptr inbounds i32* %storemerge1, i64 -1
  %cond.in = select i1 %cmp49, i32* %add.ptr51, i32* %sub.ptr
  %cond = load i32* %cond.in, align 4
  ret i32 %cond
}

define i32 @fastfib_v2(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %n, 0
  br i1 %cmp, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub = add i32 %n, -1
  %cmp34 = icmp eq i32 %sub, 0
  br i1 %cmp34, label %return, label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %storemerge7 = phi i32 [ %0, %for.body ], [ 0, %for.cond.preheader ]
  %tmp426 = phi i32 [ %add35, %for.body ], [ 0, %for.cond.preheader ]
  %add35 = phi i32 [ %add, %for.body ], [ 1, %for.cond.preheader ]
  %add = add i32 %tmp426, %add35
  %0 = add i32 %storemerge7, 1
  %exitcond = icmp eq i32 %0, %sub
  br i1 %exitcond, label %return, label %for.body

return:                                           ; preds = %for.cond.preheader, %for.body, %entry
  %storemerge1 = phi i32 [ 0, %entry ], [ 1, %for.cond.preheader ], [ %add, %for.body ]
  ret i32 %storemerge1
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
