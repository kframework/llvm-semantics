; ModuleID = '/home/david/src/c-semantics/tests/unitTests/bitfields.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfs = type <{ i8, i8, i8, i8, [2 x i8], i8, i8, [2 x i8], [2 x i8], [2 x i8], [2 x i8], i8, [3 x i8] }>

@s = common global %struct.bfs zeroinitializer, align 4
@p = global %struct.bfs* @s, align 8
@.str5 = private unnamed_addr constant [13 x i8] c"BUG: a4: %d\0A\00", align 1
@.str28 = private unnamed_addr constant [13 x i8] c"BUG: e3: %d\0A\00", align 1
@.str36 = private unnamed_addr constant [18 x i8] c"BUG: i4 : %d, %d\0A\00", align 1
@.str41 = private unnamed_addr constant [18 x i8] c"BUG: k4 : %d, %d\0A\00", align 1
@str68 = private unnamed_addr constant [8 x i8] c"BUG: a2\00"
@str71 = private unnamed_addr constant [8 x i8] c"BUG: a3\00"
@str76 = private unnamed_addr constant [8 x i8] c"BUG: a5\00"
@str79 = private unnamed_addr constant [8 x i8] c"BUG: a6\00"
@str98 = private unnamed_addr constant [8 x i8] c"BUG: b6\00"
@str99 = private unnamed_addr constant [15 x i8] c"byte interp OK\00"
@str100 = private unnamed_addr constant [8 x i8] c"BUG: d3\00"
@str101 = private unnamed_addr constant [16 x i8] c"short interp OK\00"
@str102 = private unnamed_addr constant [8 x i8] c"BUG: e3\00"
@str106 = private unnamed_addr constant [8 x i8] c"BUG: f1\00"
@str107 = private unnamed_addr constant [8 x i8] c"BUG: f2\00"
@str108 = private unnamed_addr constant [3 x i8] c"ok\00"
@str109 = private unnamed_addr constant [8 x i8] c"BUG: f4\00"
@str110 = private unnamed_addr constant [14 x i8] c"finished ones\00"
@str111 = private unnamed_addr constant [14 x i8] c"finished twos\00"
@str112 = private unnamed_addr constant [16 x i8] c"finished eights\00"
@str113 = private unnamed_addr constant [18 x i8] c"finished sixteens\00"
@str114 = private unnamed_addr constant [17 x i8] c"finished partial\00"
@str115 = private unnamed_addr constant [26 x i8] c"finished just big partial\00"
@str116 = private unnamed_addr constant [21 x i8] c"finished big partial\00"

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
  %puts199 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str68, i64 0, i64 0))
  %.pre221 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.end105
  %5 = phi i32 [ %.pre221, %if.then108 ], [ %4, %if.end105 ]
  %bf.clear111 = and i32 %5, 128
  %cmp112 = icmp eq i32 %bf.clear111, 0
  br i1 %cmp112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.end110
  %puts200 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str68, i64 0, i64 0))
  %.pre222 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.end110
  %6 = phi i32 [ %.pre222, %if.then113 ], [ %5, %if.end110 ]
  %7 = and i32 %6, -65
  store i32 %7, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %bf.clear116 = and i32 %6, 32
  %cmp117 = icmp eq i32 %bf.clear116, 0
  br i1 %cmp117, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.end115
  %puts201 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str71, i64 0, i64 0))
  %.pre223 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.end115
  %.in = phi i32 [ %.pre223, %if.then118 ], [ %7, %if.end115 ]
  %bf.clear121 = and i32 %.in, 64
  %cmp122 = icmp eq i32 %bf.clear121, 0
  br i1 %cmp122, label %if.end125, label %if.then123

if.then123:                                       ; preds = %if.end120
  %puts202 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str71, i64 0, i64 0))
  %.pre224 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  br label %if.end125

