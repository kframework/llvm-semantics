; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/bitfields.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfs = type <{ i8, i8, i8, i8, [2 x i8], i8, i8, [2 x i8], [2 x i8], [2 x i8], [2 x i8], i8, [3 x i8] }>

@s = common global %struct.bfs zeroinitializer, align 4
@p = global %struct.bfs* @s, align 8
@.str5 = private unnamed_addr constant [13 x i8] c"BUG: a4: %d\0A\00", align 1
@.str28 = private unnamed_addr constant [13 x i8] c"BUG: e3: %d\0A\00", align 1
@.str36 = private unnamed_addr constant [18 x i8] c"BUG: i4 : %d, %d\0A\00", align 1
@.str41 = private unnamed_addr constant [18 x i8] c"BUG: k4 : %d, %d\0A\00", align 1
@str19 = internal constant [8 x i8] c"BUG: a2\00"
@str20 = internal constant [8 x i8] c"BUG: a2\00"
@str21 = internal constant [8 x i8] c"BUG: a3\00"
@str22 = internal constant [8 x i8] c"BUG: a3\00"
@str23 = internal constant [8 x i8] c"BUG: a3\00"
@str24 = internal constant [15 x i8] c"byte interp OK\00"
@str25 = internal constant [15 x i8] c"byte interp OK\00"
@str26 = internal constant [8 x i8] c"BUG: a5\00"
@str27 = internal constant [8 x i8] c"BUG: a5\00"
@str28 = internal constant [8 x i8] c"BUG: a5\00"
@str29 = internal constant [8 x i8] c"BUG: a6\00"
@str30 = internal constant [8 x i8] c"BUG: a6\00"
@str31 = internal constant [8 x i8] c"BUG: a6\00"
@str47 = internal constant [15 x i8] c"byte interp OK\00"
@str48 = internal constant [8 x i8] c"BUG: b6\00"
@str49 = internal constant [8 x i8] c"BUG: b6\00"
@str50 = internal constant [8 x i8] c"BUG: b6\00"
@str51 = internal constant [15 x i8] c"byte interp OK\00"
@str52 = internal constant [8 x i8] c"BUG: d3\00"
@str53 = internal constant [16 x i8] c"short interp OK\00"
@str54 = internal constant [8 x i8] c"BUG: e3\00"
@str57 = internal constant [8 x i8] c"BUG: f1\00"
@str58 = internal constant [8 x i8] c"BUG: f1\00"
@str59 = internal constant [8 x i8] c"BUG: f2\00"
@str60 = internal constant [3 x i8] c"ok\00"
@str61 = internal constant [8 x i8] c"BUG: f4\00"
@str62 = internal constant [14 x i8] c"finished ones\00"
@str63 = internal constant [14 x i8] c"finished twos\00"
@str64 = internal constant [16 x i8] c"finished eights\00"
@str65 = internal constant [18 x i8] c"finished sixteens\00"
@str66 = internal constant [17 x i8] c"finished partial\00"
@str67 = internal constant [26 x i8] c"finished just big partial\00"
@str68 = internal constant [21 x i8] c"finished big partial\00"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @testOnes() nounwind uwtable {
if.end60:
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = or i32 %0, 255
  store i32 %1, i32* bitcast (%struct.bfs* @s to i32*), align 4
  br i1 false, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end60
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end60
  br i1 false, label %if.then68, label %if.end70

if.then68:                                        ; preds = %if.end65
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %if.end65
  br i1 false, label %if.then73, label %if.end100

if.then73:                                        ; preds = %if.end70
  br label %if.end100

if.end100:                                        ; preds = %if.end70, %if.then73
  %2 = and i32 %0, -256
  %3 = or i32 %2, 237
  store i32 %3, i32* bitcast (%struct.bfs* @s to i32*), align 4
  br i1 false, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.end100
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.end100
  %4 = phi i32 [ undef, %if.then103 ], [ %3, %if.end100 ]
  %bf.clear106 = and i32 %4, 64
  %cmp107 = icmp eq i32 %bf.clear106, 0
  br i1 %cmp107, label %if.then108, label %if.end110

if.then108:                                       ; preds = %if.end105
  %puts19 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str19, i64 0, i64 0))
  %.pre41 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.end105
  %5 = phi i32 [ %.pre41, %if.then108 ], [ %4, %if.end105 ]
  %bf.clear111 = and i32 %5, 128
  %cmp112 = icmp eq i32 %bf.clear111, 0
  br i1 %cmp112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.end110
  %puts20 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str20, i64 0, i64 0))
  %.pre42 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.end110
  %6 = phi i32 [ %.pre42, %if.then113 ], [ %5, %if.end110 ]
  %7 = and i32 %6, -65
  store i32 %7, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %bf.clear116 = and i32 %6, 32
  %cmp117 = icmp eq i32 %bf.clear116, 0
  br i1 %cmp117, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.end115
  %puts21 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str21, i64 0, i64 0))
  %.pre43 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.end115
  %tmp50.in = phi i32 [ %.pre43, %if.then118 ], [ %7, %if.end115 ]
  %bf.clear121 = and i32 %tmp50.in, 64
  %cmp122 = icmp eq i32 %bf.clear121, 0
  br i1 %cmp122, label %if.end125, label %if.then123

