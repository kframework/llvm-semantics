; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040703-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cpp_num = type { i32, i32, i32, i32 }

@precision = global i32 64, align 4
@n = global i32 16, align 4
@num = global %struct.cpp_num { i32 0, i32 3, i32 0, i32 0 }, align 8

define { i64, i64 } @num_lshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i32 %n, %precision
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %0 = trunc i64 %num.coerce1 to i32
  %tobool = icmp eq i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then
  %1 = lshr i64 %num.coerce0, 32
  %or103 = or i64 %1, %num.coerce0
  %or = trunc i64 %or103 to i32
  %lnot = icmp ne i32 %or, 0
  %phitmp104 = zext i1 %lnot to i64
  %phitmp105 = shl nuw nsw i64 %phitmp104, 32
  br label %land.end

land.end:                                         ; preds = %if.then, %land.rhs
  %2 = phi i64 [ 0, %if.then ], [ %phitmp105, %land.rhs ]
  %mask79 = and i64 %num.coerce1, 4294967295
  %ins80 = or i64 %2, %mask79
  br label %if.end43

if.else:                                          ; preds = %entry
  %3 = trunc i64 %num.coerce0 to i32
  %4 = lshr i64 %num.coerce0, 32
  %5 = trunc i64 %4 to i32
  %cmp4 = icmp ugt i32 %n, 31
  %sub = add i32 %n, -32
  %.num.coerce0 = select i1 %cmp4, i64 %4, i64 %num.coerce0
  %.extract.t114 = select i1 %cmp4, i32 0, i32 %5
  %sub.n = select i1 %cmp4, i32 %sub, i32 %n
  %tobool12 = icmp eq i32 %sub.n, 0
  br i1 %tobool12, label %if.end22, label %if.then13

if.then13:                                        ; preds = %if.else
  %num.0.off0 = trunc i64 %.num.coerce0 to i32
  %shl = shl i32 %num.0.off0, %sub.n
  %sub17 = sub i32 32, %sub.n
  %shr = lshr i32 %.extract.t114, %sub17
  %or18 = or i32 %shl, %shr
  %6 = zext i32 %or18 to i64
  %shl21 = shl i32 %.extract.t114, %sub.n
  %7 = zext i32 %shl21 to i64
  %8 = shl nuw i64 %7, 32
  %ins65 = or i64 %6, %8
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then13
  %num.1.off0 = phi i64 [ %ins65, %if.then13 ], [ %.num.coerce0, %if.else ]
  %cmp.i = icmp ugt i32 %precision, 32
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.end22
  %sub.i = add i32 %precision, -32
  %cmp5.i = icmp ult i32 %sub.i, 32
  br i1 %cmp5.i, label %if.then7.i, label %num_trim.exit

if.then7.i:                                       ; preds = %if.then.i
  %shl.i = shl i32 1, %sub.i
  %sub8.i = add i32 %shl.i, -1
  %9 = trunc i64 %num.1.off0 to i32
  %and.i = and i32 %9, %sub8.i
  %10 = zext i32 %and.i to i64
  %mask22.i = and i64 %num.1.off0, -4294967296
  %ins23.i = or i64 %10, %mask22.i
  br label %num_trim.exit

if.else.i:                                        ; preds = %if.end22
  %cmp10.i = icmp ult i32 %precision, 32
  br i1 %cmp10.i, label %if.then12.i, label %if.end16.i

if.then12.i:                                      ; preds = %if.else.i
  %shl13.i = shl i32 1, %precision
  %sub14.i = add i32 %shl13.i, -1
  %11 = lshr i64 %num.1.off0, 32
  %12 = trunc i64 %11 to i32
  %and15.i = and i32 %12, %sub14.i
  %13 = zext i32 %and15.i to i64
  %14 = shl nuw i64 %13, 32
  %mask20.i = and i64 %num.1.off0, 4294967295
  %ins.i = or i64 %14, %mask20.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %if.then12.i, %if.else.i
  %num.0.off0.i = phi i64 [ %ins.i, %if.then12.i ], [ %num.1.off0, %if.else.i ]
  %extract.t32.i = and i64 %num.0.off0.i, -4294967296
  br label %num_trim.exit

num_trim.exit:                                    ; preds = %if.then.i, %if.then7.i, %if.end16.i
  %num.1.off0.i = phi i64 [ %ins23.i, %if.then7.i ], [ %num.1.off0, %if.then.i ], [ %extract.t32.i, %if.end16.i ]
  %15 = trunc i64 %num.coerce1 to i32
  %tobool24 = icmp eq i32 %15, 0
  br i1 %tobool24, label %if.else27, label %if.then25

if.then25:                                        ; preds = %num_trim.exit
  %extract99 = and i64 %num.coerce1, 4294967295
  br label %if.end43