if.end125:                                        ; preds = %if.end120, %if.then123
  %.in240 = phi i32 [ %.in, %if.end120 ], [ %.pre224, %if.then123 ]
  %8 = trunc i32 %.in240 to i8
  %bf.clear126 = and i32 %.in240, 128
  %cmp127 = icmp eq i32 %bf.clear126, 0
  br i1 %cmp127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.end125
  %puts203 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str71, i64 0, i64 0))
  %.pre225 = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 0), align 4, !tbaa !0
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.end125
  %9 = phi i8 [ %.pre225, %if.then128 ], [ %8, %if.end125 ]
  switch i8 %9, label %if.else140 [
    i8 -75, label %if.then133
    i8 -83, label %if.then138
  ]

if.then133:                                       ; preds = %if.end130
  %puts204 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0))
  br label %if.end144

if.then138:                                       ; preds = %if.end130
  %puts205 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0))
  br label %if.end144

if.else140:                                       ; preds = %if.end130
  %conv = zext i8 %9 to i32
  %call142 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str5, i64 0, i64 0), i32 %conv) nounwind
  br label %if.end144

if.end144:                                        ; preds = %if.then138, %if.else140, %if.then133
  %10 = load %struct.bfs** @p, align 8, !tbaa !2
  %11 = bitcast %struct.bfs* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = or i32 %12, 64
  store i32 %13, i32* %11, align 4
  %14 = load %struct.bfs** @p, align 8, !tbaa !2
  %15 = bitcast %struct.bfs* %14 to i32*
  %16 = load i32* %15, align 4
  %bf.clear145 = and i32 %16, 32
  %cmp146 = icmp eq i32 %bf.clear145, 0
  br i1 %cmp146, label %if.then148, label %if.end150

if.then148:                                       ; preds = %if.end144
  %puts206 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str76, i64 0, i64 0))
  %.pre226 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert = bitcast %struct.bfs* %.pre226 to i32*
  %.pre227 = load i32* %.phi.trans.insert, align 4
  br label %if.end150

if.end150:                                        ; preds = %if.then148, %if.end144
  %17 = phi i32 [ %.pre227, %if.then148 ], [ %16, %if.end144 ]
  %18 = phi %struct.bfs* [ %.pre226, %if.then148 ], [ %14, %if.end144 ]
  %bf.clear151 = and i32 %17, 64
  %cmp152 = icmp eq i32 %bf.clear151, 0
  br i1 %cmp152, label %if.then154, label %if.end156

if.then154:                                       ; preds = %if.end150
  %puts207 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str76, i64 0, i64 0))
  %.pre228 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert229 = bitcast %struct.bfs* %.pre228 to i32*
  %.pre230 = load i32* %.phi.trans.insert229, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.end150
  %19 = phi i32 [ %.pre230, %if.then154 ], [ %17, %if.end150 ]
  %20 = phi %struct.bfs* [ %.pre228, %if.then154 ], [ %18, %if.end150 ]
  %bf.clear157 = and i32 %19, 128
  %cmp158 = icmp eq i32 %bf.clear157, 0
  br i1 %cmp158, label %if.then160, label %if.end162

if.then160:                                       ; preds = %if.end156
  %puts208 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str76, i64 0, i64 0))
  %.pre231 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert232 = bitcast %struct.bfs* %.pre231 to i32*
  %.pre233 = load i32* %.phi.trans.insert232, align 4
  br label %if.end162

if.end162:                                        ; preds = %if.then160, %if.end156
  %21 = phi i32 [ %.pre233, %if.then160 ], [ %19, %if.end156 ]
  %22 = phi %struct.bfs* [ %.pre231, %if.then160 ], [ %20, %if.end156 ]
  %23 = bitcast %struct.bfs* %22 to i32*
  %24 = and i32 %21, -33
  store i32 %24, i32* %23, align 4
  %25 = load %struct.bfs** @p, align 8, !tbaa !2
  %26 = bitcast %struct.bfs* %25 to i32*
  %27 = load i32* %26, align 4
  %28 = and i32 %27, -129
  store i32 %28, i32* %26, align 4
  %29 = load %struct.bfs** @p, align 8, !tbaa !2
  %30 = bitcast %struct.bfs* %29 to i32*
  %31 = load i32* %30, align 4
  %32 = or i32 %31, 64
  store i32 %32, i32* %30, align 4
  %33 = load %struct.bfs** @p, align 8, !tbaa !2
  %34 = bitcast %struct.bfs* %33 to i32*
  %35 = load i32* %34, align 4
  %bf.clear163 = and i32 %35, 32
  %cmp164 = icmp eq i32 %bf.clear163, 0
  br i1 %cmp164, label %if.end168, label %if.then166