if.then123:                                       ; preds = %if.end120
  %puts22 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str22, i64 0, i64 0))
  %.pre44 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end125

if.end125:                                        ; preds = %if.end120, %if.then123
  %tmp49.in = phi i32 [ %tmp50.in, %if.end120 ], [ %.pre44, %if.then123 ]
  %tmp49 = trunc i32 %tmp49.in to i8
  %bf.clear126 = and i32 %tmp49.in, 128
  %cmp127 = icmp eq i32 %bf.clear126, 0
  br i1 %cmp127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.end125
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str23, i64 0, i64 0))
  %tmp.pre = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 0), align 4
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.end125
  %tmp = phi i8 [ %tmp.pre, %if.then128 ], [ %tmp49, %if.end125 ]
  switch i8 %tmp, label %if.else142 [
    i8 -75, label %if.then134
    i8 -83, label %if.then140
  ]

if.then134:                                       ; preds = %if.end130
  %puts24 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str24, i64 0, i64 0))
  br label %if.end147

if.then140:                                       ; preds = %if.end130
  %puts25 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str25, i64 0, i64 0))
  br label %if.end147

if.else142:                                       ; preds = %if.end130
  %conv144 = zext i8 %tmp to i32
  %call145 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str5, i64 0, i64 0), i32 %conv144) nounwind
  br label %if.end147

if.end147:                                        ; preds = %if.then140, %if.else142, %if.then134
  %tmp148 = load %struct.bfs** @p, align 8
  %8 = bitcast %struct.bfs* %tmp148 to i32*
  %9 = load i32* %8, align 4
  %10 = or i32 %9, 64
  store i32 %10, i32* %8, align 4
  %tmp149 = load %struct.bfs** @p, align 8
  %11 = bitcast %struct.bfs* %tmp149 to i32*
  %12 = load i32* %11, align 4
  %bf.clear150 = and i32 %12, 32
  %cmp151 = icmp eq i32 %bf.clear150, 0
  br i1 %cmp151, label %if.then153, label %if.end155

if.then153:                                       ; preds = %if.end147
  %puts26 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str26, i64 0, i64 0))
  %tmp156.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert = bitcast %struct.bfs* %tmp156.pre to i32*
  %.pre52 = load i32* %.phi.trans.insert, align 4
  br label %if.end155

if.end155:                                        ; preds = %if.then153, %if.end147
  %13 = phi i32 [ %.pre52, %if.then153 ], [ %12, %if.end147 ]
  %tmp156 = phi %struct.bfs* [ %tmp156.pre, %if.then153 ], [ %tmp149, %if.end147 ]
  %bf.clear157 = and i32 %13, 64
  %cmp158 = icmp eq i32 %bf.clear157, 0
  br i1 %cmp158, label %if.then160, label %if.end162

if.then160:                                       ; preds = %if.end155
  %puts27 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str27, i64 0, i64 0))
  %tmp163.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert54 = bitcast %struct.bfs* %tmp163.pre to i32*
  %.pre55 = load i32* %.phi.trans.insert54, align 4
  br label %if.end162

if.end162:                                        ; preds = %if.then160, %if.end155
  %14 = phi i32 [ %.pre55, %if.then160 ], [ %13, %if.end155 ]
  %tmp163 = phi %struct.bfs* [ %tmp163.pre, %if.then160 ], [ %tmp156, %if.end155 ]
  %bf.clear164 = and i32 %14, 128
  %cmp165 = icmp eq i32 %bf.clear164, 0
  br i1 %cmp165, label %if.then167, label %if.end169

if.then167:                                       ; preds = %if.end162
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str28, i64 0, i64 0))
  %tmp170.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert57 = bitcast %struct.bfs* %tmp170.pre to i32*
  %.pre58 = load i32* %.phi.trans.insert57, align 4
  br label %if.end169

