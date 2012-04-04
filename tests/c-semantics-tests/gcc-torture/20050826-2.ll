; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050826-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtattr = type { i16, i16 }

define i32 @inet_check_attr(i8* %r, %struct.rtattr** %rta) nounwind uwtable noinline {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca i8*, align 8
  %rta.addr = alloca %struct.rtattr**, align 8
  %i = alloca i32, align 4
  %attr = alloca %struct.rtattr*, align 8
  store i8* %r, i8** %r.addr, align 8
  store %struct.rtattr** %rta, %struct.rtattr*** %rta.addr, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %sub = sub nsw i32 %1, 1
  %idxprom = sext i32 %sub to i64
  %2 = load %struct.rtattr*** %rta.addr, align 8
  %arrayidx = getelementptr inbounds %struct.rtattr** %2, i64 %idxprom
  %3 = load %struct.rtattr** %arrayidx, align 8
  store %struct.rtattr* %3, %struct.rtattr** %attr, align 8
  %4 = load %struct.rtattr** %attr, align 8
  %tobool = icmp ne %struct.rtattr* %4, null
  br i1 %tobool, label %if.then, label %if.end14

if.then:                                          ; preds = %for.body
  %5 = load %struct.rtattr** %attr, align 8
  %rta_len = getelementptr inbounds %struct.rtattr* %5, i32 0, i32 0
  %6 = load i16* %rta_len, align 2
  %conv = zext i16 %6 to i64
  %sub1 = sub i64 %conv, 4
  %cmp2 = icmp ult i64 %sub1, 4
  br i1 %cmp2, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  store i32 -22, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %7 = load i32* %i, align 4
  %cmp5 = icmp ne i32 %7, 9
  br i1 %cmp5, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end
  %8 = load i32* %i, align 4
  %cmp7 = icmp ne i32 %8, 8
  br i1 %cmp7, label %if.then9, label %if.end13

if.then9:                                         ; preds = %land.lhs.true
  %9 = load %struct.rtattr** %attr, align 8
  %add.ptr = getelementptr inbounds %struct.rtattr* %9, i64 1
  %10 = load i32* %i, align 4
  %sub10 = sub nsw i32 %10, 1
  %idxprom11 = sext i32 %sub10 to i64
  %11 = load %struct.rtattr*** %rta.addr, align 8
  %arrayidx12 = getelementptr inbounds %struct.rtattr** %11, i64 %idxprom11
  store %struct.rtattr* %add.ptr, %struct.rtattr** %arrayidx12, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then9, %land.lhs.true, %if.end
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %12 = load i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then4
  %13 = load i32* %retval
  ret i32 %13
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %rt = alloca [2 x %struct.rtattr], align 2
  %rta = alloca [14 x %struct.rtattr*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %rta_len = getelementptr inbounds %struct.rtattr* %arrayidx, i32 0, i32 0
  store i16 12, i16* %rta_len, align 2
  %arrayidx1 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %rta_type = getelementptr inbounds %struct.rtattr* %arrayidx1, i32 0, i32 1
  store i16 0, i16* %rta_type, align 2
  %arrayidx2 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %arrayidx3 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %0 = bitcast %struct.rtattr* %arrayidx2 to i8*
  %1 = bitcast %struct.rtattr* %arrayidx3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 4, i32 2, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx5 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom
  store %struct.rtattr* %arrayidx4, %struct.rtattr** %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %call = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arraydecay)
  %cmp6 = icmp ne i32 %call, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc19, %if.end
  %5 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %5, 14
  br i1 %cmp8, label %for.body9, label %for.end21

for.body9:                                        ; preds = %for.cond7
  %6 = load i32* %i, align 4
  %idxprom10 = sext i32 %6 to i64
  %arrayidx11 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom10
  %7 = load %struct.rtattr** %arrayidx11, align 8
  %8 = load i32* %i, align 4
  %cmp12 = icmp ne i32 %8, 7
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body9
  %9 = load i32* %i, align 4
  %cmp13 = icmp ne i32 %9, 8
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body9
  %10 = phi i1 [ false, %for.body9 ], [ %cmp13, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  %idxprom14 = sext i32 %land.ext to i64
  %arrayidx15 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 %idxprom14
  %cmp16 = icmp ne %struct.rtattr* %7, %arrayidx15
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %land.end
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %11 = load i32* %i, align 4
  %inc20 = add nsw i32 %11, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond7

for.end21:                                        ; preds = %for.cond7
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc28, %for.end21
  %12 = load i32* %i, align 4
  %cmp23 = icmp slt i32 %12, 14
  br i1 %cmp23, label %for.body24, label %for.end30

for.body24:                                       ; preds = %for.cond22
  %arrayidx25 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %13 = load i32* %i, align 4
  %idxprom26 = sext i32 %13 to i64
  %arrayidx27 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom26
  store %struct.rtattr* %arrayidx25, %struct.rtattr** %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body24
  %14 = load i32* %i, align 4
  %inc29 = add nsw i32 %14, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond22

for.end30:                                        ; preds = %for.cond22
  %arrayidx31 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 1
  store %struct.rtattr* null, %struct.rtattr** %arrayidx31, align 8
  %arrayidx32 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %rta_len33 = getelementptr inbounds %struct.rtattr* %arrayidx32, i32 0, i32 0
  %15 = load i16* %rta_len33, align 2
  %conv = zext i16 %15 to i32
  %sub = sub nsw i32 %conv, 8
  %conv34 = trunc i32 %sub to i16
  store i16 %conv34, i16* %rta_len33, align 2
  %arrayidx35 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %arrayidx36 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 5
  store %struct.rtattr* %arrayidx35, %struct.rtattr** %arrayidx36, align 8
  %arraydecay37 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %call38 = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arraydecay37)
  %cmp39 = icmp ne i32 %call38, -22
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %for.end30
  call void @abort() noreturn nounwind
  unreachable

if.end42:                                         ; preds = %for.end30
  store i32 0, i32* %i, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc79, %if.end42
  %16 = load i32* %i, align 4
  %cmp44 = icmp slt i32 %16, 14
  br i1 %cmp44, label %for.body46, label %for.end81

for.body46:                                       ; preds = %for.cond43
  %17 = load i32* %i, align 4
  %cmp47 = icmp eq i32 %17, 1
  br i1 %cmp47, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body46
  %18 = load i32* %i, align 4
  %idxprom49 = sext i32 %18 to i64
  %arrayidx50 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom49
  %19 = load %struct.rtattr** %arrayidx50, align 8
  %cmp51 = icmp ne %struct.rtattr* %19, null
  br i1 %cmp51, label %if.then53, label %if.else

if.then53:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %land.lhs.true, %for.body46
  %20 = load i32* %i, align 4
  %cmp54 = icmp ne i32 %20, 1
  br i1 %cmp54, label %land.lhs.true56, label %if.else66

land.lhs.true56:                                  ; preds = %if.else
  %21 = load i32* %i, align 4
  %cmp57 = icmp sle i32 %21, 5
  br i1 %cmp57, label %land.lhs.true59, label %if.else66

land.lhs.true59:                                  ; preds = %land.lhs.true56
  %22 = load i32* %i, align 4
  %idxprom60 = sext i32 %22 to i64
  %arrayidx61 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom60
  %23 = load %struct.rtattr** %arrayidx61, align 8
  %arrayidx62 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %cmp63 = icmp ne %struct.rtattr* %23, %arrayidx62
  br i1 %cmp63, label %if.then65, label %if.else66

if.then65:                                        ; preds = %land.lhs.true59
  call void @abort() noreturn nounwind
  unreachable

if.else66:                                        ; preds = %land.lhs.true59, %land.lhs.true56, %if.else
  %24 = load i32* %i, align 4
  %cmp67 = icmp sgt i32 %24, 5
  br i1 %cmp67, label %land.lhs.true69, label %if.end76

land.lhs.true69:                                  ; preds = %if.else66
  %25 = load i32* %i, align 4
  %idxprom70 = sext i32 %25 to i64
  %arrayidx71 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom70
  %26 = load %struct.rtattr** %arrayidx71, align 8
  %arrayidx72 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %cmp73 = icmp ne %struct.rtattr* %26, %arrayidx72
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %land.lhs.true69
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %land.lhs.true69, %if.else66
  br label %if.end77

if.end77:                                         ; preds = %if.end76
  br label %if.end78

if.end78:                                         ; preds = %if.end77
  br label %for.inc79

for.inc79:                                        ; preds = %if.end78
  %27 = load i32* %i, align 4
  %inc80 = add nsw i32 %27, 1
  store i32 %inc80, i32* %i, align 4
  br label %for.cond43

for.end81:                                        ; preds = %for.cond43
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