if.then166:                                       ; preds = %if.end162
  %puts209 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str79, i64 0, i64 0))
  %.pre234 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert235 = bitcast %struct.bfs* %.pre234 to i32*
  %.pre236 = load i32* %.phi.trans.insert235, align 4
  br label %if.end168

if.end168:                                        ; preds = %if.end162, %if.then166
  %36 = phi i32 [ %35, %if.end162 ], [ %.pre236, %if.then166 ]
  %bf.clear169 = and i32 %36, 64
  %cmp170 = icmp eq i32 %bf.clear169, 0
  br i1 %cmp170, label %if.then172, label %if.end174

if.then172:                                       ; preds = %if.end168
  %puts210 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str79, i64 0, i64 0))
  %.pre237 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert238 = bitcast %struct.bfs* %.pre237 to i32*
  %.pre239 = load i32* %.phi.trans.insert238, align 4
  br label %if.end174

if.end174:                                        ; preds = %if.then172, %if.end168
  %37 = phi i32 [ %.pre239, %if.then172 ], [ %36, %if.end168 ]
  %bf.clear175 = and i32 %37, 128
  %cmp176 = icmp eq i32 %bf.clear175, 0
  br i1 %cmp176, label %if.end180, label %if.then178

if.then178:                                       ; preds = %if.end174
  %puts211 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str79, i64 0, i64 0))
  br label %if.end180

if.end180:                                        ; preds = %if.end174, %if.then178
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @testTwos() nounwind uwtable {
if.end109:
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, -65281
  %2 = or i32 %1, 19200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts142 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0))
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = bitcast %struct.bfs* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = or i32 %5, 12288
  store i32 %6, i32* %4, align 4
  %7 = load %struct.bfs** @p, align 8, !tbaa !2
  %8 = bitcast %struct.bfs* %7 to i32*
  %9 = load i32* %8, align 4
  %bf.clear110 = and i32 %9, 3072
  %cmp111 = icmp eq i32 %bf.clear110, 2048
  br i1 %cmp111, label %if.end115, label %if.then113

if.then113:                                       ; preds = %if.end109
  %puts143 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0))
  %.pre = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert = bitcast %struct.bfs* %.pre to i32*
  %.pre146 = load i32* %.phi.trans.insert, align 4
  br label %if.end115

if.end115:                                        ; preds = %if.end109, %if.then113
  %10 = phi i32 [ %9, %if.end109 ], [ %.pre146, %if.then113 ]
  %bf.clear116 = and i32 %10, 12288
  %cmp117 = icmp eq i32 %bf.clear116, 12288
  br i1 %cmp117, label %if.end121, label %if.then119

if.then119:                                       ; preds = %if.end115
  %puts144 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0))
  %.pre147 = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert148 = bitcast %struct.bfs* %.pre147 to i32*
  %.pre149 = load i32* %.phi.trans.insert148, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.end115, %if.then119
  %11 = phi i32 [ %10, %if.end115 ], [ %.pre149, %if.then119 ]
  %bf.clear122 = and i32 %11, 49152
  %cmp123 = icmp eq i32 %bf.clear122, 16384
  br i1 %cmp123, label %if.end127, label %if.then125

if.then125:                                       ; preds = %if.end121
  %puts145 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0))
  br label %if.end127

if.end127:                                        ; preds = %if.end121, %if.then125
  ret i32 0
}

