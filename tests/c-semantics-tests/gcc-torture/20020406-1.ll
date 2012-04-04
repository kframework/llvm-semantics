; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020406-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DUPFFstruct = type { i32, i32, i32* }

@.str = private unnamed_addr constant [40 x i8] c"DUPFFexgcd called on degrees %d and %d\0A\00", align 1
@.str1 = private unnamed_addr constant [41 x i8] c"calling DUPFFexgcd on degrees %d and %d\0A\00", align 1

define i32 @FFmul(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

define i32 @DUPFFdeg(%struct.DUPFFstruct* %f) nounwind uwtable {
entry:
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  %0 = load %struct.DUPFFstruct** %f.addr, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %0, i32 0, i32 1
  %1 = load i32* %deg, align 4
  ret i32 %1
}

define %struct.DUPFFstruct* @DUPFFnew(i32 %maxdeg) nounwind uwtable {
entry:
  %maxdeg.addr = alloca i32, align 4
  %ans = alloca %struct.DUPFFstruct*, align 8
  store i32 %maxdeg, i32* %maxdeg.addr, align 4
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.DUPFFstruct*
  store %struct.DUPFFstruct* %0, %struct.DUPFFstruct** %ans, align 8
  %1 = load %struct.DUPFFstruct** %ans, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %1, i32 0, i32 2
  store i32* null, i32** %coeffs, align 8
  %2 = load i32* %maxdeg.addr, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32* %maxdeg.addr, align 4
  %add = add nsw i32 %3, 1
  %conv = sext i32 %add to i64
  %call1 = call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %4 = bitcast i8* %call1 to i32*
  %5 = load %struct.DUPFFstruct** %ans, align 8
  %coeffs2 = getelementptr inbounds %struct.DUPFFstruct* %5, i32 0, i32 2
  store i32* %4, i32** %coeffs2, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32* %maxdeg.addr, align 4
  %7 = load %struct.DUPFFstruct** %ans, align 8
  %maxdeg3 = getelementptr inbounds %struct.DUPFFstruct* %7, i32 0, i32 0
  store i32 %6, i32* %maxdeg3, align 4
  %8 = load %struct.DUPFFstruct** %ans, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %8, i32 0, i32 1
  store i32 -1, i32* %deg, align 4
  %9 = load %struct.DUPFFstruct** %ans, align 8
  ret %struct.DUPFFstruct* %9
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

define void @DUPFFfree(%struct.DUPFFstruct* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  ret void
}

define void @DUPFFswap(%struct.DUPFFstruct* %x, %struct.DUPFFstruct* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  %y.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  store %struct.DUPFFstruct* %y, %struct.DUPFFstruct** %y.addr, align 8
  ret void
}

define %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  %0 = load %struct.DUPFFstruct** %x.addr, align 8
  ret %struct.DUPFFstruct* %0
}

define void @DUPFFshift_add(%struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g, i32 %deg, i32 %coeff) nounwind uwtable {
entry:
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  %g.addr = alloca %struct.DUPFFstruct*, align 8
  %deg.addr = alloca i32, align 4
  %coeff.addr = alloca i32, align 4
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %g.addr, align 8
  store i32 %deg, i32* %deg.addr, align 4
  store i32 %coeff, i32* %coeff.addr, align 4
  ret void
}

define %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g) nounwind uwtable {
entry:
  %retval = alloca %struct.DUPFFstruct*, align 8
  %fcofac.addr = alloca %struct.DUPFFstruct**, align 8
  %gcofac.addr = alloca %struct.DUPFFstruct**, align 8
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  %g.addr = alloca %struct.DUPFFstruct*, align 8
  %u = alloca %struct.DUPFFstruct*, align 8
  %v = alloca %struct.DUPFFstruct*, align 8
  %uf = alloca %struct.DUPFFstruct*, align 8
  %ug = alloca %struct.DUPFFstruct*, align 8
  %vf = alloca %struct.DUPFFstruct*, align 8
  %vg = alloca %struct.DUPFFstruct*, align 8
  %q = alloca i32, align 4
  %lcu = alloca i32, align 4
  %lcvrecip = alloca i32, align 4
  %p = alloca i32, align 4
  %df = alloca i32, align 4
  %dg = alloca i32, align 4
  %du = alloca i32, align 4
  %dv = alloca i32, align 4
  store %struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct*** %fcofac.addr, align 8
  store %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct*** %gcofac.addr, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %g.addr, align 8
  %0 = load %struct.DUPFFstruct** %f.addr, align 8
  %call = call i32 @DUPFFdeg(%struct.DUPFFstruct* %0)
  %1 = load %struct.DUPFFstruct** %g.addr, align 8
  %call1 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %1)
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %call, i32 %call1)
  %2 = load %struct.DUPFFstruct** %f.addr, align 8
  %call3 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %2)
  %3 = load %struct.DUPFFstruct** %g.addr, align 8
  %call4 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %3)
  %cmp = icmp slt i32 %call3, %call4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.DUPFFstruct*** %gcofac.addr, align 8
  %5 = load %struct.DUPFFstruct*** %fcofac.addr, align 8
  %6 = load %struct.DUPFFstruct** %g.addr, align 8
  %7 = load %struct.DUPFFstruct** %f.addr, align 8
  %call5 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %4, %struct.DUPFFstruct** %5, %struct.DUPFFstruct* %6, %struct.DUPFFstruct* %7)
  store %struct.DUPFFstruct* %call5, %struct.DUPFFstruct** %retval
  br label %return

