; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/whitebox.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bigstruct = type { i32, i32, i32, i32*, i32, i32, i32, %struct.bigstruct* }

@main.data = internal unnamed_addr constant [2 x i32] [i32 1, i32 0], align 4
@.str = private unnamed_addr constant [5 x i8] c"w%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"y%d\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"zc%d\0A\00", align 1
@main.pad = internal constant [64 x i32] [i32 128, i32 5, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@main.arrayOfStrings = internal constant [14 x i8*] [i8* getelementptr inbounds ([1 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str16, i32 0, i32 0)], align 16
@.str3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str4 = private unnamed_addr constant [33 x i8] c"d41d8cd98f00b204e9800998ecf8427e\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str6 = private unnamed_addr constant [33 x i8] c"0cc175b9c0f1b6a831c399e269772661\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str8 = private unnamed_addr constant [33 x i8] c"900150983cd24fb0d6963f7d28e17f72\00", align 1
@.str9 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str10 = private unnamed_addr constant [33 x i8] c"f96b697d7cb7938d525a2f31aaf161d0\00", align 1
@.str11 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str12 = private unnamed_addr constant [33 x i8] c"c3fcd3d76192e4007dfb496cca67e13b\00", align 1
@.str13 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str14 = private unnamed_addr constant [33 x i8] c"d174ab98d277d9f5a5611c2c9f419d9f\00", align 1
@.str15 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str16 = private unnamed_addr constant [33 x i8] c"57edf4a22be3c955ac49da2e2107b67a\00", align 1
@.str17 = private unnamed_addr constant [6 x i8] c"za%d\0A\00", align 1
@.str18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str19 = private unnamed_addr constant [6 x i8] c"zb%d\0A\00", align 1
@main.fpArray = internal unnamed_addr constant [12 x i32 ()*] [i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main], align 16
@.str20 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %pp = alloca i32**, align 8
  %ap = alloca [2 x i32*], align 16
  %app = alloca i32**, align 8
  %data = alloca [2 x i32], align 4
  %s = alloca %struct.bigstruct, align 8
  %ps = alloca %struct.bigstruct*, align 8
  %fpArray = alloca [12 x i32 ()*], align 16
  %multidem = alloca [2 x [2 x [2 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %kk = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  store i32** %p, i32*** %pp, align 8
  %.array = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  %tmp = load i32** %p, align 8
  store i32* %tmp, i32** %.array
  %.array1 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 1
  %tmp2 = load i32** %p, align 8
  store i32* %tmp2, i32** %.array1
  %arraydecay = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  store i32** %arraydecay, i32*** %app, align 8
  %tmp5 = bitcast [2 x i32]* %data to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* bitcast ([2 x i32]* @main.data to i8*), i64 8, i32 4, i1 false)
  %tmp6 = load i32* %x, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %x, align 4
  %tmp7 = load i32** %p, align 8
  %tmp8 = load i32* %tmp7
  %inc9 = add nsw i32 %tmp8, 1
  store i32 %inc9, i32* %tmp7
  %tmp10 = load i32*** %pp, align 8
  %tmp11 = load i32** %tmp10
  %tmp12 = load i32* %tmp11
  %inc13 = add nsw i32 %tmp12, 1
  store i32 %inc13, i32* %tmp11
  %tmp14 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %tmp14)
  %arraydecay15 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %data, i32 0, i64 0
  %tmp16 = load i32* %arrayidx, align 4
  %idx.ext = sext i32 %tmp16 to i64
  %add.ptr = getelementptr inbounds i32** %arraydecay15, i64 %idx.ext
  %tmp17 = load i32** %add.ptr
  %tmp18 = load i32* %tmp17
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %tmp17
  %arrayidx20 = getelementptr inbounds [2 x i32]* %data, i32 0, i64 1
  %tmp21 = load i32* %arrayidx20, align 4
  %idxprom = sext i32 %tmp21 to i64
  %arrayidx22 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i64 %idxprom
  %tmp23 = load i32** %arrayidx22, align 8
  %tmp24 = load i32* %tmp23
  %inc25 = add nsw i32 %tmp24, 1
  store i32 %inc25, i32* %tmp23
  store %struct.bigstruct* %s, %struct.bigstruct** %ps, align 8
  %a = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 0
  store i32 1, i32* %a, align 4
  %b = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 2
  store i32 3, i32* %c, align 4
  %d = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 4
  store i32 4, i32* %d, align 4
  %e = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  store i32 5, i32* %e, align 4
  %f = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  store i32 6, i32* %f, align 4
  %b28 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %p29 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 3
  store i32* %b28, i32** %p29, align 8
  %this = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  store %struct.bigstruct* %s, %struct.bigstruct** %this, align 8
  %tmp30 = load i32* %x, align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %tmp30)
  %this32 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %tmp33 = load %struct.bigstruct** %this32, align 8
  %p34 = getelementptr inbounds %struct.bigstruct* %tmp33, i32 0, i32 3
  %tmp35 = load i32** %p34, align 8
  %tmp36 = load i32* %tmp35
  %tmp37 = load i32* %x, align 4
  %add = add nsw i32 %tmp37, %tmp36
  store i32 %add, i32* %x, align 4
  %b38 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %tmp39 = load i32* %b38, align 4
  %e40 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  %tmp41 = load i32* %e40, align 4
  %add42 = add nsw i32 %tmp39, %tmp41
  %f43 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  %tmp44 = load i32* %f43, align 4
  %add45 = add nsw i32 %add42, %tmp44
  %tmp46 = load i32* %x, align 4
  %add47 = add nsw i32 %tmp46, %add45
  store i32 %add47, i32* %x, align 4
  %this48 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %tmp49 = load %struct.bigstruct** %this48, align 8
  %p50 = getelementptr inbounds %struct.bigstruct* %tmp49, i32 0, i32 3
  %tmp51 = load i32** %p50, align 8
  %tmp52 = load i32* %tmp51
  %inc53 = add nsw i32 %tmp52, 1
  store i32 %inc53, i32* %tmp51
  %b54 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %tmp55 = load i32* %b54, align 4
  %tmp56 = load i32* %x, align 4
  %add57 = add nsw i32 %tmp56, %tmp55
  store i32 %add57, i32* %x, align 4
  %tmp58 = load i32* %x, align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([64 x i32]* @main.pad, i32 0, i64 1), align 4
  %idxprom61 = sext i32 %tmp60 to i64
  %arrayidx62 = getelementptr inbounds [64 x i32]* @main.pad, i32 0, i64 %idxprom61
  %tmp63 = load i32* %arrayidx62, align 4
  %tmp64 = load i32* %x, align 4
  %add65 = add nsw i32 %tmp64, %tmp63
  store i32 %add65, i32* %x, align 4
  %tmp66 = load i32* %x, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str17, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 0), align 8
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %tmp68)
  %tmp70 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %tmp70)
  %tmp72 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 2), align 8
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %tmp72)
  %tmp74 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %arrayidx75 = getelementptr inbounds i8* %tmp74, i64 0
  %tmp76 = load i8* %arrayidx75
  %conv = sext i8 %tmp76 to i32
  %cmp = icmp eq i32 %conv, 100
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp78 = load i32* %x, align 4
  %inc79 = add nsw i32 %tmp78, 1
  store i32 %inc79, i32* %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp80 = load i32* %x, align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str19, i32 0, i32 0), i32 %tmp80)
  %tmp83 = bitcast [12 x i32 ()*]* %fpArray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp83, i8* bitcast ([12 x i32 ()*]* @main.fpArray to i8*), i64 96, i32 16, i1 false)
  %arrayidx85 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx86 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx85, i32 0, i64 0
  %arrayidx87 = getelementptr inbounds [2 x i32]* %arrayidx86, i32 0, i64 0
  store i32 1, i32* %arrayidx87, align 4
  %arrayidx88 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx89 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx88, i32 0, i64 0
  %arrayidx90 = getelementptr inbounds [2 x i32]* %arrayidx89, i32 0, i64 1
  store i32 2, i32* %arrayidx90, align 4
  %arrayidx91 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx92 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx91, i32 0, i64 1
  %arrayidx93 = getelementptr inbounds [2 x i32]* %arrayidx92, i32 0, i64 0
  store i32 3, i32* %arrayidx93, align 4
  %arrayidx94 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx95 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx94, i32 0, i64 1
  %arrayidx96 = getelementptr inbounds [2 x i32]* %arrayidx95, i32 0, i64 1
  store i32 4, i32* %arrayidx96, align 4
  %arrayidx97 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx98 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx97, i32 0, i64 0
  %arrayidx99 = getelementptr inbounds [2 x i32]* %arrayidx98, i32 0, i64 0
  store i32 5, i32* %arrayidx99, align 4
  %arrayidx100 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx101 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx100, i32 0, i64 0
  %arrayidx102 = getelementptr inbounds [2 x i32]* %arrayidx101, i32 0, i64 1
  store i32 6, i32* %arrayidx102, align 4
  %arrayidx103 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx104 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx103, i32 0, i64 1
  %arrayidx105 = getelementptr inbounds [2 x i32]* %arrayidx104, i32 0, i64 0
  store i32 7, i32* %arrayidx105, align 4
  %arrayidx106 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx107 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx106, i32 0, i64 1
  %arrayidx108 = getelementptr inbounds [2 x i32]* %arrayidx107, i32 0, i64 1
  store i32 8, i32* %arrayidx108, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc143, %if.end
  %tmp110 = load i32* %i, align 4
  %cmp111 = icmp slt i32 %tmp110, 2
  br i1 %cmp111, label %for.body, label %for.end146

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond114