define i32 @testEights() nounwind uwtable {
if.end12:
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, 16777215
  %2 = or i32 %1, 1258291200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0))
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = bitcast %struct.bfs* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, 1879048192
  store i32 %7, i32* %4, align 4
  %8 = load %struct.bfs** @p, align 8, !tbaa !2
  %9 = bitcast %struct.bfs* %8 to i32*
  %10 = load i32* %9, align 4
  %.mask = and i32 %10, -16777216
  %cmp14 = icmp eq i32 %.mask, 1879048192
  br i1 %cmp14, label %if.end18, label %if.then16

if.then16:                                        ; preds = %if.end12
  %puts19 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str100, i64 0, i64 0))
  br label %if.end18

if.end18:                                         ; preds = %if.end12, %if.then16
  ret i32 0
}

define i32 @testSixteens() nounwind uwtable {
if.end15:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %1 = and i32 %0, -65536
  %2 = or i32 %1, 23213
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str101, i64 0, i64 0))
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = getelementptr inbounds %struct.bfs* %3, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %4, i64 4
  %5 = bitcast i8* %bf.field.offs to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %6, -65536
  %8 = or i32 %7, 11606
  store i32 %8, i32* %5, align 4
  %9 = load %struct.bfs** @p, align 8, !tbaa !2
  %10 = getelementptr inbounds %struct.bfs* %9, i64 0, i32 0
  %bf.field.offs16 = getelementptr i8* %10, i64 4
  %11 = bitcast i8* %bf.field.offs16 to i32*
  %12 = load i32* %11, align 4
  %bf.clear17 = and i32 %12, 65535
  %cmp18 = icmp eq i32 %bf.clear17, 11606
  br i1 %cmp18, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end15
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str102, i64 0, i64 0))
  br label %if.end22

if.end22:                                         ; preds = %if.end15, %if.then20
  ret i32 0
}

define i32 @testPartial() nounwind uwtable {
if.end5:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %1 = and i32 %0, -4128769
  %2 = or i32 %1, 2949120
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  store i8 75, i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4, !tbaa !0
  %3 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %bf.clear6 = and i32 %3, 4128768
  %cmp7 = icmp eq i32 %bf.clear6, 2949120
  br i1 %cmp7, label %if.end17.thread, label %if.end11

if.end11:                                         ; preds = %if.end5
  %puts46 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str106, i64 0, i64 0))
  %.pr52 = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4, !tbaa !0
  %cmp13 = icmp eq i8 %.pr52, 75
  br i1 %cmp13, label %if.end17.thread, label %if.end17

if.end17.thread:                                  ; preds = %if.end5, %if.end11
  %4 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %5 = and i32 %4, -4128769
  %6 = or i32 %5, 1376256
  store i32 %6, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  br label %if.then33

if.end17:                                         ; preds = %if.end11
  %puts47 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str106, i64 0, i64 0))
  %.pre = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4, !tbaa !0
  %phitmp = icmp eq i8 %.pre, 75
  %7 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %8 = and i32 %7, -4128769
  %9 = or i32 %8, 1376256
  store i32 %9, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  br i1 %phitmp, label %if.then33, label %if.end29

if.end29:                                         ; preds = %if.end17
  %puts48 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str107, i64 0, i64 0))
  %.pr54 = load i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 11), align 4, !tbaa !0
  %cmp31 = icmp eq i8 %.pr54, 75
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %if.end17.thread, %if.end17, %if.end29
  %puts49 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8]* @str108, i64 0, i64 0))
  br label %if.end37

if.else:                                          ; preds = %if.end29
  %conv30 = zext i8 %.pr54 to i32
  %call36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str28, i64 0, i64 0), i32 %conv30) nounwind
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.then33
  %10 = load %struct.bfs** @p, align 8, !tbaa !2
  %g = getelementptr inbounds %struct.bfs* %10, i64 0, i32 11
  store i8 119, i8* %g, align 1, !tbaa !0
  %11 = load %struct.bfs** @p, align 8, !tbaa !2
  %g38 = getelementptr inbounds %struct.bfs* %11, i64 0, i32 11
  %12 = load i8* %g38, align 1, !tbaa !0
  %cmp40 = icmp eq i8 %12, 119
  br i1 %cmp40, label %if.end44, label %if.then42