if.end:                                           ; preds = %entry
  %8 = load %struct.DUPFFstruct** %f.addr, align 8
  %call6 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %8)
  %cmp7 = icmp ne i32 %call6, 2
  br i1 %cmp7, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %9 = load %struct.DUPFFstruct** %g.addr, align 8
  %call8 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %9)
  %cmp9 = icmp ne i32 %call8, 1
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %lor.lhs.false
  %10 = load %struct.DUPFFstruct** %f.addr, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %10, i32 0, i32 2
  %11 = load i32** %coeffs, align 8
  %arrayidx = getelementptr inbounds i32* %11, i64 0
  %12 = load i32* %arrayidx, align 4
  %cmp12 = icmp eq i32 %12, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end11
  %13 = load %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %13, %struct.DUPFFstruct** %retval
  br label %return

if.end14:                                         ; preds = %if.end11
  store i32 2, i32* %p, align 4
  %14 = load %struct.DUPFFstruct** %f.addr, align 8
  %call15 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %14)
  store i32 %call15, i32* %df, align 4
  %15 = load i32* %df, align 4
  %cmp16 = icmp slt i32 %15, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  store i32 0, i32* %df, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end14
  %16 = load %struct.DUPFFstruct** %g.addr, align 8
  %call19 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %16)
  store i32 %call19, i32* %dg, align 4
  %17 = load i32* %dg, align 4
  %cmp20 = icmp slt i32 %17, 0
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  store i32 0, i32* %dg, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end18
  %18 = load %struct.DUPFFstruct** %f.addr, align 8
  %call23 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %18)
  store %struct.DUPFFstruct* %call23, %struct.DUPFFstruct** %u, align 8
  %19 = load %struct.DUPFFstruct** %g.addr, align 8
  %call24 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %19)
  store %struct.DUPFFstruct* %call24, %struct.DUPFFstruct** %v, align 8
  %20 = load i32* %dg, align 4
  %call25 = call %struct.DUPFFstruct* @DUPFFnew(i32 %20)
  store %struct.DUPFFstruct* %call25, %struct.DUPFFstruct** %uf, align 8
  %21 = load %struct.DUPFFstruct** %uf, align 8
  %coeffs26 = getelementptr inbounds %struct.DUPFFstruct* %21, i32 0, i32 2
  %22 = load i32** %coeffs26, align 8
  %arrayidx27 = getelementptr inbounds i32* %22, i64 0
  store i32 1, i32* %arrayidx27, align 4
  %23 = load %struct.DUPFFstruct** %uf, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %23, i32 0, i32 1
  store i32 0, i32* %deg, align 4
  %24 = load i32* %df, align 4
  %call28 = call %struct.DUPFFstruct* @DUPFFnew(i32 %24)
  store %struct.DUPFFstruct* %call28, %struct.DUPFFstruct** %ug, align 8
  %25 = load i32* %dg, align 4
  %call29 = call %struct.DUPFFstruct* @DUPFFnew(i32 %25)
  store %struct.DUPFFstruct* %call29, %struct.DUPFFstruct** %vf, align 8
  %26 = load i32* %df, align 4
  %call30 = call %struct.DUPFFstruct* @DUPFFnew(i32 %26)
  store %struct.DUPFFstruct* %call30, %struct.DUPFFstruct** %vg, align 8
  %27 = load %struct.DUPFFstruct** %vg, align 8
  %coeffs31 = getelementptr inbounds %struct.DUPFFstruct* %27, i32 0, i32 2
  %28 = load i32** %coeffs31, align 8
  %arrayidx32 = getelementptr inbounds i32* %28, i64 0
  store i32 1, i32* %arrayidx32, align 4
  %29 = load %struct.DUPFFstruct** %vg, align 8
  %deg33 = getelementptr inbounds %struct.DUPFFstruct* %29, i32 0, i32 1
  store i32 0, i32* %deg33, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %if.end22
  %30 = load %struct.DUPFFstruct** %v, align 8
  %call34 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %30)
  %cmp35 = icmp sgt i32 %call34, 0
  br i1 %cmp35, label %while.body, label %while.end54