for.cond114:                                      ; preds = %for.inc139, %for.body
  %tmp115 = load i32* %j, align 4
  %cmp116 = icmp slt i32 %tmp115, 2
  br i1 %cmp116, label %for.body118, label %for.end142

for.body118:                                      ; preds = %for.cond114
  store i32 0, i32* %kk, align 4
  br label %for.cond120

for.cond120:                                      ; preds = %for.inc, %for.body118
  %tmp121 = load i32* %kk, align 4
  %cmp122 = icmp slt i32 %tmp121, 2
  br i1 %cmp122, label %for.body124, label %for.end

for.body124:                                      ; preds = %for.cond120
  %tmp125 = load i32* %kk, align 4
  %idxprom126 = sext i32 %tmp125 to i64
  %tmp127 = load i32* %j, align 4
  %idxprom128 = sext i32 %tmp127 to i64
  %tmp129 = load i32* %i, align 4
  %idxprom130 = sext i32 %tmp129 to i64
  %arrayidx131 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 %idxprom130
  %arrayidx132 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx131, i32 0, i64 %idxprom128
  %arrayidx133 = getelementptr inbounds [2 x i32]* %arrayidx132, i32 0, i64 %idxprom126
  %tmp134 = load i32* %arrayidx133, align 4
  %tmp135 = load i32* %x, align 4
  %add136 = add nsw i32 %tmp135, %tmp134
  store i32 %add136, i32* %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body124
  %tmp137 = load i32* %kk, align 4
  %inc138 = add nsw i32 %tmp137, 1
  store i32 %inc138, i32* %kk, align 4
  br label %for.cond120