if.then42:                                        ; preds = %if.end37
  %puts50 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str109, i64 0, i64 0))
  br label %if.end44

if.end44:                                         ; preds = %if.end37, %if.then42
  ret i32 0
}

define i32 @testBigPartial() nounwind uwtable {
if.end31:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %1 = and i32 %0, -65536
  %2 = or i32 %1, 60417
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = getelementptr inbounds %struct.bfs* %3, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %4, i64 8
  %5 = bitcast i8* %bf.field.offs to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %6, -8192
  %8 = or i32 %7, 2000
  store i32 %8, i32* %5, align 4
  %9 = load %struct.bfs** @p, align 8, !tbaa !2
  %10 = getelementptr inbounds %struct.bfs* %9, i64 0, i32 0
  %bf.field.offs32 = getelementptr i8* %10, i64 8
  %11 = bitcast i8* %bf.field.offs32 to i32*
  %12 = load i32* %11, align 4
  %bf.clear33 = and i32 %12, 8191
  %cmp34 = icmp eq i32 %bf.clear33, 2000
  br i1 %cmp34, label %if.end40, label %if.then35

if.then35:                                        ; preds = %if.end31
  %13 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %bf.clear38 = and i32 %13, 8191
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i64 0, i64 0), i32 %bf.clear33, i32 %bf.clear38) nounwind
  br label %if.end40

if.end40:                                         ; preds = %if.end31, %if.then35
  ret i32 0
}

define i32 @testJustBigPartial() nounwind uwtable {
entry:
  %0 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %1 = and i32 %0, -2048
  %2 = or i32 %1, 601
  store i32 %2, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = getelementptr inbounds %struct.bfs* %3, i64 0, i32 0
  %bf.field.offs = getelementptr i8* %4, i64 12
  %5 = bitcast i8* %bf.field.offs to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %6, -2048
  %8 = or i32 %7, 1025
  store i32 %8, i32* %5, align 4
  %9 = load %struct.bfs** @p, align 8, !tbaa !2
  %10 = getelementptr inbounds %struct.bfs* %9, i64 0, i32 0
  %bf.field.offs20 = getelementptr i8* %10, i64 12
  %11 = bitcast i8* %bf.field.offs20 to i32*
  %12 = load i32* %11, align 4
  %bf.clear21 = and i32 %12, 2047
  %cmp22 = icmp eq i32 %bf.clear21, 1025
  br i1 %cmp22, label %if.end28, label %if.then23

if.then23:                                        ; preds = %entry
  %13 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %bf.clear26 = and i32 %13, 2047
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i64 0, i64 0), i32 %bf.clear21, i32 %bf.clear26) nounwind
  br label %if.end28

if.end28:                                         ; preds = %entry, %if.then23
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @testOnes()
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str110, i64 0, i64 0))
  %0 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %1 = and i32 %0, -65281
  %2 = or i32 %1, 19200
  store i32 %2, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts142.i = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0)) nounwind
  %3 = load %struct.bfs** @p, align 8, !tbaa !2
  %4 = bitcast %struct.bfs* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = or i32 %5, 12288
  store i32 %6, i32* %4, align 4
  %7 = load %struct.bfs** @p, align 8, !tbaa !2
  %8 = bitcast %struct.bfs* %7 to i32*
  %9 = load i32* %8, align 4
  %bf.clear110.i = and i32 %9, 3072
  %cmp111.i = icmp eq i32 %bf.clear110.i, 2048
  br i1 %cmp111.i, label %if.end115.i, label %if.then113.i