if.end169:                                        ; preds = %if.then167, %if.end162
  %15 = phi i32 [ %.pre58, %if.then167 ], [ %14, %if.end162 ]
  %tmp170 = phi %struct.bfs* [ %tmp170.pre, %if.then167 ], [ %tmp163, %if.end162 ]
  %16 = bitcast %struct.bfs* %tmp170 to i32*
  %17 = and i32 %15, -33
  store i32 %17, i32* %16, align 4
  %tmp171 = load %struct.bfs** @p, align 8
  %18 = bitcast %struct.bfs* %tmp171 to i32*
  %19 = load i32* %18, align 4
  %20 = and i32 %19, -129
  store i32 %20, i32* %18, align 4
  %tmp172 = load %struct.bfs** @p, align 8
  %21 = bitcast %struct.bfs* %tmp172 to i32*
  %22 = load i32* %21, align 4
  %23 = or i32 %22, 64
  store i32 %23, i32* %21, align 4
  %tmp173 = load %struct.bfs** @p, align 8
  %24 = bitcast %struct.bfs* %tmp173 to i32*
  %25 = load i32* %24, align 4
  %bf.clear174 = and i32 %25, 32
  %cmp175 = icmp eq i32 %bf.clear174, 0
  br i1 %cmp175, label %if.end179, label %if.then177

if.then177:                                       ; preds = %if.end169
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str29, i64 0, i64 0))
  %tmp180.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert60 = bitcast %struct.bfs* %tmp180.pre to i32*
  %.pre61 = load i32* %.phi.trans.insert60, align 4
  br label %if.end179

if.end179:                                        ; preds = %if.end169, %if.then177
  %26 = phi i32 [ %25, %if.end169 ], [ %.pre61, %if.then177 ]
  %bf.clear181 = and i32 %26, 64
  %cmp182 = icmp eq i32 %bf.clear181, 0
  br i1 %cmp182, label %if.then184, label %if.end186

if.then184:                                       ; preds = %if.end179
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str30, i64 0, i64 0))
  %tmp187.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert63 = bitcast %struct.bfs* %tmp187.pre to i32*
  %.pre64 = load i32* %.phi.trans.insert63, align 4
  br label %if.end186

if.end186:                                        ; preds = %if.then184, %if.end179
  %27 = phi i32 [ %.pre64, %if.then184 ], [ %26, %if.end179 ]
  %bf.clear188 = and i32 %27, 128
  %cmp189 = icmp eq i32 %bf.clear188, 0
  br i1 %cmp189, label %if.end193, label %if.then191

if.then191:                                       ; preds = %if.end186
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str31, i64 0, i64 0))
  br label %if.end193

if.end193:                                        ; preds = %if.end186, %if.then191
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @testTwos() nounwind uwtable {
if.end113:
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, -65281
  %2 = or i32 %1, 19200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str47, i64 0, i64 0))
  %tmp114 = load %struct.bfs** @p, align 8
  %3 = bitcast %struct.bfs* %tmp114 to i32*
  %4 = load i32* %3, align 4
  %5 = or i32 %4, 12288
  store i32 %5, i32* %3, align 4
  %tmp115 = load %struct.bfs** @p, align 8
  %6 = bitcast %struct.bfs* %tmp115 to i32*
  %7 = load i32* %6, align 4
  %bf.clear116 = and i32 %7, 3072
  %cmp117 = icmp eq i32 %bf.clear116, 2048
  br i1 %cmp117, label %if.end121, label %if.then119

if.then119:                                       ; preds = %if.end113
  %puts16 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str48, i64 0, i64 0))
  %tmp122.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert = bitcast %struct.bfs* %tmp122.pre to i32*
  %.pre = load i32* %.phi.trans.insert, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.end113, %if.then119
  %8 = phi i32 [ %7, %if.end113 ], [ %.pre, %if.then119 ]
  %bf.clear123 = and i32 %8, 12288
  %cmp124 = icmp eq i32 %bf.clear123, 12288
  br i1 %cmp124, label %if.end128, label %if.then126

if.then126:                                       ; preds = %if.end121
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str49, i64 0, i64 0))
  %tmp129.pre = load %struct.bfs** @p, align 8
  %.phi.trans.insert23 = bitcast %struct.bfs* %tmp129.pre to i32*
  %.pre24 = load i32* %.phi.trans.insert23, align 4
  br label %if.end128