while.body:                                       ; preds = %while.cond
  %31 = load %struct.DUPFFstruct** %v, align 8
  %call36 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %31)
  store i32 %call36, i32* %dv, align 4
  %32 = load i32* %dv, align 4
  %idxprom = sext i32 %32 to i64
  %33 = load %struct.DUPFFstruct** %v, align 8
  %coeffs37 = getelementptr inbounds %struct.DUPFFstruct* %33, i32 0, i32 2
  %34 = load i32** %coeffs37, align 8
  %arrayidx38 = getelementptr inbounds i32* %34, i64 %idxprom
  %35 = load i32* %arrayidx38, align 4
  %call39 = call i32 @FFmul(i32 1, i32 %35)
  store i32 %call39, i32* %lcvrecip, align 4
  br label %while.cond40

while.cond40:                                     ; preds = %while.body43, %while.body
  %36 = load %struct.DUPFFstruct** %u, align 8
  %call41 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %36)
  %37 = load i32* %dv, align 4
  %cmp42 = icmp sge i32 %call41, %37
  br i1 %cmp42, label %while.body43, label %while.end

while.body43:                                     ; preds = %while.cond40
  %38 = load %struct.DUPFFstruct** %u, align 8
  %call44 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %38)
  store i32 %call44, i32* %du, align 4
  %39 = load i32* %du, align 4
  %idxprom45 = sext i32 %39 to i64
  %40 = load %struct.DUPFFstruct** %u, align 8
  %coeffs46 = getelementptr inbounds %struct.DUPFFstruct* %40, i32 0, i32 2
  %41 = load i32** %coeffs46, align 8
  %arrayidx47 = getelementptr inbounds i32* %41, i64 %idxprom45
  %42 = load i32* %arrayidx47, align 4
  store i32 %42, i32* %lcu, align 4
  %43 = load i32* %lcu, align 4
  %44 = load i32* %lcvrecip, align 4
  %call48 = call i32 @FFmul(i32 %43, i32 %44)
  store i32 %call48, i32* %q, align 4
  %45 = load %struct.DUPFFstruct** %u, align 8
  %46 = load %struct.DUPFFstruct** %v, align 8
  %47 = load i32* %du, align 4
  %48 = load i32* %dv, align 4
  %sub = sub nsw i32 %47, %48
  %49 = load i32* %p, align 4
  %50 = load i32* %q, align 4
  %sub49 = sub i32 %49, %50
  call void @DUPFFshift_add(%struct.DUPFFstruct* %45, %struct.DUPFFstruct* %46, i32 %sub, i32 %sub49)
  %51 = load %struct.DUPFFstruct** %uf, align 8
  %52 = load %struct.DUPFFstruct** %vf, align 8
  %53 = load i32* %du, align 4
  %54 = load i32* %dv, align 4
  %sub50 = sub nsw i32 %53, %54
  %55 = load i32* %p, align 4
  %56 = load i32* %q, align 4
  %sub51 = sub i32 %55, %56
  call void @DUPFFshift_add(%struct.DUPFFstruct* %51, %struct.DUPFFstruct* %52, i32 %sub50, i32 %sub51)
  %57 = load %struct.DUPFFstruct** %ug, align 8
  %58 = load %struct.DUPFFstruct** %vg, align 8
  %59 = load i32* %du, align 4
  %60 = load i32* %dv, align 4
  %sub52 = sub nsw i32 %59, %60
  %61 = load i32* %p, align 4
  %62 = load i32* %q, align 4
  %sub53 = sub i32 %61, %62
  call void @DUPFFshift_add(%struct.DUPFFstruct* %57, %struct.DUPFFstruct* %58, i32 %sub52, i32 %sub53)
  br label %while.cond40