for.end:                                          ; preds = %for.cond120
  br label %for.inc139

for.inc139:                                       ; preds = %for.end
  %tmp140 = load i32* %j, align 4
  %inc141 = add nsw i32 %tmp140, 1
  store i32 %inc141, i32* %j, align 4
  br label %for.cond114

for.end142:                                       ; preds = %for.cond114
  br label %for.inc143

for.inc143:                                       ; preds = %for.end142
  %tmp144 = load i32* %i, align 4
  %inc145 = add nsw i32 %tmp144, 1
  store i32 %inc145, i32* %i, align 4
  br label %for.cond

for.end146:                                       ; preds = %for.cond
  store i32 0, i32* %y, align 4
  %tmp148 = load i32* %y, align 4
  %inc149 = add nsw i32 %tmp148, 1
  store i32 %inc149, i32* %y, align 4
  %tmp150 = load i32* %y, align 4
  %add151 = add nsw i32 %tmp150, 3
  store i32 %add151, i32* %y, align 4
  %tmp152 = load i32* %y, align 4
  %inc153 = add nsw i32 %tmp152, 1
  store i32 %inc153, i32* %y, align 4
  %tmp154 = load i32* %x, align 4
  %add155 = add nsw i32 %tmp154, %inc153
  store i32 %add155, i32* %x, align 4
  %tmp156 = load i32* %x, align 4
  %call157 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i32 %tmp156)
  %tmp158 = load i32* %x, align 4
  ret i32 %tmp158
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