if.end128:                                        ; preds = %if.end121, %if.then126
  %9 = phi i32 [ %8, %if.end121 ], [ %.pre24, %if.then126 ]
  %bf.clear130 = and i32 %9, 49152
  %cmp131 = icmp eq i32 %bf.clear130, 16384
  br i1 %cmp131, label %if.end135, label %if.then133

if.then133:                                       ; preds = %if.end128
  %puts18 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str50, i64 0, i64 0))
  br label %if.end135

if.end135:                                        ; preds = %if.end128, %if.then133
  ret i32 0
}

define i32 @testEights() nounwind uwtable {
if.end14:
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, 16777215
  %2 = or i32 %1, 1258291200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str51, i64 0, i64 0))
  %tmp15 = load %struct.bfs** @p, align 8
  %3 = bitcast %struct.bfs* %tmp15 to i32*
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, 1879048192
  store i32 %6, i32* %3, align 4
  %tmp16 = load %struct.bfs** @p, align 8
  %7 = bitcast %struct.bfs* %tmp16 to i32*
  %8 = load i32* %7, align 4
  %.mask = and i32 %8, -16777216
  %cmp18 = icmp eq i32 %.mask, 1879048192
  br i1 %cmp18, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end14
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str52, i64 0, i64 0))
  br label %if.end22

if.end22:                                         ; preds = %if.end14, %if.then20
  ret i32 0
}

define i32 @testSixteens() nounwind uwtable {
if.end18:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %1 = and i32 %0, -65536
  %2 = or i32 %1, 23213
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str53, i64 0, i64 0))
  %tmp19 = load %struct.bfs** @p, align 8
  %3 = getelementptr inbounds %struct.bfs* %tmp19, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %3, i64 4
  %4 = bitcast i8* %bf.field.offs to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -65536
  %7 = or i32 %6, 11606
  store i32 %7, i32* %4, align 4
  %tmp20 = load %struct.bfs** @p, align 8
  %8 = getelementptr inbounds %struct.bfs* %tmp20, i64 0, i32 0
  %bf.field.offs21 = getelementptr i8* %8, i64 4
  %9 = bitcast i8* %bf.field.offs21 to i32*
  %10 = load i32* %9, align 4
  %bf.clear22 = and i32 %10, 65535
  %cmp23 = icmp eq i32 %bf.clear22, 11606
  br i1 %cmp23, label %if.end27, label %if.then25

if.then25:                                        ; preds = %if.end18
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str54, i64 0, i64 0))
  br label %if.end27

if.end27:                                         ; preds = %if.end18, %if.then25
  ret i32 0
}

define i32 @testPartial() nounwind uwtable {
if.end5:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %1 = and i32 %0, -4128769
  %2 = or i32 %1, 2949120
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  store i8 75, i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4
  %3 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %bf.clear6 = and i32 %3, 4128768
  %cmp7 = icmp eq i32 %bf.clear6, 2949120
  br i1 %cmp7, label %if.end18.thread, label %if.end11

if.end11:                                         ; preds = %if.end5
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str57, i64 0, i64 0))
  %tmp12.pr = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4
  %cmp14 = icmp eq i8 %tmp12.pr, 75
  br i1 %cmp14, label %if.end18.thread, label %if.end18

if.end18.thread:                                  ; preds = %if.end5, %if.end11
  %4 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %5 = and i32 %4, -4128769
  %6 = or i32 %5, 1376256
  store i32 %6, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  br label %if.then38

if.end18:                                         ; preds = %if.end11
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str58, i64 0, i64 0))
  %tmp25.pre = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4
  %7 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %8 = and i32 %7, -4128769
  %9 = or i32 %8, 1376256
  store i32 %9, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %cmp27 = icmp eq i8 %tmp25.pre, 75
  br i1 %cmp27, label %if.then38, label %if.end31

if.end31:                                         ; preds = %if.end18
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str59, i64 0, i64 0))
  %tmp33.pr = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4
  %cmp36 = icmp eq i8 %tmp33.pr, 75
  br i1 %cmp36, label %if.then38, label %if.else

if.then38:                                        ; preds = %if.end18.thread, %if.end18, %if.end31
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str60, i64 0, i64 0))
  br label %if.end43