if.then113.i:                                     ; preds = %entry
  %puts143.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0)) nounwind
  %.pre.i = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert.i = bitcast %struct.bfs* %.pre.i to i32*
  %.pre146.i = load i32* %.phi.trans.insert.i, align 4
  br label %if.end115.i

if.end115.i:                                      ; preds = %if.then113.i, %entry
  %10 = phi i32 [ %9, %entry ], [ %.pre146.i, %if.then113.i ]
  %bf.clear116.i = and i32 %10, 12288
  %cmp117.i = icmp eq i32 %bf.clear116.i, 12288
  br i1 %cmp117.i, label %if.end121.i, label %if.then119.i

if.then119.i:                                     ; preds = %if.end115.i
  %puts144.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0)) nounwind
  %.pre147.i = load %struct.bfs** @p, align 8, !tbaa !2
  %.phi.trans.insert148.i = bitcast %struct.bfs* %.pre147.i to i32*
  %.pre149.i = load i32* %.phi.trans.insert148.i, align 4
  br label %if.end121.i

if.end121.i:                                      ; preds = %if.then119.i, %if.end115.i
  %11 = phi i32 [ %10, %if.end115.i ], [ %.pre149.i, %if.then119.i ]
  %bf.clear122.i = and i32 %11, 49152
  %cmp123.i = icmp eq i32 %bf.clear122.i, 16384
  br i1 %cmp123.i, label %testTwos.exit, label %if.then125.i

if.then125.i:                                     ; preds = %if.end121.i
  %puts145.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str98, i64 0, i64 0)) nounwind
  br label %testTwos.exit

testTwos.exit:                                    ; preds = %if.end121.i, %if.then125.i
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str111, i64 0, i64 0))
  %12 = load i32* bitcast (%struct.bfs* @s to i32*), align 4
  %13 = and i32 %12, 16777215
  %14 = or i32 %13, 1258291200
  store i32 %14, i32* bitcast (%struct.bfs* @s to i32*), align 4
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str99, i64 0, i64 0)) nounwind
  %15 = load %struct.bfs** @p, align 8, !tbaa !2
  %16 = bitcast %struct.bfs* %15 to i32*
  %17 = load i32* %16, align 4
  %18 = and i32 %17, 16777215
  %19 = or i32 %18, 1879048192
  store i32 %19, i32* %16, align 4
  %20 = load %struct.bfs** @p, align 8, !tbaa !2
  %21 = bitcast %struct.bfs* %20 to i32*
  %22 = load i32* %21, align 4
  %.mask.i = and i32 %22, -16777216
  %cmp14.i = icmp eq i32 %.mask.i, 1879048192
  br i1 %cmp14.i, label %testEights.exit, label %if.then16.i

if.then16.i:                                      ; preds = %testTwos.exit
  %puts19.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str100, i64 0, i64 0)) nounwind
  br label %testEights.exit

testEights.exit:                                  ; preds = %testTwos.exit, %if.then16.i
  %puts18 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str112, i64 0, i64 0))
  %23 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %24 = and i32 %23, -65536
  %25 = or i32 %24, 23213
  store i32 %25, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 4, i64 0) to i32*), align 4
  %puts.i14 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str101, i64 0, i64 0)) nounwind
  %26 = load %struct.bfs** @p, align 8, !tbaa !2
  %27 = getelementptr inbounds %struct.bfs* %26, i64 0, i32 0
  %bf.field.offs.i = getelementptr i8* %27, i64 4
  %28 = bitcast i8* %bf.field.offs.i to i32*
  %29 = load i32* %28, align 4
  %30 = and i32 %29, -65536
  %31 = or i32 %30, 11606
  store i32 %31, i32* %28, align 4
  %32 = load %struct.bfs** @p, align 8, !tbaa !2
  %33 = getelementptr inbounds %struct.bfs* %32, i64 0, i32 0
  %bf.field.offs16.i = getelementptr i8* %33, i64 4
  %34 = bitcast i8* %bf.field.offs16.i to i32*
  %35 = load i32* %34, align 4
  %bf.clear17.i = and i32 %35, 65535
  %cmp18.i = icmp eq i32 %bf.clear17.i, 11606
  br i1 %cmp18.i, label %testSixteens.exit, label %if.then20.i