while.end:                                        ; preds = %while.cond40
  %63 = load %struct.DUPFFstruct** %u, align 8
  %64 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %63, %struct.DUPFFstruct* %64)
  %65 = load %struct.DUPFFstruct** %uf, align 8
  %66 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %65, %struct.DUPFFstruct* %66)
  %67 = load %struct.DUPFFstruct** %ug, align 8
  %68 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %67, %struct.DUPFFstruct* %68)
  br label %while.cond

while.end54:                                      ; preds = %while.cond
  %69 = load %struct.DUPFFstruct** %v, align 8
  %call55 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %69)
  %cmp56 = icmp eq i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %while.end54
  %70 = load %struct.DUPFFstruct** %u, align 8
  %71 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %70, %struct.DUPFFstruct* %71)
  %72 = load %struct.DUPFFstruct** %uf, align 8
  %73 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %72, %struct.DUPFFstruct* %73)
  %74 = load %struct.DUPFFstruct** %ug, align 8
  %75 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %74, %struct.DUPFFstruct* %75)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %while.end54
  %76 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %76)
  %77 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %77)
  %78 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %78)
  %79 = load %struct.DUPFFstruct** %uf, align 8
  %80 = load %struct.DUPFFstruct*** %fcofac.addr, align 8
  store %struct.DUPFFstruct* %79, %struct.DUPFFstruct** %80, align 8
  %81 = load %struct.DUPFFstruct** %ug, align 8
  %82 = load %struct.DUPFFstruct*** %gcofac.addr, align 8
  store %struct.DUPFFstruct* %81, %struct.DUPFFstruct** %82, align 8
  %83 = load %struct.DUPFFstruct** %u, align 8
  store %struct.DUPFFstruct* %83, %struct.DUPFFstruct** %retval
  br label %return

return:                                           ; preds = %if.end58, %if.then13, %if.then
  %84 = load %struct.DUPFFstruct** %retval
  ret %struct.DUPFFstruct* %84
}

declare i32 @printf(i8*, ...)

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.DUPFFstruct*, align 8
  %g = alloca %struct.DUPFFstruct*, align 8
  %cf = alloca %struct.DUPFFstruct*, align 8
  %cg = alloca %struct.DUPFFstruct*, align 8
  %h = alloca %struct.DUPFFstruct*, align 8
  store i32 0, i32* %retval
  %call = call %struct.DUPFFstruct* @DUPFFnew(i32 1)
  store %struct.DUPFFstruct* %call, %struct.DUPFFstruct** %f, align 8
  %0 = load %struct.DUPFFstruct** %f, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %0, i32 0, i32 2
  %1 = load i32** %coeffs, align 8
  %arrayidx = getelementptr inbounds i32* %1, i64 1
  store i32 1, i32* %arrayidx, align 4
  %2 = load %struct.DUPFFstruct** %f, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %2, i32 0, i32 1
  store i32 1, i32* %deg, align 4
  %call1 = call %struct.DUPFFstruct* @DUPFFnew(i32 2)
  store %struct.DUPFFstruct* %call1, %struct.DUPFFstruct** %g, align 8
  %3 = load %struct.DUPFFstruct** %g, align 8
  %coeffs2 = getelementptr inbounds %struct.DUPFFstruct* %3, i32 0, i32 2
  %4 = load i32** %coeffs2, align 8
  %arrayidx3 = getelementptr inbounds i32* %4, i64 2
  store i32 1, i32* %arrayidx3, align 4
  %5 = load %struct.DUPFFstruct** %g, align 8
  %deg4 = getelementptr inbounds %struct.DUPFFstruct* %5, i32 0, i32 1
  store i32 2, i32* %deg4, align 4
  %6 = load %struct.DUPFFstruct** %f, align 8
  %call5 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %6)
  %7 = load %struct.DUPFFstruct** %g, align 8
  %call6 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %7)
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str1, i32 0, i32 0), i32 %call5, i32 %call6)
  %8 = load %struct.DUPFFstruct** %f, align 8
  %9 = load %struct.DUPFFstruct** %g, align 8
  %call8 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %cf, %struct.DUPFFstruct** %cg, %struct.DUPFFstruct* %8, %struct.DUPFFstruct* %9)
  store %struct.DUPFFstruct* %call8, %struct.DUPFFstruct** %h, align 8
  ret i32 0
}