if.else:                                          ; preds = %if.end31
  %conv41 = zext i8 %tmp33.pr to i32
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str28, i64 0, i64 0), i32 %conv41) nounwind
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then38
  %tmp44 = load %struct.bfs** @p, align 8
  %g = getelementptr inbounds %struct.bfs* %tmp44, i64 0, i32 11
  store i8 119, i8* %g, align 1
  %tmp45 = load %struct.bfs** @p, align 8
  %g46 = getelementptr inbounds %struct.bfs* %tmp45, i64 0, i32 11
  %tmp47 = load i8* %g46, align 1
  %cmp49 = icmp eq i8 %tmp47, 119
  br i1 %cmp49, label %if.end53, label %if.then51

if.then51:                                        ; preds = %if.end43
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str61, i64 0, i64 0))
  br label %if.end53

if.end53:                                         ; preds = %if.end43, %if.then51
  ret i32 0
}

define i32 @testBigPartial() nounwind uwtable {
if.end31:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %1 = and i32 %0, -65536
  %2 = or i32 %1, 60417
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %tmp = load %struct.bfs** @p, align 8
  %3 = getelementptr inbounds %struct.bfs* %tmp, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %3, i64 8
  %4 = bitcast i8* %bf.field.offs to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -8192
  %7 = or i32 %6, 2000
  store i32 %7, i32* %4, align 4
  %tmp32 = load %struct.bfs** @p, align 8
  %8 = getelementptr inbounds %struct.bfs* %tmp32, i64 0, i32 0
  %bf.field.offs33 = getelementptr i8* %8, i64 8
  %9 = bitcast i8* %bf.field.offs33 to i32*
  %10 = load i32* %9, align 4
  %bf.clear34 = and i32 %10, 8191
  %cmp35 = icmp eq i32 %bf.clear34, 2000
  br i1 %cmp35, label %if.end42, label %if.then36

if.then36:                                        ; preds = %if.end31
  %11 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %bf.clear40 = and i32 %11, 8191
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i64 0, i64 0), i32 %bf.clear34, i32 %bf.clear40) nounwind
  br label %if.end42

if.end42:                                         ; preds = %if.end31, %if.then36
  ret i32 0
}

define i32 @testJustBigPartial() nounwind uwtable {
entry:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %1 = and i32 %0, -2048
  %2 = or i32 %1, 601
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %tmp = load %struct.bfs** @p, align 8
  %3 = getelementptr inbounds %struct.bfs* %tmp, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %3, i64 12
  %4 = bitcast i8* %bf.field.offs to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -2048
  %7 = or i32 %6, 1025
  store i32 %7, i32* %4, align 4
  %tmp20 = load %struct.bfs** @p, align 8
  %8 = getelementptr inbounds %struct.bfs* %tmp20, i64 0, i32 0
  %bf.field.offs21 = getelementptr i8* %8, i64 12
  %9 = bitcast i8* %bf.field.offs21 to i32*
  %10 = load i32* %9, align 4
  %bf.clear22 = and i32 %10, 2047
  %cmp23 = icmp eq i32 %bf.clear22, 1025
  br i1 %cmp23, label %if.end30, label %if.then24

if.then24:                                        ; preds = %entry
  %11 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %bf.clear28 = and i32 %11, 2047
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i64 0, i64 0), i32 %bf.clear22, i32 %bf.clear28) nounwind
  br label %if.end30

if.end30:                                         ; preds = %entry, %if.then24
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @testOnes()
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str62, i64 0, i64 0))
  %call2 = tail call i32 @testTwos()
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str63, i64 0, i64 0))
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, 16777215
  %2 = or i32 %1, 1258291200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str51, i64 0, i64 0)) nounwind
  %tmp15.i = load %struct.bfs** @p, align 8
  %3 = bitcast %struct.bfs* %tmp15.i to i32*
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, 1879048192
  store i32 %6, i32* %3, align 4
  %tmp16.i = load %struct.bfs** @p, align 8
  %7 = bitcast %struct.bfs* %tmp16.i to i32*
  %8 = load i32* %7, align 4
  %.mask.i = and i32 %8, -16777216
  %cmp18.i = icmp eq i32 %.mask.i, 1879048192
  br i1 %cmp18.i, label %testEights.exit, label %if.then20.i

if.then20.i:                                      ; preds = %entry
  %puts1.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str52, i64 0, i64 0)) nounwind
  br label %testEights.exit