if.then20.i:                                      ; preds = %testEights.exit
  %puts23.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str102, i64 0, i64 0)) nounwind
  br label %testSixteens.exit

testSixteens.exit:                                ; preds = %testEights.exit, %if.then20.i
  %puts19 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str113, i64 0, i64 0))
  %call8 = tail call i32 @testPartial()
  %puts20 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str114, i64 0, i64 0))
  %36 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %37 = and i32 %36, -2048
  %38 = or i32 %37, 601
  store i32 %38, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %39 = load %struct.bfs** @p, align 8, !tbaa !2
  %40 = getelementptr inbounds %struct.bfs* %39, i64 0, i32 0
  %bf.field.offs.i15 = getelementptr i8* %40, i64 12
  %41 = bitcast i8* %bf.field.offs.i15 to i32*
  %42 = load i32* %41, align 4
  %43 = and i32 %42, -2048
  %44 = or i32 %43, 1025
  store i32 %44, i32* %41, align 4
  %45 = load %struct.bfs** @p, align 8, !tbaa !2
  %46 = getelementptr inbounds %struct.bfs* %45, i64 0, i32 0
  %bf.field.offs20.i = getelementptr i8* %46, i64 12
  %47 = bitcast i8* %bf.field.offs20.i to i32*
  %48 = load i32* %47, align 4
  %bf.clear21.i = and i32 %48, 2047
  %cmp22.i = icmp eq i32 %bf.clear21.i, 1025
  br i1 %cmp22.i, label %testJustBigPartial.exit, label %if.then23.i

if.then23.i:                                      ; preds = %testSixteens.exit
  %49 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 9, i64 0) to i32*), align 4
  %bf.clear26.i = and i32 %49, 2047
  %call27.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str41, i64 0, i64 0), i32 %bf.clear21.i, i32 %bf.clear26.i) nounwind
  br label %testJustBigPartial.exit

testJustBigPartial.exit:                          ; preds = %testSixteens.exit, %if.then23.i
  %puts21 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str115, i64 0, i64 0))
  %50 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %51 = and i32 %50, -65536
  %52 = or i32 %51, 60417
  store i32 %52, i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %53 = load %struct.bfs** @p, align 8, !tbaa !2
  %54 = getelementptr inbounds %struct.bfs* %53, i64 0, i32 0
  %bf.field.offs.i16 = getelementptr i8* %54, i64 8
  %55 = bitcast i8* %bf.field.offs.i16 to i32*
  %56 = load i32* %55, align 4
  %57 = and i32 %56, -8192
  %58 = or i32 %57, 2000
  store i32 %58, i32* %55, align 4
  %59 = load %struct.bfs** @p, align 8, !tbaa !2
  %60 = getelementptr inbounds %struct.bfs* %59, i64 0, i32 0
  %bf.field.offs32.i = getelementptr i8* %60, i64 8
  %61 = bitcast i8* %bf.field.offs32.i to i32*
  %62 = load i32* %61, align 4
  %bf.clear33.i = and i32 %62, 8191
  %cmp34.i = icmp eq i32 %bf.clear33.i, 2000
  br i1 %cmp34.i, label %testBigPartial.exit, label %if.then35.i

if.then35.i:                                      ; preds = %testJustBigPartial.exit
  %63 = load i32* bitcast (i8* getelementptr inbounds (%struct.bfs* @s, i64 0, i32 7, i64 0) to i32*), align 4
  %bf.clear38.i = and i32 %63, 8191
  %call39.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str36, i64 0, i64 0), i32 %bf.clear33.i, i32 %bf.clear38.i) nounwind
  br label %testBigPartial.exit

testBigPartial.exit:                              ; preds = %testJustBigPartial.exit, %if.then35.i
  %puts22 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str116, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"any pointer", metadata !0}