if.else27:                                        ; preds = %num_trim.exit
  %16 = zext i64 %num.1.off0.i to i128
  %17 = zext i64 %num.coerce1 to i128
  %18 = shl nuw i128 %17, 64
  %ins88.i = or i128 %16, %18
  br i1 %cmp.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %if.else27
  %19 = trunc i64 %num.1.off0.i to i32
  %sub4.i.i = add i32 %precision, -33
  %shl.i.i = shl i32 1, %sub4.i.i
  %and.i.i = and i32 %19, %shl.i.i
  %cmp5.i.i = icmp eq i32 %and.i.i, 0
  %conv6.i.i = zext i1 %cmp5.i.i to i32
  br label %if.else3.i

if.end.i.i:                                       ; preds = %if.else27
  %20 = lshr i64 %num.1.off0.i, 32
  %21 = trunc i64 %20 to i32
  %sub7.i.i = add i32 %precision, -1
  %shl8.i.i = shl i32 1, %sub7.i.i
  %and9.i.i = and i32 %21, %shl8.i.i
  %cmp10.i.i = icmp eq i32 %and9.i.i, 0
  %conv11.i.i = zext i1 %cmp10.i.i to i32
  br label %if.else3.i

if.else3.i:                                       ; preds = %if.then.i.i, %if.end.i.i
  %retval.0.i.i = phi i32 [ %conv6.i.i, %if.then.i.i ], [ %conv11.i.i, %if.end.i.i ]
  %sext = add i32 %retval.0.i.i, -1
  %cmp4.i = icmp ult i32 %precision, 32
  br i1 %cmp4.i, label %if.then6.i, label %if.else9.i

if.then6.i:                                       ; preds = %if.else3.i
  %22 = zext i32 %sext to i128
  %shl.i120 = shl i32 %sext, %precision
  %23 = lshr i64 %num.1.off0.i, 32
  %24 = trunc i64 %23 to i32
  %or.i = or i32 %shl.i120, %24
  %25 = zext i32 %or.i to i128
  %26 = shl nuw nsw i128 %25, 32
  %ins79.i = or i128 %22, %18
  %ins76.i = or i128 %ins79.i, %26
  br label %if.end19.i

if.else9.i:                                       ; preds = %if.else3.i
  %cmp11.i = icmp ult i32 %precision, 64
  br i1 %cmp11.i, label %if.then13.i, label %if.end19.i

if.then13.i:                                      ; preds = %if.else9.i
  %sub.i121 = add i32 %precision, -32
  %shl15.i = shl i32 %sext, %sub.i121
  %27 = trunc i64 %num.1.off0.i to i32
  %or17.i = or i32 %shl15.i, %27
  %28 = zext i32 %or17.i to i128
  %mask72.i = and i128 %ins88.i, -4294967296
  %ins73.i = or i128 %28, %mask72.i
  br label %if.end19.i

if.end19.i:                                       ; preds = %if.then13.i, %if.else9.i, %if.then6.i
  %num.0.i = phi i128 [ %ins76.i, %if.then6.i ], [ %ins73.i, %if.then13.i ], [ %ins88.i, %if.else9.i ]
  %extract.t101.i = trunc i128 %num.0.i to i32
  %extract.t104.i = trunc i128 %num.0.i to i64
  %extract106.i = lshr i128 %num.0.i, 32
  %extract.t107.i = trunc i128 %extract106.i to i32
  br i1 %cmp4, label %if.then23.i, label %if.end30.i

if.then23.i:                                      ; preds = %if.end19.i
  %29 = shl i128 %num.0.i, 32
  %30 = zext i32 %sext to i128
  %ins67.i = or i128 %29, %30
  %extract.t103.i = trunc i128 %ins67.i to i64
  br label %if.end30.i

if.end30.i:                                       ; preds = %if.then23.i, %if.end19.i
  %num.1.off0.i122 = phi i32 [ %sext, %if.then23.i ], [ %extract.t101.i, %if.end19.i ]
  %num.1.off0102.i = phi i64 [ %extract.t103.i, %if.then23.i ], [ %extract.t104.i, %if.end19.i ]
  %num.1.off32.i = phi i32 [ %extract.t101.i, %if.then23.i ], [ %extract.t107.i, %if.end19.i ]
  %n.addr.0.i = phi i32 [ %sub, %if.then23.i ], [ %n, %if.end19.i ]
  %tobool31.i = icmp eq i32 %n.addr.0.i, 0
  br i1 %tobool31.i, label %if.end50.i, label %if.then32.i

if.then32.i:                                      ; preds = %if.end30.i
  %shr.i = lshr i32 %num.1.off32.i, %n.addr.0.i
  %sub36.i = sub i32 32, %n.addr.0.i
  %shl38.i = shl i32 %num.1.off0.i122, %sub36.i
  %or39.i = or i32 %shl38.i, %shr.i
  %31 = zext i32 %or39.i to i64
  %32 = shl nuw i64 %31, 32
  %shr42.i = lshr i32 %num.1.off0.i122, %n.addr.0.i
  %shl46.i = shl i32 %sext, %sub36.i
  %or47.i = or i32 %shl46.i, %shr42.i
  %33 = zext i32 %or47.i to i64
  %ins61.i = or i64 %32, %33
  br label %if.end50.i