testEights.exit:                                  ; preds = %entry, %if.then20.i
  %puts11 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str64, i64 0, i64 0))
  %9 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %10 = and i32 %9, -65536
  %11 = or i32 %10, 23213
  store i32 %11, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %puts.i1 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str53, i64 0, i64 0)) nounwind
  %tmp19.i = load %struct.bfs** @p, align 8
  %12 = getelementptr inbounds %struct.bfs* %tmp19.i, i64 0, i32 0
  %bf.field.offs.i = getelementptr i8* %12, i64 4
  %13 = bitcast i8* %bf.field.offs.i to i32*
  %14 = load i32* %13, align 4
  %15 = and i32 %14, -65536
  %16 = or i32 %15, 11606
  store i32 %16, i32* %13, align 4
  %tmp20.i = load %struct.bfs** @p, align 8
  %17 = getelementptr inbounds %struct.bfs* %tmp20.i, i64 0, i32 0
  %bf.field.offs21.i = getelementptr i8* %17, i64 4
  %18 = bitcast i8* %bf.field.offs21.i to i32*
  %19 = load i32* %18, align 4
  %bf.clear22.i = and i32 %19, 65535
  %cmp23.i = icmp eq i32 %bf.clear22.i, 11606
  br i1 %cmp23.i, label %testSixteens.exit, label %if.then25.i

if.then25.i:                                      ; preds = %testEights.exit
  %puts1.i2 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str54, i64 0, i64 0)) nounwind
  br label %testSixteens.exit

testSixteens.exit:                                ; preds = %testEights.exit, %if.then25.i
  %puts12 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str65, i64 0, i64 0))
  %call8 = tail call i32 @testPartial()
  %puts13 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str66, i64 0, i64 0))
  %20 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %21 = and i32 %20, -2048
  %22 = or i32 %21, 601
  store i32 %22, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %tmp.i = load %struct.bfs** @p, align 8
  %23 = getelementptr inbounds %struct.bfs* %tmp.i, i64 0, i32 0
  %bf.field.offs.i3 = getelementptr i8* %23, i64 12
  %24 = bitcast i8* %bf.field.offs.i3 to i32*
  %25 = load i32* %24, align 4
  %26 = and i32 %25, -2048
  %27 = or i32 %26, 1025
  store i32 %27, i32* %24, align 4
  %tmp20.i4 = load %struct.bfs** @p, align 8
  %28 = getelementptr inbounds %struct.bfs* %tmp20.i4, i64 0, i32 0
  %bf.field.offs21.i5 = getelementptr i8* %28, i64 12
  %29 = bitcast i8* %bf.field.offs21.i5 to i32*
  %30 = load i32* %29, align 4
  %bf.clear22.i6 = and i32 %30, 2047
  %cmp23.i7 = icmp eq i32 %bf.clear22.i6, 1025
  br i1 %cmp23.i7, label %testJustBigPartial.exit, label %if.then24.i

if.then24.i:                                      ; preds = %testSixteens.exit
  %31 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %bf.clear28.i = and i32 %31, 2047
  %call29.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i64 0, i64 0), i32 %bf.clear22.i6, i32 %bf.clear28.i) nounwind
  br label %testJustBigPartial.exit

testJustBigPartial.exit:                          ; preds = %testSixteens.exit, %if.then24.i
  %puts14 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str67, i64 0, i64 0))
  %32 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %33 = and i32 %32, -65536
  %34 = or i32 %33, 60417
  store i32 %34, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %tmp.i8 = load %struct.bfs** @p, align 8
  %35 = getelementptr inbounds %struct.bfs* %tmp.i8, i64 0, i32 0
  %bf.field.offs.i9 = getelementptr i8* %35, i64 8
  %36 = bitcast i8* %bf.field.offs.i9 to i32*
  %37 = load i32* %36, align 4
  %38 = and i32 %37, -8192
  %39 = or i32 %38, 2000
  store i32 %39, i32* %36, align 4
  %tmp32.i = load %struct.bfs** @p, align 8
  %40 = getelementptr inbounds %struct.bfs* %tmp32.i, i64 0, i32 0
  %bf.field.offs33.i = getelementptr i8* %40, i64 8
  %41 = bitcast i8* %bf.field.offs33.i to i32*
  %42 = load i32* %41, align 4
  %bf.clear34.i = and i32 %42, 8191
  %cmp35.i = icmp eq i32 %bf.clear34.i, 2000
  br i1 %cmp35.i, label %testBigPartial.exit, label %if.then36.i

if.then36.i:                                      ; preds = %testJustBigPartial.exit
  %43 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %bf.clear40.i = and i32 %43, 8191
  %call41.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i64 0, i64 0), i32 %bf.clear34.i, i32 %bf.clear40.i) nounwind
  br label %testBigPartial.exit

testBigPartial.exit:                              ; preds = %testJustBigPartial.exit, %if.then36.i
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str68, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