if.end50.i:                                       ; preds = %if.then32.i, %if.end30.i
  %num.2.off0.i = phi i64 [ %ins61.i, %if.then32.i ], [ %num.1.off0102.i, %if.end30.i ]
  br i1 %cmp.i, label %if.then.i114.i, label %if.else.i.i

if.then.i114.i:                                   ; preds = %if.end50.i
  %sub.i.i = add i32 %precision, -32
  %cmp5.i113.i = icmp ult i32 %sub.i.i, 32
  br i1 %cmp5.i113.i, label %if.then7.i.i, label %num_rshift.exit

if.then7.i.i:                                     ; preds = %if.then.i114.i
  %shl.i115.i = shl i32 1, %sub.i.i
  %sub8.i.i = add i32 %shl.i115.i, -1
  %34 = trunc i64 %num.2.off0.i to i32
  %and.i116.i = and i32 %34, %sub8.i.i
  %35 = zext i32 %and.i116.i to i64
  %mask22.i.i = and i64 %num.2.off0.i, -4294967296
  %ins23.i.i = or i64 %35, %mask22.i.i
  br label %num_rshift.exit

if.else.i.i:                                      ; preds = %if.end50.i
  %cmp10.i117.i = icmp ult i32 %precision, 32
  br i1 %cmp10.i117.i, label %if.then12.i.i, label %if.end16.i.i

if.then12.i.i:                                    ; preds = %if.else.i.i
  %shl13.i.i = shl i32 1, %precision
  %sub14.i.i = add i32 %shl13.i.i, -1
  %36 = lshr i64 %num.2.off0.i, 32
  %37 = trunc i64 %36 to i32
  %and15.i.i = and i32 %37, %sub14.i.i
  %38 = zext i32 %and15.i.i to i64
  %39 = shl nuw i64 %38, 32
  %mask20.i.i = and i64 %num.2.off0.i, 4294967295
  %ins.i.i = or i64 %39, %mask20.i.i
  br label %if.end16.i.i

if.end16.i.i:                                     ; preds = %if.then12.i.i, %if.else.i.i
  %num.0.off0.i.i = phi i64 [ %ins.i.i, %if.then12.i.i ], [ %num.2.off0.i, %if.else.i.i ]
  %extract.t32.i.i = and i64 %num.0.off0.i.i, -4294967296
  br label %num_rshift.exit

num_rshift.exit:                                  ; preds = %if.then.i114.i, %if.then7.i.i, %if.end16.i.i
  %num.1.off0.i.i = phi i64 [ %ins23.i.i, %if.then7.i.i ], [ %num.2.off0.i, %if.then.i114.i ], [ %extract.t32.i.i, %if.end16.i.i ]
  %40 = lshr i64 %num.1.off0.i.i, 32
  %41 = trunc i64 %40 to i32
  %cmp31 = icmp eq i32 %5, %41
  br i1 %cmp31, label %land.rhs33, label %land.end38

land.rhs33:                                       ; preds = %num_rshift.exit
  %42 = trunc i64 %num.1.off0.i.i to i32
  %phitmp = icmp ne i32 %3, %42
  %phitmp92 = zext i1 %phitmp to i64
  %phitmp93 = shl nuw nsw i64 %phitmp92, 32
  br label %land.end38

land.end38:                                       ; preds = %land.rhs33, %num_rshift.exit
  %43 = phi i64 [ 4294967296, %num_rshift.exit ], [ %phitmp93, %land.rhs33 ]
  %.masked = and i64 %num.coerce1, 4294967295
  %ins60 = or i64 %43, %.masked
  br label %if.end43

if.end43:                                         ; preds = %if.then25, %land.end38, %land.end
  %num.2.off0 = phi i64 [ 0, %land.end ], [ %num.1.off0.i, %if.then25 ], [ %num.1.off0.i, %land.end38 ]
  %num.2.off64 = phi i64 [ %ins80, %land.end ], [ %extract99, %if.then25 ], [ %ins60, %land.end38 ]
  %44 = insertvalue { i64, i64 } undef, i64 %num.2.off0, 0
  %45 = insertvalue { i64, i64 } %44, i64 %num.2.off64, 1
  ret { i64, i64 } %45
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %1 = load i64* bitcast (%struct.cpp_num* @num to i64*), align 8
  %2 = load i64* bitcast (i32* getelementptr inbounds (%struct.cpp_num* @num, i64 0, i32 2) to i64*), align 8
  %call = tail call { i64, i64 } @num_lshift(i64 %1, i64 %2, i32 64, i32 %0)
  %3 = extractvalue { i64, i64 } %call, 0
  %4 = extractvalue { i64, i64 } %call, 1
  %.mask = and i64 %3, -4294967296
  %cmp = icmp eq i64 %.mask, 844424930131968
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %5 = trunc i64 %3 to i32
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %cmp4 = icmp ugt i64 %4, 4294967295
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
