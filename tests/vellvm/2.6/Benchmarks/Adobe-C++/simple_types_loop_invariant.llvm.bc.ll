; ModuleID = 'simple_types_loop_invariant.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%struct.one_result = type { double, i8* }

@.str = private constant [16 x i8] c"test %i failed\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str11 = private constant [31 x i8] c"Could not allocate %d results\0A\00", align 1 ; <[31 x i8]*> [#uses=1]
@data8 = internal global [8000 x i8] zeroinitializer, align 32 ; <[8000 x i8]*> [#uses=21]
@.str12 = private constant [20 x i8] c"int8_t variable add\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str13 = private constant [28 x i8] c"int8_t variable add hoisted\00", align 1 ; <[28 x i8]*> [#uses=1]
@.str14 = private constant [30 x i8] c"int8_t multiple variable adds\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str15 = private constant [25 x i8] c"int8_t variable subtract\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str16 = private constant [35 x i8] c"int8_t multiple variable subtracts\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str17 = private constant [25 x i8] c"int8_t variable multiply\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str18 = private constant [36 x i8] c"int8_t multiple variable multiplies\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str19 = private constant [37 x i8] c"int8_t multiple variable multiplies2\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str20 = private constant [23 x i8] c"int8_t variable divide\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str21 = private constant [33 x i8] c"int8_t multiple variable divides\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str22 = private constant [34 x i8] c"int8_t multiple variable divides2\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str23 = private constant [31 x i8] c"int8_t multiple variable mixed\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str24 = private constant [20 x i8] c"int8_t variable and\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str25 = private constant [29 x i8] c"int8_t multiple variable and\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str26 = private constant [19 x i8] c"int8_t variable or\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str27 = private constant [28 x i8] c"int8_t multiple variable or\00", align 1 ; <[28 x i8]*> [#uses=1]
@.str28 = private constant [20 x i8] c"int8_t variable xor\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str29 = private constant [29 x i8] c"int8_t multiple variable xor\00", align 1 ; <[29 x i8]*> [#uses=1]
@data8unsigned = internal global [8000 x i8] zeroinitializer, align 32 ; <[8000 x i8]*> [#uses=21]
@.str30 = private constant [21 x i8] c"uint8_t variable add\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str31 = private constant [29 x i8] c"uint8_t variable add hoisted\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str32 = private constant [31 x i8] c"uint8_t multiple variable adds\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str33 = private constant [26 x i8] c"uint8_t variable subtract\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str34 = private constant [36 x i8] c"uint8_t multiple variable subtracts\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str35 = private constant [26 x i8] c"uint8_t variable multiply\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str36 = private constant [37 x i8] c"uint8_t multiple variable multiplies\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str37 = private constant [38 x i8] c"uint8_t multiple variable multiplies2\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str38 = private constant [24 x i8] c"uint8_t variable divide\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str39 = private constant [34 x i8] c"uint8_t multiple variable divides\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str40 = private constant [35 x i8] c"uint8_t multiple variable divides2\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str41 = private constant [32 x i8] c"uint8_t multiple variable mixed\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str42 = private constant [21 x i8] c"uint8_t variable and\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str43 = private constant [30 x i8] c"uint8_t multiple variable and\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str44 = private constant [20 x i8] c"uint8_t variable or\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str45 = private constant [29 x i8] c"uint8_t multiple variable or\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str46 = private constant [21 x i8] c"uint8_t variable xor\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str47 = private constant [30 x i8] c"uint8_t multiple variable xor\00", align 1 ; <[30 x i8]*> [#uses=1]
@data16 = internal global [8000 x i16] zeroinitializer, align 32 ; <[8000 x i16]*> [#uses=19]
@.str48 = private constant [21 x i8] c"int16_t variable add\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str49 = private constant [29 x i8] c"int16_t variable add hoisted\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str50 = private constant [31 x i8] c"int16_t multiple variable adds\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str51 = private constant [26 x i8] c"int16_t variable subtract\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str52 = private constant [36 x i8] c"int16_t multiple variable subtracts\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str53 = private constant [26 x i8] c"int16_t variable multiply\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str54 = private constant [37 x i8] c"int16_t multiple variable multiplies\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str55 = private constant [38 x i8] c"int16_t multiple variable multiplies2\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str56 = private constant [24 x i8] c"int16_t variable divide\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str57 = private constant [34 x i8] c"int16_t multiple variable divides\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str58 = private constant [35 x i8] c"int16_t multiple variable divides2\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str59 = private constant [32 x i8] c"int16_t multiple variable mixed\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str60 = private constant [21 x i8] c"int16_t variable and\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str61 = private constant [30 x i8] c"int16_t multiple variable and\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str62 = private constant [20 x i8] c"int16_t variable or\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str63 = private constant [29 x i8] c"int16_t multiple variable or\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str64 = private constant [21 x i8] c"int16_t variable xor\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str65 = private constant [30 x i8] c"int16_t multiple variable xor\00", align 1 ; <[30 x i8]*> [#uses=1]
@data16unsigned = internal global [8000 x i16] zeroinitializer, align 32 ; <[8000 x i16]*> [#uses=19]
@.str66 = private constant [22 x i8] c"uint16_t variable add\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str67 = private constant [30 x i8] c"uint16_t variable add hoisted\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str68 = private constant [32 x i8] c"uint16_t multiple variable adds\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str69 = private constant [27 x i8] c"uint16_t variable subtract\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str70 = private constant [37 x i8] c"uint16_t multiple variable subtracts\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str71 = private constant [27 x i8] c"uint16_t variable multiply\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str72 = private constant [38 x i8] c"uint16_t multiple variable multiplies\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str73 = private constant [39 x i8] c"uint16_t multiple variable multiplies2\00", align 1 ; <[39 x i8]*> [#uses=1]
@.str74 = private constant [25 x i8] c"uint16_t variable divide\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str75 = private constant [35 x i8] c"uint16_t multiple variable divides\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str76 = private constant [36 x i8] c"uint16_t multiple variable divides2\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str77 = private constant [33 x i8] c"uint16_t multiple variable mixed\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str78 = private constant [22 x i8] c"uint16_t variable and\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str79 = private constant [31 x i8] c"uint16_t multiple variable and\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str80 = private constant [21 x i8] c"uint16_t variable or\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str81 = private constant [30 x i8] c"uint16_t multiple variable or\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str82 = private constant [22 x i8] c"uint16_t variable xor\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str83 = private constant [31 x i8] c"uint16_t multiple variable xor\00", align 1 ; <[31 x i8]*> [#uses=1]
@data32 = internal global [8000 x i32] zeroinitializer, align 32 ; <[8000 x i32]*> [#uses=19]
@.str84 = private constant [21 x i8] c"int32_t variable add\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str85 = private constant [29 x i8] c"int32_t variable add hoisted\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str86 = private constant [31 x i8] c"int32_t multiple variable adds\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str87 = private constant [26 x i8] c"int32_t variable subtract\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str88 = private constant [36 x i8] c"int32_t multiple variable subtracts\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str89 = private constant [26 x i8] c"int32_t variable multiply\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str90 = private constant [37 x i8] c"int32_t multiple variable multiplies\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str91 = private constant [38 x i8] c"int32_t multiple variable multiplies2\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str92 = private constant [24 x i8] c"int32_t variable divide\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str93 = private constant [34 x i8] c"int32_t multiple variable divides\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str94 = private constant [35 x i8] c"int32_t multiple variable divides2\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str95 = private constant [32 x i8] c"int32_t multiple variable mixed\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str96 = private constant [21 x i8] c"int32_t variable and\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str97 = private constant [30 x i8] c"int32_t multiple variable and\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str98 = private constant [20 x i8] c"int32_t variable or\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str99 = private constant [29 x i8] c"int32_t multiple variable or\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str100 = private constant [21 x i8] c"int32_t variable xor\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str101 = private constant [30 x i8] c"int32_t multiple variable xor\00", align 1 ; <[30 x i8]*> [#uses=1]
@data32unsigned = internal global [8000 x i32] zeroinitializer, align 32 ; <[8000 x i32]*> [#uses=19]
@.str102 = private constant [22 x i8] c"uint32_t variable add\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str103 = private constant [30 x i8] c"uint32_t variable add hoisted\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str104 = private constant [32 x i8] c"uint32_t multiple variable adds\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str105 = private constant [27 x i8] c"uint32_t variable subtract\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str106 = private constant [37 x i8] c"uint32_t multiple variable subtracts\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str107 = private constant [27 x i8] c"uint32_t variable multiply\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str108 = private constant [38 x i8] c"uint32_t multiple variable multiplies\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str109 = private constant [39 x i8] c"uint32_t multiple variable multiplies2\00", align 1 ; <[39 x i8]*> [#uses=1]
@.str110 = private constant [25 x i8] c"uint32_t variable divide\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str111 = private constant [35 x i8] c"uint32_t multiple variable divides\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str112 = private constant [36 x i8] c"uint32_t multiple variable divides2\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str113 = private constant [33 x i8] c"uint32_t multiple variable mixed\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str114 = private constant [22 x i8] c"uint32_t variable and\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str115 = private constant [31 x i8] c"uint32_t multiple variable and\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str116 = private constant [21 x i8] c"uint32_t variable or\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str117 = private constant [30 x i8] c"uint32_t multiple variable or\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str118 = private constant [22 x i8] c"uint32_t variable xor\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str119 = private constant [31 x i8] c"uint32_t multiple variable xor\00", align 1 ; <[31 x i8]*> [#uses=1]
@data64 = internal global [8000 x i64] zeroinitializer, align 32 ; <[8000 x i64]*> [#uses=19]
@.str120 = private constant [21 x i8] c"int64_t variable add\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str121 = private constant [29 x i8] c"int64_t variable add hoisted\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str122 = private constant [31 x i8] c"int64_t multiple variable adds\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str123 = private constant [26 x i8] c"int64_t variable subtract\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str124 = private constant [36 x i8] c"int64_t multiple variable subtracts\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str125 = private constant [26 x i8] c"int64_t variable multiply\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str126 = private constant [37 x i8] c"int64_t multiple variable multiplies\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str127 = private constant [38 x i8] c"int64_t multiple variable multiplies2\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str128 = private constant [24 x i8] c"int64_t variable divide\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str129 = private constant [34 x i8] c"int64_t multiple variable divides\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str130 = private constant [35 x i8] c"int64_t multiple variable divides2\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str131 = private constant [32 x i8] c"int64_t multiple variable mixed\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str132 = private constant [21 x i8] c"int64_t variable and\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str133 = private constant [30 x i8] c"int64_t multiple variable and\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str134 = private constant [20 x i8] c"int64_t variable or\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str135 = private constant [29 x i8] c"int64_t multiple variable or\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str136 = private constant [21 x i8] c"int64_t variable xor\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str137 = private constant [30 x i8] c"int64_t multiple variable xor\00", align 1 ; <[30 x i8]*> [#uses=1]
@data64unsigned = internal global [8000 x i64] zeroinitializer, align 32 ; <[8000 x i64]*> [#uses=19]
@.str138 = private constant [22 x i8] c"uint64_t variable add\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str139 = private constant [30 x i8] c"uint64_t variable add hoisted\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str140 = private constant [32 x i8] c"uint64_t multiple variable adds\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str141 = private constant [27 x i8] c"uint64_t variable subtract\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str142 = private constant [37 x i8] c"uint64_t multiple variable subtracts\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str143 = private constant [27 x i8] c"uint64_t variable multiply\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str144 = private constant [38 x i8] c"uint64_t multiple variable multiplies\00", align 1 ; <[38 x i8]*> [#uses=1]
@.str145 = private constant [39 x i8] c"uint64_t multiple variable multiplies2\00", align 1 ; <[39 x i8]*> [#uses=1]
@.str146 = private constant [25 x i8] c"uint64_t variable divide\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str147 = private constant [35 x i8] c"uint64_t multiple variable divides\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str148 = private constant [36 x i8] c"uint64_t multiple variable divides2\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str149 = private constant [33 x i8] c"uint64_t multiple variable mixed\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str150 = private constant [22 x i8] c"uint64_t variable and\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str151 = private constant [31 x i8] c"uint64_t multiple variable and\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str152 = private constant [21 x i8] c"uint64_t variable or\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str153 = private constant [30 x i8] c"uint64_t multiple variable or\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str154 = private constant [22 x i8] c"uint64_t variable xor\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str155 = private constant [31 x i8] c"uint64_t multiple variable xor\00", align 1 ; <[31 x i8]*> [#uses=1]
@dataFloat = internal global [8000 x float] zeroinitializer, align 32 ; <[8000 x float]*> [#uses=13]
@.str156 = private constant [19 x i8] c"float variable add\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str157 = private constant [27 x i8] c"float variable add hoisted\00", align 1 ; <[27 x i8]*> [#uses=1]
@.str158 = private constant [29 x i8] c"float multiple variable adds\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str159 = private constant [24 x i8] c"float variable subtract\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str160 = private constant [34 x i8] c"float multiple variable subtracts\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str161 = private constant [24 x i8] c"float variable multiply\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str162 = private constant [35 x i8] c"float multiple variable multiplies\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str163 = private constant [36 x i8] c"float multiple variable multiplies2\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str164 = private constant [22 x i8] c"float variable divide\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str165 = private constant [32 x i8] c"float multiple variable divides\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str166 = private constant [33 x i8] c"float multiple variable divides2\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str167 = private constant [30 x i8] c"float multiple variable mixed\00", align 1 ; <[30 x i8]*> [#uses=1]
@dataDouble = internal global [8000 x double] zeroinitializer, align 32 ; <[8000 x double]*> [#uses=13]
@.str168 = private constant [20 x i8] c"double variable add\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str169 = private constant [28 x i8] c"double variable add hoisted\00", align 1 ; <[28 x i8]*> [#uses=1]
@.str170 = private constant [30 x i8] c"double multiple variable adds\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str171 = private constant [25 x i8] c"double variable subtract\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str172 = private constant [35 x i8] c"double multiple variable subtracts\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str173 = private constant [25 x i8] c"double variable multiply\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str174 = private constant [36 x i8] c"double multiple variable multiplies\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str175 = private constant [37 x i8] c"double multiple variable multiplies2\00", align 1 ; <[37 x i8]*> [#uses=1]
@.str176 = private constant [23 x i8] c"double variable divide\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str177 = private constant [33 x i8] c"double multiple variable divides\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str178 = private constant [34 x i8] c"double multiple variable divides2\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str179 = private constant [31 x i8] c"double multiple variable mixed\00", align 1 ; <[31 x i8]*> [#uses=1]

declare double @fabs(double)

declare float @fabsf(float)

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @clock() nounwind

declare noalias i8* @realloc(i8* nocapture, i32) nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @atoi(i8* %2) nounwind readonly ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %iterations.0 = phi i32 [ %3, %bb ], [ 1000, %entry ] ; <i32> [#uses=169]
  %4 = icmp sgt i32 %argc, 2                      ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %5 = getelementptr inbounds i8** %argv, i32 2   ; <i8**> [#uses=1]
  %6 = load i8** %5, align 4                      ; <i8*> [#uses=1]
  %7 = tail call double @atof(i8* %6) nounwind readonly ; <double> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %init_value.0 = phi double [ %7, %bb2 ], [ 1.000000e+00, %bb1 ] ; <double> [#uses=22]
  %8 = icmp sgt i32 %argc, 3                      ; <i1> [#uses=1]
  br i1 %8, label %bb4, label %bb5

bb4:                                              ; preds = %bb3
  %9 = getelementptr inbounds i8** %argv, i32 3   ; <i8**> [#uses=1]
  %10 = load i8** %9, align 4                     ; <i8*> [#uses=1]
  %11 = tail call double @atof(i8* %10) nounwind readonly ; <double> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb4, %bb3
  %temp.0 = phi double [ %11, %bb4 ], [ 1.000000e+00, %bb3 ] ; <double> [#uses=34]
  %12 = fptosi double %init_value.0 to i8         ; <i8> [#uses=19]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb5
  %indvar.i = phi i32 [ 0, %bb5 ], [ %indvar.next.i, %bb.i ] ; <i32> [#uses=2]
  %first_addr.01.i = getelementptr [8000 x i8]* @data8, i32 0, i32 %indvar.i ; <i8*> [#uses=1]
  store i8 %12, i8* %first_addr.01.i, align 1
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond44 = icmp eq i32 %indvar.next.i, ptrtoint (i8* getelementptr ([8000 x i8]* @data8, i32 1, i32 sub (i32 0, i32 ptrtoint ([8000 x i8]* @data8 to i32))) to i32) ; <i1> [#uses=1]
  br i1 %exitcond44, label %_Z4fillIPaaEvT_S1_T0_.exit, label %bb.i

_Z4fillIPaaEvT_S1_T0_.exit:                       ; preds = %bb.i
  %13 = fptosi double %temp.0 to i8               ; <i8> [#uses=30]
  %14 = shl i8 %13, 1                             ; <i8> [#uses=9]
  %15 = add i8 %13, 2                             ; <i8> [#uses=10]
  %16 = sext i8 %14 to i32                        ; <i32> [#uses=5]
  %17 = sext i8 %15 to i32                        ; <i32> [#uses=5]
  %18 = sdiv i32 %16, %17                         ; <i32> [#uses=1]
  %19 = trunc i32 %18 to i8                       ; <i8> [#uses=1]
  %20 = add i8 %19, %13                           ; <i8> [#uses=12]
  %21 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %22 = icmp sgt i32 %iterations.0, 0             ; <i1> [#uses=168]
  br i1 %22, label %bb.nph6.i, label %bb1.i.i

bb.nph6.i:                                        ; preds = %_Z4fillIPaaEvT_S1_T0_.exit
  %23 = add i8 %12, %13                           ; <i8> [#uses=1]
  %24 = shl i8 %23, 6                             ; <i8> [#uses=1]
  br label %bb2.preheader.us.i

bb2.preheader.us.i:                               ; preds = %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i, %bb.nph6.i
  %i.05.us.i = phi i32 [ 0, %bb.nph6.i ], [ %tmp.i1, %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1 = add i32 %i.05.us.i, 1                 ; <i32> [#uses=2]
  br label %bb1.us.i

_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i, %bb.i1.us.i
  %25 = icmp slt i32 %tmp.i1, %iterations.0       ; <i1> [#uses=1]
  br i1 %25, label %bb2.preheader.us.i, label %bb1.i.i

bb.i1.us.i:                                       ; preds = %bb2.bb3_crit_edge.us.i
  %26 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i

bb1.us.i:                                         ; preds = %bb1.us.i, %bb2.preheader.us.i
  %result.03.us.i = phi i8 [ 0, %bb2.preheader.us.i ], [ %29, %bb1.us.i ] ; <i8> [#uses=1]
  %n.02.us.i = phi i32 [ 0, %bb2.preheader.us.i ], [ %30, %bb1.us.i ] ; <i32> [#uses=2]
  %scevgep.i = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i ; <i8*> [#uses=1]
  %27 = load i8* %scevgep.i, align 1              ; <i8> [#uses=1]
  %28 = add i8 %result.03.us.i, %13               ; <i8> [#uses=1]
  %29 = add i8 %28, %27                           ; <i8> [#uses=2]
  %30 = add nsw i32 %n.02.us.i, 1                 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %30, 8000             ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb2.bb3_crit_edge.us.i, label %bb1.us.i

bb2.bb3_crit_edge.us.i:                           ; preds = %bb1.us.i
  %31 = sub i8 %29, %24                           ; <i8> [#uses=2]
  %32 = sext i8 %31 to i32                        ; <i32> [#uses=2]
  %neg.i.i.us.i = sub i32 0, %32                  ; <i32> [#uses=1]
  %abscond.i.i.us.i = icmp sgt i8 %31, -1         ; <i1> [#uses=1]
  %abs.i.i.us.i = select i1 %abscond.i.i.us.i, i32 %32, i32 %neg.i.i.us.i ; <i32> [#uses=1]
  %33 = icmp slt i32 %abs.i.i.us.i, 1             ; <i1> [#uses=1]
  br i1 %33, label %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i, label %bb.i1.us.i

bb1.i.i:                                          ; preds = %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i, %_Z4fillIPaaEvT_S1_T0_.exit
  %34 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %35 = tail call i8* @realloc(i8* null, i32 120) nounwind ; <i8*> [#uses=6]
  %36 = bitcast i8* %35 to %struct.one_result*    ; <%struct.one_result*> [#uses=2]
  %37 = icmp eq i8* %35, null                     ; <i1> [#uses=1]
  br i1 %37, label %bb2.i.i, label %_Z14test_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit

bb2.i.i:                                          ; preds = %bb1.i.i
  %38 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 10) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i
  %39 = sub i32 %34, %21                          ; <i32> [#uses=1]
  %40 = sitofp i32 %39 to double                  ; <double> [#uses=1]
  %41 = fdiv double %40, 1.000000e+06             ; <double> [#uses=1]
  %42 = bitcast i8* %35 to double*                ; <double*> [#uses=1]
  store double %41, double* %42, align 4
  %43 = getelementptr inbounds i8* %35, i32 8     ; <i8*> [#uses=1]
  %44 = bitcast i8* %43 to i8**                   ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str12, i32 0, i32 0), i8** %44, align 4
  %45 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i2709, label %bb5.i2724

bb.nph7.i2709:                                    ; preds = %_Z14test_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit
  %46 = shl i8 %13, 6                             ; <i8> [#uses=1]
  %47 = add i8 %12, %13                           ; <i8> [#uses=1]
  %48 = shl i8 %47, 6                             ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2712

bb2.preheader.us.i2712:                           ; preds = %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713, %bb.nph7.i2709
  %i.06.us.i2710 = phi i32 [ 0, %bb.nph7.i2709 ], [ %tmp.i2711, %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713 ] ; <i32> [#uses=1]
  %tmp.i2711 = add i32 %i.06.us.i2710, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2719

_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713: ; preds = %bb2.bb3_crit_edge.us.i2723, %bb.i2.us.i2714
  %49 = icmp slt i32 %tmp.i2711, %iterations.0    ; <i1> [#uses=1]
  br i1 %49, label %bb2.preheader.us.i2712, label %bb5.i2724

bb.i2.us.i2714:                                   ; preds = %bb2.bb3_crit_edge.us.i2723
  %50 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 1) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713

bb1.us.i2719:                                     ; preds = %bb1.us.i2719, %bb2.preheader.us.i2712
  %result.04.us.i2715 = phi i8 [ 0, %bb2.preheader.us.i2712 ], [ %52, %bb1.us.i2719 ] ; <i8> [#uses=1]
  %n.03.us.i2716 = phi i32 [ 0, %bb2.preheader.us.i2712 ], [ %53, %bb1.us.i2719 ] ; <i32> [#uses=2]
  %scevgep.i2717 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.03.us.i2716 ; <i8*> [#uses=1]
  %51 = load i8* %scevgep.i2717, align 1          ; <i8> [#uses=1]
  %52 = add i8 %51, %result.04.us.i2715           ; <i8> [#uses=2]
  %53 = add nsw i32 %n.03.us.i2716, 1             ; <i32> [#uses=2]
  %exitcond.i2718 = icmp eq i32 %53, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i2718, label %bb2.bb3_crit_edge.us.i2723, label %bb1.us.i2719

bb2.bb3_crit_edge.us.i2723:                       ; preds = %bb1.us.i2719
  %54 = add i8 %52, %46                           ; <i8> [#uses=1]
  %55 = sub i8 %54, %48                           ; <i8> [#uses=2]
  %56 = sext i8 %55 to i32                        ; <i32> [#uses=2]
  %neg.i.i.us.i2720 = sub i32 0, %56              ; <i32> [#uses=1]
  %abscond.i.i.us.i2721 = icmp sgt i8 %55, -1     ; <i1> [#uses=1]
  %abs.i.i.us.i2722 = select i1 %abscond.i.i.us.i2721, i32 %56, i32 %neg.i.i.us.i2720 ; <i32> [#uses=1]
  %57 = icmp slt i32 %abs.i.i.us.i2722, 1         ; <i1> [#uses=1]
  br i1 %57, label %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713, label %bb.i2.us.i2714

bb5.i2724:                                        ; preds = %_Z26check_shifted_variable_sumIa19custom_add_variableIaEEvT_S2_.exit.us.i2713, %_Z14test_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit
  %58 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %59 = sub i32 %58, %45                          ; <i32> [#uses=1]
  %60 = sitofp i32 %59 to double                  ; <double> [#uses=1]
  %61 = fdiv double %60, 1.000000e+06             ; <double> [#uses=1]
  %62 = icmp eq i8* %35, null                     ; <i1> [#uses=1]
  br i1 %62, label %bb1.i.i2726, label %_Z22test_hoisted_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit

bb1.i.i2726:                                      ; preds = %bb5.i2724
  %63 = tail call i8* @realloc(i8* %35, i32 240) nounwind ; <i8*> [#uses=2]
  %64 = bitcast i8* %63 to %struct.one_result*    ; <%struct.one_result*> [#uses=2]
  %65 = icmp eq i8* %63, null                     ; <i1> [#uses=1]
  br i1 %65, label %bb2.i.i2727, label %_Z22test_hoisted_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit

bb2.i.i2727:                                      ; preds = %bb1.i.i2726
  %66 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 20) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2726, %bb5.i2724
  %results.0 = phi %struct.one_result* [ %64, %bb1.i.i2726 ], [ %36, %bb5.i2724 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.0 = phi i32 [ 20, %bb1.i.i2726 ], [ 10, %bb5.i2724 ] ; <i32> [#uses=3]
  %67 = phi %struct.one_result* [ %64, %bb1.i.i2726 ], [ %36, %bb5.i2724 ] ; <%struct.one_result*> [#uses=2]
  %68 = getelementptr inbounds %struct.one_result* %67, i32 1, i32 0 ; <double*> [#uses=1]
  store double %61, double* %68, align 4
  %69 = getelementptr inbounds %struct.one_result* %67, i32 1, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i8** %69, align 4
  %70 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2691, label %bb5.i2705

bb.nph6.i2691:                                    ; preds = %_Z22test_hoisted_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit
  %71 = add i8 %14, %13                           ; <i8> [#uses=1]
  %72 = add i8 %71, %15                           ; <i8> [#uses=1]
  %73 = add i8 %72, %20                           ; <i8> [#uses=2]
  %74 = add i8 %73, %12                           ; <i8> [#uses=1]
  %75 = shl i8 %74, 6                             ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2694

bb2.preheader.us.i2694:                           ; preds = %_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2691
  %i.05.us.i2692 = phi i32 [ 0, %bb.nph6.i2691 ], [ %tmp.i2693, %_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2693 = add i32 %i.05.us.i2692, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2700

_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2704, %bb.i1.us.i2695
  %76 = icmp slt i32 %tmp.i2693, %iterations.0    ; <i1> [#uses=1]
  br i1 %76, label %bb2.preheader.us.i2694, label %bb5.i2705

bb.i1.us.i2695:                                   ; preds = %bb2.bb3_crit_edge.us.i2704
  %77 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 2) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2700:                                     ; preds = %bb1.us.i2700, %bb2.preheader.us.i2694
  %result.03.us.i2696 = phi i8 [ 0, %bb2.preheader.us.i2694 ], [ %80, %bb1.us.i2700 ] ; <i8> [#uses=1]
  %n.02.us.i2697 = phi i32 [ 0, %bb2.preheader.us.i2694 ], [ %81, %bb1.us.i2700 ] ; <i32> [#uses=2]
  %scevgep.i2698 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2697 ; <i8*> [#uses=1]
  %78 = load i8* %scevgep.i2698, align 1          ; <i8> [#uses=1]
  %79 = add i8 %73, %result.03.us.i2696           ; <i8> [#uses=1]
  %80 = add i8 %79, %78                           ; <i8> [#uses=2]
  %81 = add nsw i32 %n.02.us.i2697, 1             ; <i32> [#uses=2]
  %exitcond.i2699 = icmp eq i32 %81, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i2699, label %bb2.bb3_crit_edge.us.i2704, label %bb1.us.i2700

bb2.bb3_crit_edge.us.i2704:                       ; preds = %bb1.us.i2700
  %82 = sub i8 %80, %75                           ; <i8> [#uses=2]
  %83 = sext i8 %82 to i32                        ; <i32> [#uses=2]
  %neg.i.i.us.i2701 = sub i32 0, %83              ; <i32> [#uses=1]
  %abscond.i.i.us.i2702 = icmp sgt i8 %82, -1     ; <i1> [#uses=1]
  %abs.i.i.us.i2703 = select i1 %abscond.i.i.us.i2702, i32 %83, i32 %neg.i.i.us.i2701 ; <i32> [#uses=1]
  %84 = icmp slt i32 %abs.i.i.us.i2703, 1         ; <i1> [#uses=1]
  br i1 %84, label %_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2695

bb5.i2705:                                        ; preds = %_Z26check_shifted_variable_sumIa28custom_add_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Ia19custom_add_variableIaEEvPT_iS2_PKc.exit
  %85 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %86 = sub i32 %85, %70                          ; <i32> [#uses=1]
  %87 = sitofp i32 %86 to double                  ; <double> [#uses=1]
  %88 = fdiv double %87, 1.000000e+06             ; <double> [#uses=1]
  %.not2728 = icmp ne %struct.one_result* %results.0, null ; <i1> [#uses=1]
  %89 = icmp ugt i32 %allocated_results.0, 2      ; <i1> [#uses=1]
  %or.cond2729 = and i1 %89, %.not2728            ; <i1> [#uses=1]
  br i1 %or.cond2729, label %_Z14test_variable4Ia28custom_add_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2707

bb1.i.i2707:                                      ; preds = %bb5.i2705
  %90 = add nsw i32 %allocated_results.0, 10      ; <i32> [#uses=3]
  %91 = mul i32 %90, 12                           ; <i32> [#uses=1]
  %92 = bitcast %struct.one_result* %results.0 to i8* ; <i8*> [#uses=1]
  %93 = tail call i8* @realloc(i8* %92, i32 %91) nounwind ; <i8*> [#uses=2]
  %94 = bitcast i8* %93 to %struct.one_result*    ; <%struct.one_result*> [#uses=2]
  %95 = icmp eq i8* %93, null                     ; <i1> [#uses=1]
  br i1 %95, label %bb2.i.i2708, label %_Z14test_variable4Ia28custom_add_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2708:                                      ; preds = %bb1.i.i2707
  %96 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %90) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia28custom_add_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2707, %bb5.i2705
  %results.1 = phi %struct.one_result* [ %94, %bb1.i.i2707 ], [ %results.0, %bb5.i2705 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.1 = phi i32 [ %90, %bb1.i.i2707 ], [ %allocated_results.0, %bb5.i2705 ] ; <i32> [#uses=3]
  %97 = phi %struct.one_result* [ %94, %bb1.i.i2707 ], [ %results.0, %bb5.i2705 ] ; <%struct.one_result*> [#uses=2]
  %98 = getelementptr inbounds %struct.one_result* %97, i32 2, i32 0 ; <double*> [#uses=1]
  store double %88, double* %98, align 4
  %99 = getelementptr inbounds %struct.one_result* %97, i32 2, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str14, i32 0, i32 0), i8** %99, align 4
  %100 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2673, label %bb5.i2687

bb.nph6.i2673:                                    ; preds = %_Z14test_variable4Ia28custom_add_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %101 = sub i8 %12, %13                          ; <i8> [#uses=1]
  %102 = shl i8 %101, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2676

bb2.preheader.us.i2676:                           ; preds = %_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i, %bb.nph6.i2673
  %i.05.us.i2674 = phi i32 [ 0, %bb.nph6.i2673 ], [ %tmp.i2675, %_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2675 = add i32 %i.05.us.i2674, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2682

_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2686, %bb.i1.us.i2677
  %103 = icmp slt i32 %tmp.i2675, %iterations.0   ; <i1> [#uses=1]
  br i1 %103, label %bb2.preheader.us.i2676, label %bb5.i2687

bb.i1.us.i2677:                                   ; preds = %bb2.bb3_crit_edge.us.i2686
  %104 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 3) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i

bb1.us.i2682:                                     ; preds = %bb1.us.i2682, %bb2.preheader.us.i2676
  %result.03.us.i2678 = phi i8 [ 0, %bb2.preheader.us.i2676 ], [ %107, %bb1.us.i2682 ] ; <i8> [#uses=1]
  %n.02.us.i2679 = phi i32 [ 0, %bb2.preheader.us.i2676 ], [ %108, %bb1.us.i2682 ] ; <i32> [#uses=2]
  %scevgep.i2680 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2679 ; <i8*> [#uses=1]
  %105 = load i8* %scevgep.i2680, align 1         ; <i8> [#uses=1]
  %106 = sub i8 %result.03.us.i2678, %13          ; <i8> [#uses=1]
  %107 = add i8 %106, %105                        ; <i8> [#uses=2]
  %108 = add nsw i32 %n.02.us.i2679, 1            ; <i32> [#uses=2]
  %exitcond.i2681 = icmp eq i32 %108, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2681, label %bb2.bb3_crit_edge.us.i2686, label %bb1.us.i2682

bb2.bb3_crit_edge.us.i2686:                       ; preds = %bb1.us.i2682
  %109 = sub i8 %107, %102                        ; <i8> [#uses=2]
  %110 = sext i8 %109 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2683 = sub i32 0, %110             ; <i32> [#uses=1]
  %abscond.i.i.us.i2684 = icmp sgt i8 %109, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2685 = select i1 %abscond.i.i.us.i2684, i32 %110, i32 %neg.i.i.us.i2683 ; <i32> [#uses=1]
  %111 = icmp slt i32 %abs.i.i.us.i2685, 1        ; <i1> [#uses=1]
  br i1 %111, label %_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2677

bb5.i2687:                                        ; preds = %_Z26check_shifted_variable_sumIa19custom_sub_variableIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia28custom_add_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %112 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %113 = sub i32 %112, %100                       ; <i32> [#uses=1]
  %114 = sitofp i32 %113 to double                ; <double> [#uses=1]
  %115 = fdiv double %114, 1.000000e+06           ; <double> [#uses=1]
  %.not2730 = icmp ne %struct.one_result* %results.1, null ; <i1> [#uses=1]
  %116 = icmp sgt i32 %allocated_results.1, 3     ; <i1> [#uses=1]
  %or.cond2731 = and i1 %116, %.not2730           ; <i1> [#uses=1]
  br i1 %or.cond2731, label %_Z14test_variable1Ia19custom_sub_variableIaEEvPT_iS2_PKc.exit, label %bb1.i.i2689

bb1.i.i2689:                                      ; preds = %bb5.i2687
  %117 = add nsw i32 %allocated_results.1, 10     ; <i32> [#uses=3]
  %118 = mul i32 %117, 12                         ; <i32> [#uses=1]
  %119 = bitcast %struct.one_result* %results.1 to i8* ; <i8*> [#uses=1]
  %120 = tail call i8* @realloc(i8* %119, i32 %118) nounwind ; <i8*> [#uses=2]
  %121 = bitcast i8* %120 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %122 = icmp eq i8* %120, null                   ; <i1> [#uses=1]
  br i1 %122, label %bb2.i.i2690, label %_Z14test_variable1Ia19custom_sub_variableIaEEvPT_iS2_PKc.exit

bb2.i.i2690:                                      ; preds = %bb1.i.i2689
  %123 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %117) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia19custom_sub_variableIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2689, %bb5.i2687
  %results.2 = phi %struct.one_result* [ %121, %bb1.i.i2689 ], [ %results.1, %bb5.i2687 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.2 = phi i32 [ %117, %bb1.i.i2689 ], [ %allocated_results.1, %bb5.i2687 ] ; <i32> [#uses=3]
  %124 = phi %struct.one_result* [ %121, %bb1.i.i2689 ], [ %results.1, %bb5.i2687 ] ; <%struct.one_result*> [#uses=2]
  %125 = getelementptr inbounds %struct.one_result* %124, i32 3, i32 0 ; <double*> [#uses=1]
  store double %115, double* %125, align 4
  %126 = getelementptr inbounds %struct.one_result* %124, i32 3, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i8** %126, align 4
  %127 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i2655, label %bb5.i2669

bb.nph8.i2655:                                    ; preds = %_Z14test_variable1Ia19custom_sub_variableIaEEvPT_iS2_PKc.exit
  %sum9.i2653 = add i8 %14, %13                   ; <i8> [#uses=2]
  %128 = sub i8 0, %sum9.i2653                    ; <i8> [#uses=1]
  %129 = sub i8 %128, %15                         ; <i8> [#uses=1]
  %130 = sub i8 %129, %20                         ; <i8> [#uses=1]
  %sum.i2654 = add i8 %sum9.i2653, %15            ; <i8> [#uses=1]
  %131 = sub i8 0, %sum.i2654                     ; <i8> [#uses=1]
  %132 = sub i8 %131, %20                         ; <i8> [#uses=1]
  %133 = add i8 %132, %12                         ; <i8> [#uses=1]
  %134 = shl i8 %133, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2658

bb2.preheader.us.i2658:                           ; preds = %_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i2655
  %i.07.us.i2656 = phi i32 [ 0, %bb.nph8.i2655 ], [ %tmp.i2657, %_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2657 = add i32 %i.07.us.i2656, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2664

_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2668, %bb.i1.us.i2659
  %135 = icmp slt i32 %tmp.i2657, %iterations.0   ; <i1> [#uses=1]
  br i1 %135, label %bb2.preheader.us.i2658, label %bb5.i2669

bb.i1.us.i2659:                                   ; preds = %bb2.bb3_crit_edge.us.i2668
  %136 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 4) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2664:                                     ; preds = %bb1.us.i2664, %bb2.preheader.us.i2658
  %result.05.us.i2660 = phi i8 [ 0, %bb2.preheader.us.i2658 ], [ %139, %bb1.us.i2664 ] ; <i8> [#uses=1]
  %n.04.us.i2661 = phi i32 [ 0, %bb2.preheader.us.i2658 ], [ %140, %bb1.us.i2664 ] ; <i32> [#uses=2]
  %scevgep.i2662 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.04.us.i2661 ; <i8*> [#uses=1]
  %137 = load i8* %scevgep.i2662, align 1         ; <i8> [#uses=1]
  %138 = add i8 %130, %result.05.us.i2660         ; <i8> [#uses=1]
  %139 = add i8 %138, %137                        ; <i8> [#uses=2]
  %140 = add nsw i32 %n.04.us.i2661, 1            ; <i32> [#uses=2]
  %exitcond.i2663 = icmp eq i32 %140, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2663, label %bb2.bb3_crit_edge.us.i2668, label %bb1.us.i2664

bb2.bb3_crit_edge.us.i2668:                       ; preds = %bb1.us.i2664
  %141 = sub i8 %139, %134                        ; <i8> [#uses=2]
  %142 = sext i8 %141 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2665 = sub i32 0, %142             ; <i32> [#uses=1]
  %abscond.i.i.us.i2666 = icmp sgt i8 %141, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2667 = select i1 %abscond.i.i.us.i2666, i32 %142, i32 %neg.i.i.us.i2665 ; <i32> [#uses=1]
  %143 = icmp slt i32 %abs.i.i.us.i2667, 1        ; <i1> [#uses=1]
  br i1 %143, label %_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2659

bb5.i2669:                                        ; preds = %_Z26check_shifted_variable_sumIa28custom_sub_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia19custom_sub_variableIaEEvPT_iS2_PKc.exit
  %144 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %145 = sub i32 %144, %127                       ; <i32> [#uses=1]
  %146 = sitofp i32 %145 to double                ; <double> [#uses=1]
  %147 = fdiv double %146, 1.000000e+06           ; <double> [#uses=1]
  %.not2732 = icmp ne %struct.one_result* %results.2, null ; <i1> [#uses=1]
  %148 = icmp sgt i32 %allocated_results.2, 4     ; <i1> [#uses=1]
  %or.cond2733 = and i1 %148, %.not2732           ; <i1> [#uses=1]
  br i1 %or.cond2733, label %_Z14test_variable4Ia28custom_sub_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2671

bb1.i.i2671:                                      ; preds = %bb5.i2669
  %149 = add nsw i32 %allocated_results.2, 10     ; <i32> [#uses=3]
  %150 = mul i32 %149, 12                         ; <i32> [#uses=1]
  %151 = bitcast %struct.one_result* %results.2 to i8* ; <i8*> [#uses=1]
  %152 = tail call i8* @realloc(i8* %151, i32 %150) nounwind ; <i8*> [#uses=2]
  %153 = bitcast i8* %152 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %154 = icmp eq i8* %152, null                   ; <i1> [#uses=1]
  br i1 %154, label %bb2.i.i2672, label %_Z14test_variable4Ia28custom_sub_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2672:                                      ; preds = %bb1.i.i2671
  %155 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %149) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia28custom_sub_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2671, %bb5.i2669
  %results.3 = phi %struct.one_result* [ %153, %bb1.i.i2671 ], [ %results.2, %bb5.i2669 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.3 = phi i32 [ %149, %bb1.i.i2671 ], [ %allocated_results.2, %bb5.i2669 ] ; <i32> [#uses=3]
  %156 = phi %struct.one_result* [ %153, %bb1.i.i2671 ], [ %results.2, %bb5.i2669 ] ; <%struct.one_result*> [#uses=2]
  %157 = getelementptr inbounds %struct.one_result* %156, i32 4, i32 0 ; <double*> [#uses=1]
  store double %147, double* %157, align 4
  %158 = getelementptr inbounds %struct.one_result* %156, i32 4, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str16, i32 0, i32 0), i8** %158, align 4
  %159 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2635, label %bb5.i2649

bb.nph6.i2635:                                    ; preds = %_Z14test_variable4Ia28custom_sub_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %160 = shl i8 %13, 6                            ; <i8> [#uses=1]
  %161 = mul i8 %160, %12                         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2638

bb2.preheader.us.i2638:                           ; preds = %_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i, %bb.nph6.i2635
  %i.05.us.i2636 = phi i32 [ 0, %bb.nph6.i2635 ], [ %tmp.i2637, %_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2637 = add i32 %i.05.us.i2636, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2644

_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2648, %bb.i1.us.i2639
  %162 = icmp slt i32 %tmp.i2637, %iterations.0   ; <i1> [#uses=1]
  br i1 %162, label %bb2.preheader.us.i2638, label %bb5.i2649

bb.i1.us.i2639:                                   ; preds = %bb2.bb3_crit_edge.us.i2648
  %163 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 5) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i

bb1.us.i2644:                                     ; preds = %bb1.us.i2644, %bb2.preheader.us.i2638
  %result.03.us.i2640 = phi i8 [ 0, %bb2.preheader.us.i2638 ], [ %166, %bb1.us.i2644 ] ; <i8> [#uses=1]
  %n.02.us.i2641 = phi i32 [ 0, %bb2.preheader.us.i2638 ], [ %167, %bb1.us.i2644 ] ; <i32> [#uses=2]
  %scevgep.i2642 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2641 ; <i8*> [#uses=1]
  %164 = load i8* %scevgep.i2642, align 1         ; <i8> [#uses=1]
  %165 = mul i8 %164, %13                         ; <i8> [#uses=1]
  %166 = add i8 %165, %result.03.us.i2640         ; <i8> [#uses=2]
  %167 = add nsw i32 %n.02.us.i2641, 1            ; <i32> [#uses=2]
  %exitcond.i2643 = icmp eq i32 %167, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2643, label %bb2.bb3_crit_edge.us.i2648, label %bb1.us.i2644

bb2.bb3_crit_edge.us.i2648:                       ; preds = %bb1.us.i2644
  %168 = sub i8 %166, %161                        ; <i8> [#uses=2]
  %169 = sext i8 %168 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2645 = sub i32 0, %169             ; <i32> [#uses=1]
  %abscond.i.i.us.i2646 = icmp sgt i8 %168, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2647 = select i1 %abscond.i.i.us.i2646, i32 %169, i32 %neg.i.i.us.i2645 ; <i32> [#uses=1]
  %170 = icmp slt i32 %abs.i.i.us.i2647, 1        ; <i1> [#uses=1]
  br i1 %170, label %_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2639

bb5.i2649:                                        ; preds = %_Z26check_shifted_variable_sumIa24custom_multiply_variableIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia28custom_sub_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %171 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %172 = sub i32 %171, %159                       ; <i32> [#uses=1]
  %173 = sitofp i32 %172 to double                ; <double> [#uses=1]
  %174 = fdiv double %173, 1.000000e+06           ; <double> [#uses=1]
  %.not2734 = icmp ne %struct.one_result* %results.3, null ; <i1> [#uses=1]
  %175 = icmp sgt i32 %allocated_results.3, 5     ; <i1> [#uses=1]
  %or.cond2735 = and i1 %175, %.not2734           ; <i1> [#uses=1]
  br i1 %or.cond2735, label %_Z14test_variable1Ia24custom_multiply_variableIaEEvPT_iS2_PKc.exit, label %bb1.i.i2651

bb1.i.i2651:                                      ; preds = %bb5.i2649
  %176 = add nsw i32 %allocated_results.3, 10     ; <i32> [#uses=3]
  %177 = mul i32 %176, 12                         ; <i32> [#uses=1]
  %178 = bitcast %struct.one_result* %results.3 to i8* ; <i8*> [#uses=1]
  %179 = tail call i8* @realloc(i8* %178, i32 %177) nounwind ; <i8*> [#uses=2]
  %180 = bitcast i8* %179 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %181 = icmp eq i8* %179, null                   ; <i1> [#uses=1]
  br i1 %181, label %bb2.i.i2652, label %_Z14test_variable1Ia24custom_multiply_variableIaEEvPT_iS2_PKc.exit

bb2.i.i2652:                                      ; preds = %bb1.i.i2651
  %182 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %176) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia24custom_multiply_variableIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2651, %bb5.i2649
  %results.4 = phi %struct.one_result* [ %180, %bb1.i.i2651 ], [ %results.3, %bb5.i2649 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.4 = phi i32 [ %176, %bb1.i.i2651 ], [ %allocated_results.3, %bb5.i2649 ] ; <i32> [#uses=3]
  %183 = phi %struct.one_result* [ %180, %bb1.i.i2651 ], [ %results.3, %bb5.i2649 ] ; <%struct.one_result*> [#uses=2]
  %184 = getelementptr inbounds %struct.one_result* %183, i32 5, i32 0 ; <double*> [#uses=1]
  store double %174, double* %184, align 4
  %185 = getelementptr inbounds %struct.one_result* %183, i32 5, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i8** %185, align 4
  %186 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2617, label %bb5.i2631

bb.nph6.i2617:                                    ; preds = %_Z14test_variable1Ia24custom_multiply_variableIaEEvPT_iS2_PKc.exit
  %187 = mul i8 %14, %13                          ; <i8> [#uses=1]
  %188 = mul i8 %187, %15                         ; <i8> [#uses=1]
  %189 = mul i8 %188, %20                         ; <i8> [#uses=1]
  %190 = shl i8 %13, 6                            ; <i8> [#uses=1]
  %191 = mul i8 %190, %14                         ; <i8> [#uses=1]
  %192 = mul i8 %191, %15                         ; <i8> [#uses=1]
  %193 = mul i8 %192, %20                         ; <i8> [#uses=1]
  %194 = mul i8 %193, %12                         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2620

bb2.preheader.us.i2620:                           ; preds = %_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2617
  %i.05.us.i2618 = phi i32 [ 0, %bb.nph6.i2617 ], [ %tmp.i2619, %_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2619 = add i32 %i.05.us.i2618, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2626

_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2630, %bb.i1.us.i2621
  %195 = icmp slt i32 %tmp.i2619, %iterations.0   ; <i1> [#uses=1]
  br i1 %195, label %bb2.preheader.us.i2620, label %bb5.i2631

bb.i1.us.i2621:                                   ; preds = %bb2.bb3_crit_edge.us.i2630
  %196 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 6) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2626:                                     ; preds = %bb1.us.i2626, %bb2.preheader.us.i2620
  %result.03.us.i2622 = phi i8 [ 0, %bb2.preheader.us.i2620 ], [ %199, %bb1.us.i2626 ] ; <i8> [#uses=1]
  %n.02.us.i2623 = phi i32 [ 0, %bb2.preheader.us.i2620 ], [ %200, %bb1.us.i2626 ] ; <i32> [#uses=2]
  %scevgep.i2624 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2623 ; <i8*> [#uses=1]
  %197 = load i8* %scevgep.i2624, align 1         ; <i8> [#uses=1]
  %198 = mul i8 %189, %197                        ; <i8> [#uses=1]
  %199 = add i8 %198, %result.03.us.i2622         ; <i8> [#uses=2]
  %200 = add nsw i32 %n.02.us.i2623, 1            ; <i32> [#uses=2]
  %exitcond.i2625 = icmp eq i32 %200, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2625, label %bb2.bb3_crit_edge.us.i2630, label %bb1.us.i2626

bb2.bb3_crit_edge.us.i2630:                       ; preds = %bb1.us.i2626
  %201 = sub i8 %199, %194                        ; <i8> [#uses=2]
  %202 = sext i8 %201 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2627 = sub i32 0, %202             ; <i32> [#uses=1]
  %abscond.i.i.us.i2628 = icmp sgt i8 %201, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2629 = select i1 %abscond.i.i.us.i2628, i32 %202, i32 %neg.i.i.us.i2627 ; <i32> [#uses=1]
  %203 = icmp slt i32 %abs.i.i.us.i2629, 1        ; <i1> [#uses=1]
  br i1 %203, label %_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2621

bb5.i2631:                                        ; preds = %_Z26check_shifted_variable_sumIa33custom_multiply_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia24custom_multiply_variableIaEEvPT_iS2_PKc.exit
  %204 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %205 = sub i32 %204, %186                       ; <i32> [#uses=1]
  %206 = sitofp i32 %205 to double                ; <double> [#uses=1]
  %207 = fdiv double %206, 1.000000e+06           ; <double> [#uses=1]
  %.not2736 = icmp ne %struct.one_result* %results.4, null ; <i1> [#uses=1]
  %208 = icmp sgt i32 %allocated_results.4, 6     ; <i1> [#uses=1]
  %or.cond2737 = and i1 %208, %.not2736           ; <i1> [#uses=1]
  br i1 %or.cond2737, label %_Z14test_variable4Ia33custom_multiply_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2633

bb1.i.i2633:                                      ; preds = %bb5.i2631
  %209 = add nsw i32 %allocated_results.4, 10     ; <i32> [#uses=3]
  %210 = mul i32 %209, 12                         ; <i32> [#uses=1]
  %211 = bitcast %struct.one_result* %results.4 to i8* ; <i8*> [#uses=1]
  %212 = tail call i8* @realloc(i8* %211, i32 %210) nounwind ; <i8*> [#uses=2]
  %213 = bitcast i8* %212 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %214 = icmp eq i8* %212, null                   ; <i1> [#uses=1]
  br i1 %214, label %bb2.i.i2634, label %_Z14test_variable4Ia33custom_multiply_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2634:                                      ; preds = %bb1.i.i2633
  %215 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %209) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia33custom_multiply_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2633, %bb5.i2631
  %results.5 = phi %struct.one_result* [ %213, %bb1.i.i2633 ], [ %results.4, %bb5.i2631 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.5 = phi i32 [ %209, %bb1.i.i2633 ], [ %allocated_results.4, %bb5.i2631 ] ; <i32> [#uses=3]
  %216 = phi %struct.one_result* [ %213, %bb1.i.i2633 ], [ %results.4, %bb5.i2631 ] ; <%struct.one_result*> [#uses=2]
  %217 = getelementptr inbounds %struct.one_result* %216, i32 6, i32 0 ; <double*> [#uses=1]
  store double %207, double* %217, align 4
  %218 = getelementptr inbounds %struct.one_result* %216, i32 6, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str18, i32 0, i32 0), i8** %218, align 4
  %219 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2599, label %bb5.i2613

bb.nph6.i2599:                                    ; preds = %_Z14test_variable4Ia33custom_multiply_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %220 = mul i8 %14, %13                          ; <i8> [#uses=1]
  %221 = mul i8 %220, %15                         ; <i8> [#uses=1]
  %222 = mul i8 %221, %20                         ; <i8> [#uses=2]
  %223 = add i8 %12, %222                         ; <i8> [#uses=1]
  %224 = shl i8 %223, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2602

bb2.preheader.us.i2602:                           ; preds = %_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2599
  %i.05.us.i2600 = phi i32 [ 0, %bb.nph6.i2599 ], [ %tmp.i2601, %_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2601 = add i32 %i.05.us.i2600, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2608

_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2612, %bb.i1.us.i2603
  %225 = icmp slt i32 %tmp.i2601, %iterations.0   ; <i1> [#uses=1]
  br i1 %225, label %bb2.preheader.us.i2602, label %bb5.i2613

bb.i1.us.i2603:                                   ; preds = %bb2.bb3_crit_edge.us.i2612
  %226 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 7) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2608:                                     ; preds = %bb1.us.i2608, %bb2.preheader.us.i2602
  %result.03.us.i2604 = phi i8 [ 0, %bb2.preheader.us.i2602 ], [ %229, %bb1.us.i2608 ] ; <i8> [#uses=1]
  %n.02.us.i2605 = phi i32 [ 0, %bb2.preheader.us.i2602 ], [ %230, %bb1.us.i2608 ] ; <i32> [#uses=2]
  %scevgep.i2606 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2605 ; <i8*> [#uses=1]
  %227 = load i8* %scevgep.i2606, align 1         ; <i8> [#uses=1]
  %228 = add i8 %result.03.us.i2604, %222         ; <i8> [#uses=1]
  %229 = add i8 %228, %227                        ; <i8> [#uses=2]
  %230 = add nsw i32 %n.02.us.i2605, 1            ; <i32> [#uses=2]
  %exitcond.i2607 = icmp eq i32 %230, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2607, label %bb2.bb3_crit_edge.us.i2612, label %bb1.us.i2608

bb2.bb3_crit_edge.us.i2612:                       ; preds = %bb1.us.i2608
  %231 = sub i8 %229, %224                        ; <i8> [#uses=2]
  %232 = sext i8 %231 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2609 = sub i32 0, %232             ; <i32> [#uses=1]
  %abscond.i.i.us.i2610 = icmp sgt i8 %231, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2611 = select i1 %abscond.i.i.us.i2610, i32 %232, i32 %neg.i.i.us.i2609 ; <i32> [#uses=1]
  %233 = icmp slt i32 %abs.i.i.us.i2611, 1        ; <i1> [#uses=1]
  br i1 %233, label %_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2603

bb5.i2613:                                        ; preds = %_Z26check_shifted_variable_sumIa34custom_multiply_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ia33custom_multiply_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %234 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %235 = sub i32 %234, %219                       ; <i32> [#uses=1]
  %236 = sitofp i32 %235 to double                ; <double> [#uses=1]
  %237 = fdiv double %236, 1.000000e+06           ; <double> [#uses=1]
  %.not2738 = icmp ne %struct.one_result* %results.5, null ; <i1> [#uses=1]
  %238 = icmp sgt i32 %allocated_results.5, 7     ; <i1> [#uses=1]
  %or.cond2739 = and i1 %238, %.not2738           ; <i1> [#uses=1]
  br i1 %or.cond2739, label %_Z14test_variable4Ia34custom_multiply_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2615

bb1.i.i2615:                                      ; preds = %bb5.i2613
  %239 = add nsw i32 %allocated_results.5, 10     ; <i32> [#uses=3]
  %240 = mul i32 %239, 12                         ; <i32> [#uses=1]
  %241 = bitcast %struct.one_result* %results.5 to i8* ; <i8*> [#uses=1]
  %242 = tail call i8* @realloc(i8* %241, i32 %240) nounwind ; <i8*> [#uses=2]
  %243 = bitcast i8* %242 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %244 = icmp eq i8* %242, null                   ; <i1> [#uses=1]
  br i1 %244, label %bb2.i.i2616, label %_Z14test_variable4Ia34custom_multiply_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2616:                                      ; preds = %bb1.i.i2615
  %245 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %239) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia34custom_multiply_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2615, %bb5.i2613
  %results.6 = phi %struct.one_result* [ %243, %bb1.i.i2615 ], [ %results.5, %bb5.i2613 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.6 = phi i32 [ %239, %bb1.i.i2615 ], [ %allocated_results.5, %bb5.i2613 ] ; <i32> [#uses=3]
  %246 = phi %struct.one_result* [ %243, %bb1.i.i2615 ], [ %results.5, %bb5.i2613 ] ; <%struct.one_result*> [#uses=2]
  %247 = getelementptr inbounds %struct.one_result* %246, i32 7, i32 0 ; <double*> [#uses=1]
  store double %237, double* %247, align 4
  %248 = getelementptr inbounds %struct.one_result* %246, i32 7, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str19, i32 0, i32 0), i8** %248, align 4
  %249 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2579, label %bb5.i2595

bb.nph6.i2579:                                    ; preds = %_Z14test_variable4Ia34custom_multiply_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit
  %250 = sext i8 %13 to i32                       ; <i32> [#uses=2]
  %251 = sext i8 %12 to i32                       ; <i32> [#uses=1]
  %252 = sdiv i32 %251, %250                      ; <i32> [#uses=1]
  %retval12.i.i.us.i2590 = trunc i32 %252 to i8   ; <i8> [#uses=1]
  %253 = shl i8 %retval12.i.i.us.i2590, 6         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2582

bb2.preheader.us.i2582:                           ; preds = %_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i, %bb.nph6.i2579
  %i.05.us.i2580 = phi i32 [ 0, %bb.nph6.i2579 ], [ %tmp.i2581, %_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2581 = add i32 %i.05.us.i2580, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2589

_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2594, %bb.i1.us.i2583
  %254 = icmp slt i32 %tmp.i2581, %iterations.0   ; <i1> [#uses=1]
  br i1 %254, label %bb2.preheader.us.i2582, label %bb5.i2595

bb.i1.us.i2583:                                   ; preds = %bb2.bb3_crit_edge.us.i2594
  %255 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 8) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i

bb1.us.i2589:                                     ; preds = %bb1.us.i2589, %bb2.preheader.us.i2582
  %result.03.us.i2584 = phi i8 [ 0, %bb2.preheader.us.i2582 ], [ %259, %bb1.us.i2589 ] ; <i8> [#uses=1]
  %n.02.us.i2585 = phi i32 [ 0, %bb2.preheader.us.i2582 ], [ %260, %bb1.us.i2589 ] ; <i32> [#uses=2]
  %scevgep.i2586 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2585 ; <i8*> [#uses=1]
  %256 = load i8* %scevgep.i2586, align 1         ; <i8> [#uses=1]
  %257 = sext i8 %256 to i32                      ; <i32> [#uses=1]
  %258 = sdiv i32 %257, %250                      ; <i32> [#uses=1]
  %retval12.i.us.i2587 = trunc i32 %258 to i8     ; <i8> [#uses=1]
  %259 = add i8 %retval12.i.us.i2587, %result.03.us.i2584 ; <i8> [#uses=2]
  %260 = add nsw i32 %n.02.us.i2585, 1            ; <i32> [#uses=2]
  %exitcond.i2588 = icmp eq i32 %260, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2588, label %bb2.bb3_crit_edge.us.i2594, label %bb1.us.i2589

bb2.bb3_crit_edge.us.i2594:                       ; preds = %bb1.us.i2589
  %261 = sub i8 %259, %253                        ; <i8> [#uses=2]
  %262 = sext i8 %261 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2591 = sub i32 0, %262             ; <i32> [#uses=1]
  %abscond.i.i.us.i2592 = icmp sgt i8 %261, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2593 = select i1 %abscond.i.i.us.i2592, i32 %262, i32 %neg.i.i.us.i2591 ; <i32> [#uses=1]
  %263 = icmp slt i32 %abs.i.i.us.i2593, 1        ; <i1> [#uses=1]
  br i1 %263, label %_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2583

bb5.i2595:                                        ; preds = %_Z26check_shifted_variable_sumIa22custom_divide_variableIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia34custom_multiply_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit
  %264 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %265 = sub i32 %264, %249                       ; <i32> [#uses=1]
  %266 = sitofp i32 %265 to double                ; <double> [#uses=1]
  %267 = fdiv double %266, 1.000000e+06           ; <double> [#uses=1]
  %.not2740 = icmp ne %struct.one_result* %results.6, null ; <i1> [#uses=1]
  %268 = icmp sgt i32 %allocated_results.6, 8     ; <i1> [#uses=1]
  %or.cond2741 = and i1 %268, %.not2740           ; <i1> [#uses=1]
  br i1 %or.cond2741, label %_Z14test_variable1Ia22custom_divide_variableIaEEvPT_iS2_PKc.exit, label %bb1.i.i2597

bb1.i.i2597:                                      ; preds = %bb5.i2595
  %269 = add nsw i32 %allocated_results.6, 10     ; <i32> [#uses=3]
  %270 = mul i32 %269, 12                         ; <i32> [#uses=1]
  %271 = bitcast %struct.one_result* %results.6 to i8* ; <i8*> [#uses=1]
  %272 = tail call i8* @realloc(i8* %271, i32 %270) nounwind ; <i8*> [#uses=2]
  %273 = bitcast i8* %272 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %274 = icmp eq i8* %272, null                   ; <i1> [#uses=1]
  br i1 %274, label %bb2.i.i2598, label %_Z14test_variable1Ia22custom_divide_variableIaEEvPT_iS2_PKc.exit

bb2.i.i2598:                                      ; preds = %bb1.i.i2597
  %275 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %269) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia22custom_divide_variableIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2597, %bb5.i2595
  %results.7 = phi %struct.one_result* [ %273, %bb1.i.i2597 ], [ %results.6, %bb5.i2595 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.7 = phi i32 [ %269, %bb1.i.i2597 ], [ %allocated_results.6, %bb5.i2595 ] ; <i32> [#uses=3]
  %276 = phi %struct.one_result* [ %273, %bb1.i.i2597 ], [ %results.6, %bb5.i2595 ] ; <%struct.one_result*> [#uses=2]
  %277 = getelementptr inbounds %struct.one_result* %276, i32 8, i32 0 ; <double*> [#uses=1]
  store double %267, double* %277, align 4
  %278 = getelementptr inbounds %struct.one_result* %276, i32 8, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([23 x i8]* @.str20, i32 0, i32 0), i8** %278, align 4
  %279 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2559, label %bb5.i2575

bb.nph6.i2559:                                    ; preds = %_Z14test_variable1Ia22custom_divide_variableIaEEvPT_iS2_PKc.exit
  %280 = sext i8 %13 to i32                       ; <i32> [#uses=2]
  %281 = sext i8 %20 to i32                       ; <i32> [#uses=2]
  %282 = sext i8 %12 to i32                       ; <i32> [#uses=1]
  %283 = sdiv i32 %282, %280                      ; <i32> [#uses=1]
  %284 = sdiv i32 %283, %16                       ; <i32> [#uses=1]
  %285 = sdiv i32 %284, %17                       ; <i32> [#uses=1]
  %286 = sdiv i32 %285, %281                      ; <i32> [#uses=1]
  %retval12.i.i.us.i2570 = trunc i32 %286 to i8   ; <i8> [#uses=1]
  %287 = shl i8 %retval12.i.i.us.i2570, 6         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2562

bb2.preheader.us.i2562:                           ; preds = %_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2559
  %i.05.us.i2560 = phi i32 [ 0, %bb.nph6.i2559 ], [ %tmp.i2561, %_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2561 = add i32 %i.05.us.i2560, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2569

_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2574, %bb.i1.us.i2563
  %288 = icmp slt i32 %tmp.i2561, %iterations.0   ; <i1> [#uses=1]
  br i1 %288, label %bb2.preheader.us.i2562, label %bb5.i2575

bb.i1.us.i2563:                                   ; preds = %bb2.bb3_crit_edge.us.i2574
  %289 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 9) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2569:                                     ; preds = %bb1.us.i2569, %bb2.preheader.us.i2562
  %result.03.us.i2564 = phi i8 [ 0, %bb2.preheader.us.i2562 ], [ %296, %bb1.us.i2569 ] ; <i8> [#uses=1]
  %n.02.us.i2565 = phi i32 [ 0, %bb2.preheader.us.i2562 ], [ %297, %bb1.us.i2569 ] ; <i32> [#uses=2]
  %scevgep.i2566 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2565 ; <i8*> [#uses=1]
  %290 = load i8* %scevgep.i2566, align 1         ; <i8> [#uses=1]
  %291 = sext i8 %290 to i32                      ; <i32> [#uses=1]
  %292 = sdiv i32 %291, %280                      ; <i32> [#uses=1]
  %293 = sdiv i32 %292, %16                       ; <i32> [#uses=1]
  %294 = sdiv i32 %293, %17                       ; <i32> [#uses=1]
  %295 = sdiv i32 %294, %281                      ; <i32> [#uses=1]
  %retval12.i.us.i2567 = trunc i32 %295 to i8     ; <i8> [#uses=1]
  %296 = add i8 %retval12.i.us.i2567, %result.03.us.i2564 ; <i8> [#uses=2]
  %297 = add nsw i32 %n.02.us.i2565, 1            ; <i32> [#uses=2]
  %exitcond.i2568 = icmp eq i32 %297, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2568, label %bb2.bb3_crit_edge.us.i2574, label %bb1.us.i2569

bb2.bb3_crit_edge.us.i2574:                       ; preds = %bb1.us.i2569
  %298 = sub i8 %296, %287                        ; <i8> [#uses=2]
  %299 = sext i8 %298 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2571 = sub i32 0, %299             ; <i32> [#uses=1]
  %abscond.i.i.us.i2572 = icmp sgt i8 %298, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2573 = select i1 %abscond.i.i.us.i2572, i32 %299, i32 %neg.i.i.us.i2571 ; <i32> [#uses=1]
  %300 = icmp slt i32 %abs.i.i.us.i2573, 1        ; <i1> [#uses=1]
  br i1 %300, label %_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2563

bb5.i2575:                                        ; preds = %_Z26check_shifted_variable_sumIa31custom_divide_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia22custom_divide_variableIaEEvPT_iS2_PKc.exit
  %301 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %302 = sub i32 %301, %279                       ; <i32> [#uses=1]
  %303 = sitofp i32 %302 to double                ; <double> [#uses=1]
  %304 = fdiv double %303, 1.000000e+06           ; <double> [#uses=1]
  %.not2742 = icmp ne %struct.one_result* %results.7, null ; <i1> [#uses=1]
  %305 = icmp sgt i32 %allocated_results.7, 9     ; <i1> [#uses=1]
  %or.cond2743 = and i1 %305, %.not2742           ; <i1> [#uses=1]
  br i1 %or.cond2743, label %_Z14test_variable4Ia31custom_divide_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2577

bb1.i.i2577:                                      ; preds = %bb5.i2575
  %306 = add nsw i32 %allocated_results.7, 10     ; <i32> [#uses=3]
  %307 = mul i32 %306, 12                         ; <i32> [#uses=1]
  %308 = bitcast %struct.one_result* %results.7 to i8* ; <i8*> [#uses=1]
  %309 = tail call i8* @realloc(i8* %308, i32 %307) nounwind ; <i8*> [#uses=2]
  %310 = bitcast i8* %309 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %311 = icmp eq i8* %309, null                   ; <i1> [#uses=1]
  br i1 %311, label %bb2.i.i2578, label %_Z14test_variable4Ia31custom_divide_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2578:                                      ; preds = %bb1.i.i2577
  %312 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %306) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia31custom_divide_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2577, %bb5.i2575
  %results.8 = phi %struct.one_result* [ %310, %bb1.i.i2577 ], [ %results.7, %bb5.i2575 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.8 = phi i32 [ %306, %bb1.i.i2577 ], [ %allocated_results.7, %bb5.i2575 ] ; <i32> [#uses=3]
  %313 = phi %struct.one_result* [ %310, %bb1.i.i2577 ], [ %results.7, %bb5.i2575 ] ; <%struct.one_result*> [#uses=2]
  %314 = getelementptr inbounds %struct.one_result* %313, i32 9, i32 0 ; <double*> [#uses=1]
  store double %304, double* %314, align 4
  %315 = getelementptr inbounds %struct.one_result* %313, i32 9, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str21, i32 0, i32 0), i8** %315, align 4
  %316 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2541, label %bb5.i2555

bb.nph6.i2541:                                    ; preds = %_Z14test_variable4Ia31custom_divide_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %317 = sext i8 %13 to i32                       ; <i32> [#uses=1]
  %318 = sext i8 %20 to i32                       ; <i32> [#uses=1]
  %319 = sdiv i32 %317, %16                       ; <i32> [#uses=1]
  %320 = sdiv i32 %319, %17                       ; <i32> [#uses=1]
  %321 = sdiv i32 %320, %318                      ; <i32> [#uses=1]
  %322 = trunc i32 %321 to i8                     ; <i8> [#uses=2]
  %323 = add i8 %322, %12                         ; <i8> [#uses=1]
  %324 = shl i8 %323, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2544

bb2.preheader.us.i2544:                           ; preds = %_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2541
  %i.05.us.i2542 = phi i32 [ 0, %bb.nph6.i2541 ], [ %tmp.i2543, %_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2543 = add i32 %i.05.us.i2542, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2550

_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2554, %bb.i1.us.i2545
  %325 = icmp slt i32 %tmp.i2543, %iterations.0   ; <i1> [#uses=1]
  br i1 %325, label %bb2.preheader.us.i2544, label %bb5.i2555

bb.i1.us.i2545:                                   ; preds = %bb2.bb3_crit_edge.us.i2554
  %326 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 10) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2550:                                     ; preds = %bb1.us.i2550, %bb2.preheader.us.i2544
  %result.03.us.i2546 = phi i8 [ 0, %bb2.preheader.us.i2544 ], [ %329, %bb1.us.i2550 ] ; <i8> [#uses=1]
  %n.02.us.i2547 = phi i32 [ 0, %bb2.preheader.us.i2544 ], [ %330, %bb1.us.i2550 ] ; <i32> [#uses=2]
  %scevgep.i2548 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2547 ; <i8*> [#uses=1]
  %327 = load i8* %scevgep.i2548, align 1         ; <i8> [#uses=1]
  %328 = add i8 %327, %result.03.us.i2546         ; <i8> [#uses=1]
  %329 = add i8 %328, %322                        ; <i8> [#uses=2]
  %330 = add nsw i32 %n.02.us.i2547, 1            ; <i32> [#uses=2]
  %exitcond.i2549 = icmp eq i32 %330, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2549, label %bb2.bb3_crit_edge.us.i2554, label %bb1.us.i2550

bb2.bb3_crit_edge.us.i2554:                       ; preds = %bb1.us.i2550
  %331 = sub i8 %329, %324                        ; <i8> [#uses=2]
  %332 = sext i8 %331 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2551 = sub i32 0, %332             ; <i32> [#uses=1]
  %abscond.i.i.us.i2552 = icmp sgt i8 %331, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2553 = select i1 %abscond.i.i.us.i2552, i32 %332, i32 %neg.i.i.us.i2551 ; <i32> [#uses=1]
  %333 = icmp slt i32 %abs.i.i.us.i2553, 1        ; <i1> [#uses=1]
  br i1 %333, label %_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2545

bb5.i2555:                                        ; preds = %_Z26check_shifted_variable_sumIa32custom_divide_multiple_variable2IaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ia31custom_divide_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %334 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %335 = sub i32 %334, %316                       ; <i32> [#uses=1]
  %336 = sitofp i32 %335 to double                ; <double> [#uses=1]
  %337 = fdiv double %336, 1.000000e+06           ; <double> [#uses=1]
  %.not2744 = icmp ne %struct.one_result* %results.8, null ; <i1> [#uses=1]
  %338 = icmp sgt i32 %allocated_results.8, 10    ; <i1> [#uses=1]
  %or.cond2745 = and i1 %338, %.not2744           ; <i1> [#uses=1]
  br i1 %or.cond2745, label %_Z14test_variable4Ia32custom_divide_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2557

bb1.i.i2557:                                      ; preds = %bb5.i2555
  %339 = add nsw i32 %allocated_results.8, 10     ; <i32> [#uses=3]
  %340 = mul i32 %339, 12                         ; <i32> [#uses=1]
  %341 = bitcast %struct.one_result* %results.8 to i8* ; <i8*> [#uses=1]
  %342 = tail call i8* @realloc(i8* %341, i32 %340) nounwind ; <i8*> [#uses=2]
  %343 = bitcast i8* %342 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %344 = icmp eq i8* %342, null                   ; <i1> [#uses=1]
  br i1 %344, label %bb2.i.i2558, label %_Z14test_variable4Ia32custom_divide_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2558:                                      ; preds = %bb1.i.i2557
  %345 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %339) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia32custom_divide_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2557, %bb5.i2555
  %results.9 = phi %struct.one_result* [ %343, %bb1.i.i2557 ], [ %results.8, %bb5.i2555 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.9 = phi i32 [ %339, %bb1.i.i2557 ], [ %allocated_results.8, %bb5.i2555 ] ; <i32> [#uses=3]
  %346 = phi %struct.one_result* [ %343, %bb1.i.i2557 ], [ %results.8, %bb5.i2555 ] ; <%struct.one_result*> [#uses=2]
  %347 = getelementptr inbounds %struct.one_result* %346, i32 10, i32 0 ; <double*> [#uses=1]
  store double %337, double* %347, align 4
  %348 = getelementptr inbounds %struct.one_result* %346, i32 10, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str22, i32 0, i32 0), i8** %348, align 4
  %349 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i2523, label %bb5.i2537

bb.nph7.i2523:                                    ; preds = %_Z14test_variable4Ia32custom_divide_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit
  %350 = mul i32 %17, %16                         ; <i32> [#uses=1]
  %351 = sext i8 %20 to i32                       ; <i32> [#uses=1]
  %352 = sdiv i32 %350, %351                      ; <i32> [#uses=1]
  %353 = trunc i32 %352 to i8                     ; <i8> [#uses=2]
  %354 = add i8 %12, %13                          ; <i8> [#uses=1]
  %355 = sub i8 %354, %353                        ; <i8> [#uses=1]
  %356 = shl i8 %355, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2526

bb2.preheader.us.i2526:                           ; preds = %_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i2523
  %i.06.us.i2524 = phi i32 [ 0, %bb.nph7.i2523 ], [ %tmp.i2525, %_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2525 = add i32 %i.06.us.i2524, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2532

_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2536, %bb.i1.us.i2527
  %357 = icmp slt i32 %tmp.i2525, %iterations.0   ; <i1> [#uses=1]
  br i1 %357, label %bb2.preheader.us.i2526, label %bb5.i2537

bb.i1.us.i2527:                                   ; preds = %bb2.bb3_crit_edge.us.i2536
  %358 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 11) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2532:                                     ; preds = %bb1.us.i2532, %bb2.preheader.us.i2526
  %result.04.us.i2528 = phi i8 [ 0, %bb2.preheader.us.i2526 ], [ %362, %bb1.us.i2532 ] ; <i8> [#uses=1]
  %n.03.us.i2529 = phi i32 [ 0, %bb2.preheader.us.i2526 ], [ %363, %bb1.us.i2532 ] ; <i32> [#uses=2]
  %scevgep.i2530 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.03.us.i2529 ; <i8*> [#uses=1]
  %359 = load i8* %scevgep.i2530, align 1         ; <i8> [#uses=1]
  %360 = add i8 %result.04.us.i2528, %13          ; <i8> [#uses=1]
  %361 = add i8 %360, %359                        ; <i8> [#uses=1]
  %362 = sub i8 %361, %353                        ; <i8> [#uses=2]
  %363 = add nsw i32 %n.03.us.i2529, 1            ; <i32> [#uses=2]
  %exitcond.i2531 = icmp eq i32 %363, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2531, label %bb2.bb3_crit_edge.us.i2536, label %bb1.us.i2532

bb2.bb3_crit_edge.us.i2536:                       ; preds = %bb1.us.i2532
  %364 = sub i8 %362, %356                        ; <i8> [#uses=2]
  %365 = sext i8 %364 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2533 = sub i32 0, %365             ; <i32> [#uses=1]
  %abscond.i.i.us.i2534 = icmp sgt i8 %364, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2535 = select i1 %abscond.i.i.us.i2534, i32 %365, i32 %neg.i.i.us.i2533 ; <i32> [#uses=1]
  %366 = icmp slt i32 %abs.i.i.us.i2535, 1        ; <i1> [#uses=1]
  br i1 %366, label %_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2527

bb5.i2537:                                        ; preds = %_Z26check_shifted_variable_sumIa30custom_mixed_multiple_variableIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ia32custom_divide_multiple_variable2IaEEvPT_iS2_S2_S2_S2_PKc.exit
  %367 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %368 = sub i32 %367, %349                       ; <i32> [#uses=1]
  %369 = sitofp i32 %368 to double                ; <double> [#uses=1]
  %370 = fdiv double %369, 1.000000e+06           ; <double> [#uses=1]
  %.not2746 = icmp ne %struct.one_result* %results.9, null ; <i1> [#uses=1]
  %371 = icmp sgt i32 %allocated_results.9, 11    ; <i1> [#uses=1]
  %or.cond2747 = and i1 %371, %.not2746           ; <i1> [#uses=1]
  br i1 %or.cond2747, label %_Z14test_variable4Ia30custom_mixed_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2539

bb1.i.i2539:                                      ; preds = %bb5.i2537
  %372 = add nsw i32 %allocated_results.9, 10     ; <i32> [#uses=3]
  %373 = mul i32 %372, 12                         ; <i32> [#uses=1]
  %374 = bitcast %struct.one_result* %results.9 to i8* ; <i8*> [#uses=1]
  %375 = tail call i8* @realloc(i8* %374, i32 %373) nounwind ; <i8*> [#uses=2]
  %376 = bitcast i8* %375 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %377 = icmp eq i8* %375, null                   ; <i1> [#uses=1]
  br i1 %377, label %bb2.i.i2540, label %_Z14test_variable4Ia30custom_mixed_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2540:                                      ; preds = %bb1.i.i2539
  %378 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %372) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia30custom_mixed_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2539, %bb5.i2537
  %results.10 = phi %struct.one_result* [ %376, %bb1.i.i2539 ], [ %results.9, %bb5.i2537 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.10 = phi i32 [ %372, %bb1.i.i2539 ], [ %allocated_results.9, %bb5.i2537 ] ; <i32> [#uses=3]
  %379 = phi %struct.one_result* [ %376, %bb1.i.i2539 ], [ %results.9, %bb5.i2537 ] ; <%struct.one_result*> [#uses=2]
  %380 = getelementptr inbounds %struct.one_result* %379, i32 11, i32 0 ; <double*> [#uses=1]
  store double %370, double* %380, align 4
  %381 = getelementptr inbounds %struct.one_result* %379, i32 11, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str23, i32 0, i32 0), i8** %381, align 4
  %382 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2505, label %bb5.i2519

bb.nph6.i2505:                                    ; preds = %_Z14test_variable4Ia30custom_mixed_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %383 = and i8 %12, %13                          ; <i8> [#uses=1]
  %384 = shl i8 %383, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2508

bb2.preheader.us.i2508:                           ; preds = %_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i, %bb.nph6.i2505
  %i.05.us.i2506 = phi i32 [ 0, %bb.nph6.i2505 ], [ %tmp.i2507, %_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2507 = add i32 %i.05.us.i2506, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2514

_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2518, %bb.i1.us.i2509
  %385 = icmp slt i32 %tmp.i2507, %iterations.0   ; <i1> [#uses=1]
  br i1 %385, label %bb2.preheader.us.i2508, label %bb5.i2519

bb.i1.us.i2509:                                   ; preds = %bb2.bb3_crit_edge.us.i2518
  %386 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 12) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i

bb1.us.i2514:                                     ; preds = %bb1.us.i2514, %bb2.preheader.us.i2508
  %result.03.us.i2510 = phi i8 [ 0, %bb2.preheader.us.i2508 ], [ %389, %bb1.us.i2514 ] ; <i8> [#uses=1]
  %n.02.us.i2511 = phi i32 [ 0, %bb2.preheader.us.i2508 ], [ %390, %bb1.us.i2514 ] ; <i32> [#uses=2]
  %scevgep.i2512 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2511 ; <i8*> [#uses=1]
  %387 = load i8* %scevgep.i2512, align 1         ; <i8> [#uses=1]
  %388 = and i8 %387, %13                         ; <i8> [#uses=1]
  %389 = add i8 %388, %result.03.us.i2510         ; <i8> [#uses=2]
  %390 = add nsw i32 %n.02.us.i2511, 1            ; <i32> [#uses=2]
  %exitcond.i2513 = icmp eq i32 %390, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2513, label %bb2.bb3_crit_edge.us.i2518, label %bb1.us.i2514

bb2.bb3_crit_edge.us.i2518:                       ; preds = %bb1.us.i2514
  %391 = sub i8 %389, %384                        ; <i8> [#uses=2]
  %392 = sext i8 %391 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2515 = sub i32 0, %392             ; <i32> [#uses=1]
  %abscond.i.i.us.i2516 = icmp sgt i8 %391, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2517 = select i1 %abscond.i.i.us.i2516, i32 %392, i32 %neg.i.i.us.i2515 ; <i32> [#uses=1]
  %393 = icmp slt i32 %abs.i.i.us.i2517, 1        ; <i1> [#uses=1]
  br i1 %393, label %_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2509

bb5.i2519:                                        ; preds = %_Z26check_shifted_variable_sumIa19custom_variable_andIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia30custom_mixed_multiple_variableIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %394 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %395 = sub i32 %394, %382                       ; <i32> [#uses=1]
  %396 = sitofp i32 %395 to double                ; <double> [#uses=1]
  %397 = fdiv double %396, 1.000000e+06           ; <double> [#uses=1]
  %.not2748 = icmp ne %struct.one_result* %results.10, null ; <i1> [#uses=1]
  %398 = icmp sgt i32 %allocated_results.10, 12   ; <i1> [#uses=1]
  %or.cond2749 = and i1 %398, %.not2748           ; <i1> [#uses=1]
  br i1 %or.cond2749, label %_Z14test_variable1Ia19custom_variable_andIaEEvPT_iS2_PKc.exit, label %bb1.i.i2521

bb1.i.i2521:                                      ; preds = %bb5.i2519
  %399 = add nsw i32 %allocated_results.10, 10    ; <i32> [#uses=3]
  %400 = mul i32 %399, 12                         ; <i32> [#uses=1]
  %401 = bitcast %struct.one_result* %results.10 to i8* ; <i8*> [#uses=1]
  %402 = tail call i8* @realloc(i8* %401, i32 %400) nounwind ; <i8*> [#uses=2]
  %403 = bitcast i8* %402 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %404 = icmp eq i8* %402, null                   ; <i1> [#uses=1]
  br i1 %404, label %bb2.i.i2522, label %_Z14test_variable1Ia19custom_variable_andIaEEvPT_iS2_PKc.exit

bb2.i.i2522:                                      ; preds = %bb1.i.i2521
  %405 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %399) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia19custom_variable_andIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2521, %bb5.i2519
  %results.11 = phi %struct.one_result* [ %403, %bb1.i.i2521 ], [ %results.10, %bb5.i2519 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.11 = phi i32 [ %399, %bb1.i.i2521 ], [ %allocated_results.10, %bb5.i2519 ] ; <i32> [#uses=3]
  %406 = phi %struct.one_result* [ %403, %bb1.i.i2521 ], [ %results.10, %bb5.i2519 ] ; <%struct.one_result*> [#uses=2]
  %407 = getelementptr inbounds %struct.one_result* %406, i32 12, i32 0 ; <double*> [#uses=1]
  store double %397, double* %407, align 4
  %408 = getelementptr inbounds %struct.one_result* %406, i32 12, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str24, i32 0, i32 0), i8** %408, align 4
  %409 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2487, label %bb5.i2501

bb.nph6.i2487:                                    ; preds = %_Z14test_variable1Ia19custom_variable_andIaEEvPT_iS2_PKc.exit
  %410 = and i8 %14, %13                          ; <i8> [#uses=1]
  %411 = and i8 %410, %15                         ; <i8> [#uses=1]
  %412 = and i8 %411, %20                         ; <i8> [#uses=2]
  %413 = and i8 %412, %12                         ; <i8> [#uses=1]
  %414 = shl i8 %413, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2490

bb2.preheader.us.i2490:                           ; preds = %_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2487
  %i.05.us.i2488 = phi i32 [ 0, %bb.nph6.i2487 ], [ %tmp.i2489, %_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2489 = add i32 %i.05.us.i2488, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2496

_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2500, %bb.i1.us.i2491
  %415 = icmp slt i32 %tmp.i2489, %iterations.0   ; <i1> [#uses=1]
  br i1 %415, label %bb2.preheader.us.i2490, label %bb5.i2501

bb.i1.us.i2491:                                   ; preds = %bb2.bb3_crit_edge.us.i2500
  %416 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 13) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2496:                                     ; preds = %bb1.us.i2496, %bb2.preheader.us.i2490
  %result.03.us.i2492 = phi i8 [ 0, %bb2.preheader.us.i2490 ], [ %419, %bb1.us.i2496 ] ; <i8> [#uses=1]
  %n.02.us.i2493 = phi i32 [ 0, %bb2.preheader.us.i2490 ], [ %420, %bb1.us.i2496 ] ; <i32> [#uses=2]
  %scevgep.i2494 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2493 ; <i8*> [#uses=1]
  %417 = load i8* %scevgep.i2494, align 1         ; <i8> [#uses=1]
  %418 = and i8 %412, %417                        ; <i8> [#uses=1]
  %419 = add i8 %418, %result.03.us.i2492         ; <i8> [#uses=2]
  %420 = add nsw i32 %n.02.us.i2493, 1            ; <i32> [#uses=2]
  %exitcond.i2495 = icmp eq i32 %420, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2495, label %bb2.bb3_crit_edge.us.i2500, label %bb1.us.i2496

bb2.bb3_crit_edge.us.i2500:                       ; preds = %bb1.us.i2496
  %421 = sub i8 %419, %414                        ; <i8> [#uses=2]
  %422 = sext i8 %421 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2497 = sub i32 0, %422             ; <i32> [#uses=1]
  %abscond.i.i.us.i2498 = icmp sgt i8 %421, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2499 = select i1 %abscond.i.i.us.i2498, i32 %422, i32 %neg.i.i.us.i2497 ; <i32> [#uses=1]
  %423 = icmp slt i32 %abs.i.i.us.i2499, 1        ; <i1> [#uses=1]
  br i1 %423, label %_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2491

bb5.i2501:                                        ; preds = %_Z26check_shifted_variable_sumIa28custom_multiple_variable_andIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia19custom_variable_andIaEEvPT_iS2_PKc.exit
  %424 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %425 = sub i32 %424, %409                       ; <i32> [#uses=1]
  %426 = sitofp i32 %425 to double                ; <double> [#uses=1]
  %427 = fdiv double %426, 1.000000e+06           ; <double> [#uses=1]
  %.not2750 = icmp ne %struct.one_result* %results.11, null ; <i1> [#uses=1]
  %428 = icmp sgt i32 %allocated_results.11, 13   ; <i1> [#uses=1]
  %or.cond2751 = and i1 %428, %.not2750           ; <i1> [#uses=1]
  br i1 %or.cond2751, label %_Z14test_variable4Ia28custom_multiple_variable_andIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2503

bb1.i.i2503:                                      ; preds = %bb5.i2501
  %429 = add nsw i32 %allocated_results.11, 10    ; <i32> [#uses=3]
  %430 = mul i32 %429, 12                         ; <i32> [#uses=1]
  %431 = bitcast %struct.one_result* %results.11 to i8* ; <i8*> [#uses=1]
  %432 = tail call i8* @realloc(i8* %431, i32 %430) nounwind ; <i8*> [#uses=2]
  %433 = bitcast i8* %432 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %434 = icmp eq i8* %432, null                   ; <i1> [#uses=1]
  br i1 %434, label %bb2.i.i2504, label %_Z14test_variable4Ia28custom_multiple_variable_andIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2504:                                      ; preds = %bb1.i.i2503
  %435 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %429) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia28custom_multiple_variable_andIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2503, %bb5.i2501
  %results.12 = phi %struct.one_result* [ %433, %bb1.i.i2503 ], [ %results.11, %bb5.i2501 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.12 = phi i32 [ %429, %bb1.i.i2503 ], [ %allocated_results.11, %bb5.i2501 ] ; <i32> [#uses=3]
  %436 = phi %struct.one_result* [ %433, %bb1.i.i2503 ], [ %results.11, %bb5.i2501 ] ; <%struct.one_result*> [#uses=2]
  %437 = getelementptr inbounds %struct.one_result* %436, i32 13, i32 0 ; <double*> [#uses=1]
  store double %427, double* %437, align 4
  %438 = getelementptr inbounds %struct.one_result* %436, i32 13, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i8** %438, align 4
  %439 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2469, label %bb5.i2483

bb.nph6.i2469:                                    ; preds = %_Z14test_variable4Ia28custom_multiple_variable_andIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %440 = or i8 %12, %13                           ; <i8> [#uses=1]
  %441 = shl i8 %440, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2472

bb2.preheader.us.i2472:                           ; preds = %_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i, %bb.nph6.i2469
  %i.05.us.i2470 = phi i32 [ 0, %bb.nph6.i2469 ], [ %tmp.i2471, %_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2471 = add i32 %i.05.us.i2470, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2478

_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2482, %bb.i1.us.i2473
  %442 = icmp slt i32 %tmp.i2471, %iterations.0   ; <i1> [#uses=1]
  br i1 %442, label %bb2.preheader.us.i2472, label %bb5.i2483

bb.i1.us.i2473:                                   ; preds = %bb2.bb3_crit_edge.us.i2482
  %443 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 14) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i

bb1.us.i2478:                                     ; preds = %bb1.us.i2478, %bb2.preheader.us.i2472
  %result.03.us.i2474 = phi i8 [ 0, %bb2.preheader.us.i2472 ], [ %446, %bb1.us.i2478 ] ; <i8> [#uses=1]
  %n.02.us.i2475 = phi i32 [ 0, %bb2.preheader.us.i2472 ], [ %447, %bb1.us.i2478 ] ; <i32> [#uses=2]
  %scevgep.i2476 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2475 ; <i8*> [#uses=1]
  %444 = load i8* %scevgep.i2476, align 1         ; <i8> [#uses=1]
  %445 = or i8 %444, %13                          ; <i8> [#uses=1]
  %446 = add i8 %445, %result.03.us.i2474         ; <i8> [#uses=2]
  %447 = add nsw i32 %n.02.us.i2475, 1            ; <i32> [#uses=2]
  %exitcond.i2477 = icmp eq i32 %447, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2477, label %bb2.bb3_crit_edge.us.i2482, label %bb1.us.i2478

bb2.bb3_crit_edge.us.i2482:                       ; preds = %bb1.us.i2478
  %448 = sub i8 %446, %441                        ; <i8> [#uses=2]
  %449 = sext i8 %448 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2479 = sub i32 0, %449             ; <i32> [#uses=1]
  %abscond.i.i.us.i2480 = icmp sgt i8 %448, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2481 = select i1 %abscond.i.i.us.i2480, i32 %449, i32 %neg.i.i.us.i2479 ; <i32> [#uses=1]
  %450 = icmp slt i32 %abs.i.i.us.i2481, 1        ; <i1> [#uses=1]
  br i1 %450, label %_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2473

bb5.i2483:                                        ; preds = %_Z26check_shifted_variable_sumIa18custom_variable_orIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia28custom_multiple_variable_andIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %451 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %452 = sub i32 %451, %439                       ; <i32> [#uses=1]
  %453 = sitofp i32 %452 to double                ; <double> [#uses=1]
  %454 = fdiv double %453, 1.000000e+06           ; <double> [#uses=1]
  %.not2752 = icmp ne %struct.one_result* %results.12, null ; <i1> [#uses=1]
  %455 = icmp sgt i32 %allocated_results.12, 14   ; <i1> [#uses=1]
  %or.cond2753 = and i1 %455, %.not2752           ; <i1> [#uses=1]
  br i1 %or.cond2753, label %_Z14test_variable1Ia18custom_variable_orIaEEvPT_iS2_PKc.exit, label %bb1.i.i2485

bb1.i.i2485:                                      ; preds = %bb5.i2483
  %456 = add nsw i32 %allocated_results.12, 10    ; <i32> [#uses=3]
  %457 = mul i32 %456, 12                         ; <i32> [#uses=1]
  %458 = bitcast %struct.one_result* %results.12 to i8* ; <i8*> [#uses=1]
  %459 = tail call i8* @realloc(i8* %458, i32 %457) nounwind ; <i8*> [#uses=2]
  %460 = bitcast i8* %459 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %461 = icmp eq i8* %459, null                   ; <i1> [#uses=1]
  br i1 %461, label %bb2.i.i2486, label %_Z14test_variable1Ia18custom_variable_orIaEEvPT_iS2_PKc.exit

bb2.i.i2486:                                      ; preds = %bb1.i.i2485
  %462 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %456) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia18custom_variable_orIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2485, %bb5.i2483
  %results.13 = phi %struct.one_result* [ %460, %bb1.i.i2485 ], [ %results.12, %bb5.i2483 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.13 = phi i32 [ %456, %bb1.i.i2485 ], [ %allocated_results.12, %bb5.i2483 ] ; <i32> [#uses=3]
  %463 = phi %struct.one_result* [ %460, %bb1.i.i2485 ], [ %results.12, %bb5.i2483 ] ; <%struct.one_result*> [#uses=2]
  %464 = getelementptr inbounds %struct.one_result* %463, i32 14, i32 0 ; <double*> [#uses=1]
  store double %454, double* %464, align 4
  %465 = getelementptr inbounds %struct.one_result* %463, i32 14, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([19 x i8]* @.str26, i32 0, i32 0), i8** %465, align 4
  %466 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2451, label %bb5.i2465

bb.nph6.i2451:                                    ; preds = %_Z14test_variable1Ia18custom_variable_orIaEEvPT_iS2_PKc.exit
  %467 = or i8 %14, %13                           ; <i8> [#uses=1]
  %468 = or i8 %467, %15                          ; <i8> [#uses=1]
  %469 = or i8 %468, %20                          ; <i8> [#uses=2]
  %470 = or i8 %469, %12                          ; <i8> [#uses=1]
  %471 = shl i8 %470, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2454

bb2.preheader.us.i2454:                           ; preds = %_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2451
  %i.05.us.i2452 = phi i32 [ 0, %bb.nph6.i2451 ], [ %tmp.i2453, %_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2453 = add i32 %i.05.us.i2452, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2460

_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2464, %bb.i1.us.i2455
  %472 = icmp slt i32 %tmp.i2453, %iterations.0   ; <i1> [#uses=1]
  br i1 %472, label %bb2.preheader.us.i2454, label %bb5.i2465

bb.i1.us.i2455:                                   ; preds = %bb2.bb3_crit_edge.us.i2464
  %473 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 15) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2460:                                     ; preds = %bb1.us.i2460, %bb2.preheader.us.i2454
  %result.03.us.i2456 = phi i8 [ 0, %bb2.preheader.us.i2454 ], [ %476, %bb1.us.i2460 ] ; <i8> [#uses=1]
  %n.02.us.i2457 = phi i32 [ 0, %bb2.preheader.us.i2454 ], [ %477, %bb1.us.i2460 ] ; <i32> [#uses=2]
  %scevgep.i2458 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2457 ; <i8*> [#uses=1]
  %474 = load i8* %scevgep.i2458, align 1         ; <i8> [#uses=1]
  %475 = or i8 %469, %474                         ; <i8> [#uses=1]
  %476 = add i8 %475, %result.03.us.i2456         ; <i8> [#uses=2]
  %477 = add nsw i32 %n.02.us.i2457, 1            ; <i32> [#uses=2]
  %exitcond.i2459 = icmp eq i32 %477, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2459, label %bb2.bb3_crit_edge.us.i2464, label %bb1.us.i2460

bb2.bb3_crit_edge.us.i2464:                       ; preds = %bb1.us.i2460
  %478 = sub i8 %476, %471                        ; <i8> [#uses=2]
  %479 = sext i8 %478 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2461 = sub i32 0, %479             ; <i32> [#uses=1]
  %abscond.i.i.us.i2462 = icmp sgt i8 %478, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2463 = select i1 %abscond.i.i.us.i2462, i32 %479, i32 %neg.i.i.us.i2461 ; <i32> [#uses=1]
  %480 = icmp slt i32 %abs.i.i.us.i2463, 1        ; <i1> [#uses=1]
  br i1 %480, label %_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2455

bb5.i2465:                                        ; preds = %_Z26check_shifted_variable_sumIa27custom_multiple_variable_orIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia18custom_variable_orIaEEvPT_iS2_PKc.exit
  %481 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %482 = sub i32 %481, %466                       ; <i32> [#uses=1]
  %483 = sitofp i32 %482 to double                ; <double> [#uses=1]
  %484 = fdiv double %483, 1.000000e+06           ; <double> [#uses=1]
  %.not2754 = icmp ne %struct.one_result* %results.13, null ; <i1> [#uses=1]
  %485 = icmp sgt i32 %allocated_results.13, 15   ; <i1> [#uses=1]
  %or.cond2755 = and i1 %485, %.not2754           ; <i1> [#uses=1]
  br i1 %or.cond2755, label %_Z14test_variable4Ia27custom_multiple_variable_orIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2467

bb1.i.i2467:                                      ; preds = %bb5.i2465
  %486 = add nsw i32 %allocated_results.13, 10    ; <i32> [#uses=3]
  %487 = mul i32 %486, 12                         ; <i32> [#uses=1]
  %488 = bitcast %struct.one_result* %results.13 to i8* ; <i8*> [#uses=1]
  %489 = tail call i8* @realloc(i8* %488, i32 %487) nounwind ; <i8*> [#uses=2]
  %490 = bitcast i8* %489 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %491 = icmp eq i8* %489, null                   ; <i1> [#uses=1]
  br i1 %491, label %bb2.i.i2468, label %_Z14test_variable4Ia27custom_multiple_variable_orIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2468:                                      ; preds = %bb1.i.i2467
  %492 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %486) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia27custom_multiple_variable_orIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2467, %bb5.i2465
  %results.14 = phi %struct.one_result* [ %490, %bb1.i.i2467 ], [ %results.13, %bb5.i2465 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.14 = phi i32 [ %486, %bb1.i.i2467 ], [ %allocated_results.13, %bb5.i2465 ] ; <i32> [#uses=3]
  %493 = phi %struct.one_result* [ %490, %bb1.i.i2467 ], [ %results.13, %bb5.i2465 ] ; <%struct.one_result*> [#uses=2]
  %494 = getelementptr inbounds %struct.one_result* %493, i32 15, i32 0 ; <double*> [#uses=1]
  store double %484, double* %494, align 4
  %495 = getelementptr inbounds %struct.one_result* %493, i32 15, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([28 x i8]* @.str27, i32 0, i32 0), i8** %495, align 4
  %496 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2433, label %bb5.i2447

bb.nph6.i2433:                                    ; preds = %_Z14test_variable4Ia27custom_multiple_variable_orIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %497 = xor i8 %12, %13                          ; <i8> [#uses=1]
  %498 = shl i8 %497, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2436

bb2.preheader.us.i2436:                           ; preds = %_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i, %bb.nph6.i2433
  %i.05.us.i2434 = phi i32 [ 0, %bb.nph6.i2433 ], [ %tmp.i2435, %_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2435 = add i32 %i.05.us.i2434, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2442

_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2446, %bb.i1.us.i2437
  %499 = icmp slt i32 %tmp.i2435, %iterations.0   ; <i1> [#uses=1]
  br i1 %499, label %bb2.preheader.us.i2436, label %bb5.i2447

bb.i1.us.i2437:                                   ; preds = %bb2.bb3_crit_edge.us.i2446
  %500 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 16) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i

bb1.us.i2442:                                     ; preds = %bb1.us.i2442, %bb2.preheader.us.i2436
  %result.03.us.i2438 = phi i8 [ 0, %bb2.preheader.us.i2436 ], [ %503, %bb1.us.i2442 ] ; <i8> [#uses=1]
  %n.02.us.i2439 = phi i32 [ 0, %bb2.preheader.us.i2436 ], [ %504, %bb1.us.i2442 ] ; <i32> [#uses=2]
  %scevgep.i2440 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2439 ; <i8*> [#uses=1]
  %501 = load i8* %scevgep.i2440, align 1         ; <i8> [#uses=1]
  %502 = xor i8 %501, %13                         ; <i8> [#uses=1]
  %503 = add i8 %502, %result.03.us.i2438         ; <i8> [#uses=2]
  %504 = add nsw i32 %n.02.us.i2439, 1            ; <i32> [#uses=2]
  %exitcond.i2441 = icmp eq i32 %504, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2441, label %bb2.bb3_crit_edge.us.i2446, label %bb1.us.i2442

bb2.bb3_crit_edge.us.i2446:                       ; preds = %bb1.us.i2442
  %505 = sub i8 %503, %498                        ; <i8> [#uses=2]
  %506 = sext i8 %505 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2443 = sub i32 0, %506             ; <i32> [#uses=1]
  %abscond.i.i.us.i2444 = icmp sgt i8 %505, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2445 = select i1 %abscond.i.i.us.i2444, i32 %506, i32 %neg.i.i.us.i2443 ; <i32> [#uses=1]
  %507 = icmp slt i32 %abs.i.i.us.i2445, 1        ; <i1> [#uses=1]
  br i1 %507, label %_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i, label %bb.i1.us.i2437

bb5.i2447:                                        ; preds = %_Z26check_shifted_variable_sumIa19custom_variable_xorIaEEvT_S2_.exit.us.i, %_Z14test_variable4Ia27custom_multiple_variable_orIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %508 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %509 = sub i32 %508, %496                       ; <i32> [#uses=1]
  %510 = sitofp i32 %509 to double                ; <double> [#uses=1]
  %511 = fdiv double %510, 1.000000e+06           ; <double> [#uses=1]
  %.not2756 = icmp ne %struct.one_result* %results.14, null ; <i1> [#uses=1]
  %512 = icmp sgt i32 %allocated_results.14, 16   ; <i1> [#uses=1]
  %or.cond2757 = and i1 %512, %.not2756           ; <i1> [#uses=1]
  br i1 %or.cond2757, label %_Z14test_variable1Ia19custom_variable_xorIaEEvPT_iS2_PKc.exit, label %bb1.i.i2449

bb1.i.i2449:                                      ; preds = %bb5.i2447
  %513 = add nsw i32 %allocated_results.14, 10    ; <i32> [#uses=3]
  %514 = mul i32 %513, 12                         ; <i32> [#uses=1]
  %515 = bitcast %struct.one_result* %results.14 to i8* ; <i8*> [#uses=1]
  %516 = tail call i8* @realloc(i8* %515, i32 %514) nounwind ; <i8*> [#uses=2]
  %517 = bitcast i8* %516 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %518 = icmp eq i8* %516, null                   ; <i1> [#uses=1]
  br i1 %518, label %bb2.i.i2450, label %_Z14test_variable1Ia19custom_variable_xorIaEEvPT_iS2_PKc.exit

bb2.i.i2450:                                      ; preds = %bb1.i.i2449
  %519 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %513) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ia19custom_variable_xorIaEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2449, %bb5.i2447
  %results.15 = phi %struct.one_result* [ %517, %bb1.i.i2449 ], [ %results.14, %bb5.i2447 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.15 = phi i32 [ %513, %bb1.i.i2449 ], [ %allocated_results.14, %bb5.i2447 ] ; <i32> [#uses=3]
  %520 = phi %struct.one_result* [ %517, %bb1.i.i2449 ], [ %results.14, %bb5.i2447 ] ; <%struct.one_result*> [#uses=2]
  %521 = getelementptr inbounds %struct.one_result* %520, i32 16, i32 0 ; <double*> [#uses=1]
  store double %511, double* %521, align 4
  %522 = getelementptr inbounds %struct.one_result* %520, i32 16, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str28, i32 0, i32 0), i8** %522, align 4
  %523 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2415, label %bb5.i2429

bb.nph6.i2415:                                    ; preds = %_Z14test_variable1Ia19custom_variable_xorIaEEvPT_iS2_PKc.exit
  %524 = xor i8 %14, %13                          ; <i8> [#uses=1]
  %525 = xor i8 %524, %15                         ; <i8> [#uses=1]
  %526 = xor i8 %525, %20                         ; <i8> [#uses=2]
  %527 = xor i8 %526, %12                         ; <i8> [#uses=1]
  %528 = shl i8 %527, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2418

bb2.preheader.us.i2418:                           ; preds = %_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2415
  %i.05.us.i2416 = phi i32 [ 0, %bb.nph6.i2415 ], [ %tmp.i2417, %_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2417 = add i32 %i.05.us.i2416, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2424

_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2428, %bb.i1.us.i2419
  %529 = icmp slt i32 %tmp.i2417, %iterations.0   ; <i1> [#uses=1]
  br i1 %529, label %bb2.preheader.us.i2418, label %bb5.i2429

bb.i1.us.i2419:                                   ; preds = %bb2.bb3_crit_edge.us.i2428
  %530 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 17) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2424:                                     ; preds = %bb1.us.i2424, %bb2.preheader.us.i2418
  %result.03.us.i2420 = phi i8 [ 0, %bb2.preheader.us.i2418 ], [ %533, %bb1.us.i2424 ] ; <i8> [#uses=1]
  %n.02.us.i2421 = phi i32 [ 0, %bb2.preheader.us.i2418 ], [ %534, %bb1.us.i2424 ] ; <i32> [#uses=2]
  %scevgep.i2422 = getelementptr [8000 x i8]* @data8, i32 0, i32 %n.02.us.i2421 ; <i8*> [#uses=1]
  %531 = load i8* %scevgep.i2422, align 1         ; <i8> [#uses=1]
  %532 = xor i8 %526, %531                        ; <i8> [#uses=1]
  %533 = add i8 %532, %result.03.us.i2420         ; <i8> [#uses=2]
  %534 = add nsw i32 %n.02.us.i2421, 1            ; <i32> [#uses=2]
  %exitcond.i2423 = icmp eq i32 %534, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2423, label %bb2.bb3_crit_edge.us.i2428, label %bb1.us.i2424

bb2.bb3_crit_edge.us.i2428:                       ; preds = %bb1.us.i2424
  %535 = sub i8 %533, %528                        ; <i8> [#uses=2]
  %536 = sext i8 %535 to i32                      ; <i32> [#uses=2]
  %neg.i.i.us.i2425 = sub i32 0, %536             ; <i32> [#uses=1]
  %abscond.i.i.us.i2426 = icmp sgt i8 %535, -1    ; <i1> [#uses=1]
  %abs.i.i.us.i2427 = select i1 %abscond.i.i.us.i2426, i32 %536, i32 %neg.i.i.us.i2425 ; <i32> [#uses=1]
  %537 = icmp slt i32 %abs.i.i.us.i2427, 1        ; <i1> [#uses=1]
  br i1 %537, label %_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2419

bb5.i2429:                                        ; preds = %_Z26check_shifted_variable_sumIa28custom_multiple_variable_xorIaEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ia19custom_variable_xorIaEEvPT_iS2_PKc.exit
  %538 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %539 = sub i32 %538, %523                       ; <i32> [#uses=1]
  %540 = sitofp i32 %539 to double                ; <double> [#uses=1]
  %541 = fdiv double %540, 1.000000e+06           ; <double> [#uses=1]
  %.not2758 = icmp ne %struct.one_result* %results.15, null ; <i1> [#uses=1]
  %542 = icmp sgt i32 %allocated_results.15, 17   ; <i1> [#uses=1]
  %or.cond2759 = and i1 %542, %.not2758           ; <i1> [#uses=1]
  br i1 %or.cond2759, label %_Z14test_variable4Ia28custom_multiple_variable_xorIaEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2431

bb1.i.i2431:                                      ; preds = %bb5.i2429
  %543 = add nsw i32 %allocated_results.15, 10    ; <i32> [#uses=3]
  %544 = mul i32 %543, 12                         ; <i32> [#uses=1]
  %545 = bitcast %struct.one_result* %results.15 to i8* ; <i8*> [#uses=1]
  %546 = tail call i8* @realloc(i8* %545, i32 %544) nounwind ; <i8*> [#uses=2]
  %547 = bitcast i8* %546 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %548 = icmp eq i8* %546, null                   ; <i1> [#uses=1]
  br i1 %548, label %bb2.i.i2432, label %_Z14test_variable4Ia28custom_multiple_variable_xorIaEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2432:                                      ; preds = %bb1.i.i2431
  %549 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %543) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ia28custom_multiple_variable_xorIaEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2431, %bb5.i2429
  %results.16 = phi %struct.one_result* [ %547, %bb1.i.i2431 ], [ %results.15, %bb5.i2429 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.16 = phi i32 [ %543, %bb1.i.i2431 ], [ %allocated_results.15, %bb5.i2429 ] ; <i32> [#uses=3]
  %550 = phi %struct.one_result* [ %547, %bb1.i.i2431 ], [ %results.15, %bb5.i2429 ] ; <%struct.one_result*> [#uses=2]
  %551 = getelementptr inbounds %struct.one_result* %550, i32 17, i32 0 ; <double*> [#uses=1]
  store double %541, double* %551, align 4
  %552 = getelementptr inbounds %struct.one_result* %550, i32 17, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i8** %552, align 4
  %553 = fptoui double %init_value.0 to i8        ; <i8> [#uses=19]
  br label %bb.i5

bb.i5:                                            ; preds = %bb.i5, %_Z14test_variable4Ia28custom_multiple_variable_xorIaEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i1 = phi i32 [ 0, %_Z14test_variable4Ia28custom_multiple_variable_xorIaEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %indvar.next.i3, %bb.i5 ] ; <i32> [#uses=2]
  %first_addr.01.i2 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %indvar.i1 ; <i8*> [#uses=1]
  store i8 %553, i8* %first_addr.01.i2, align 1
  %indvar.next.i3 = add i32 %indvar.i1, 1         ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i3, ptrtoint (i8* getelementptr ([8000 x i8]* @data8unsigned, i32 1, i32 sub (i32 0, i32 ptrtoint ([8000 x i8]* @data8unsigned to i32))) to i32) ; <i1> [#uses=1]
  br i1 %exitcond, label %_Z4fillIPhhEvT_S1_T0_.exit, label %bb.i5

_Z4fillIPhhEvT_S1_T0_.exit:                       ; preds = %bb.i5
  %554 = fptoui double %temp.0 to i8              ; <i8> [#uses=32]
  %555 = shl i8 %554, 1                           ; <i8> [#uses=13]
  %556 = add i8 %554, 2                           ; <i8> [#uses=14]
  %557 = udiv i8 %555, %556                       ; <i8> [#uses=1]
  %558 = add i8 %557, %554                        ; <i8> [#uses=13]
  %559 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2399, label %bb5.i2411

bb.nph6.i2399:                                    ; preds = %_Z4fillIPhhEvT_S1_T0_.exit
  %560 = add i8 %553, %554                        ; <i8> [#uses=1]
  %561 = shl i8 %560, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2402

bb2.preheader.us.i2402:                           ; preds = %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403, %bb.nph6.i2399
  %i.05.us.i2400 = phi i32 [ 0, %bb.nph6.i2399 ], [ %tmp.i2401, %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403 ] ; <i32> [#uses=1]
  %tmp.i2401 = add i32 %i.05.us.i2400, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2409

_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403: ; preds = %bb2.bb3_crit_edge.us.i2410, %bb.i1.us.i2404
  %562 = icmp slt i32 %tmp.i2401, %iterations.0   ; <i1> [#uses=1]
  br i1 %562, label %bb2.preheader.us.i2402, label %bb5.i2411

bb.i1.us.i2404:                                   ; preds = %bb2.bb3_crit_edge.us.i2410
  %563 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 18) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403

bb1.us.i2409:                                     ; preds = %bb1.us.i2409, %bb2.preheader.us.i2402
  %result.03.us.i2405 = phi i8 [ 0, %bb2.preheader.us.i2402 ], [ %566, %bb1.us.i2409 ] ; <i8> [#uses=1]
  %n.02.us.i2406 = phi i32 [ 0, %bb2.preheader.us.i2402 ], [ %567, %bb1.us.i2409 ] ; <i32> [#uses=2]
  %scevgep.i2407 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2406 ; <i8*> [#uses=1]
  %564 = load i8* %scevgep.i2407, align 1         ; <i8> [#uses=1]
  %565 = add i8 %result.03.us.i2405, %554         ; <i8> [#uses=1]
  %566 = add i8 %565, %564                        ; <i8> [#uses=2]
  %567 = add nsw i32 %n.02.us.i2406, 1            ; <i32> [#uses=2]
  %exitcond.i2408 = icmp eq i32 %567, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2408, label %bb2.bb3_crit_edge.us.i2410, label %bb1.us.i2409

bb2.bb3_crit_edge.us.i2410:                       ; preds = %bb1.us.i2409
  %568 = icmp eq i8 %561, %566                    ; <i1> [#uses=1]
  br i1 %568, label %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403, label %bb.i1.us.i2404

bb5.i2411:                                        ; preds = %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i2403, %_Z4fillIPhhEvT_S1_T0_.exit
  %569 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %570 = sub i32 %569, %559                       ; <i32> [#uses=1]
  %571 = sitofp i32 %570 to double                ; <double> [#uses=1]
  %572 = fdiv double %571, 1.000000e+06           ; <double> [#uses=1]
  %.not2760 = icmp ne %struct.one_result* %results.16, null ; <i1> [#uses=1]
  %573 = icmp sgt i32 %allocated_results.16, 18   ; <i1> [#uses=1]
  %or.cond2761 = and i1 %573, %.not2760           ; <i1> [#uses=1]
  br i1 %or.cond2761, label %_Z14test_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit, label %bb1.i.i2413

bb1.i.i2413:                                      ; preds = %bb5.i2411
  %574 = add nsw i32 %allocated_results.16, 10    ; <i32> [#uses=3]
  %575 = mul i32 %574, 12                         ; <i32> [#uses=1]
  %576 = bitcast %struct.one_result* %results.16 to i8* ; <i8*> [#uses=1]
  %577 = tail call i8* @realloc(i8* %576, i32 %575) nounwind ; <i8*> [#uses=2]
  %578 = bitcast i8* %577 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %579 = icmp eq i8* %577, null                   ; <i1> [#uses=1]
  br i1 %579, label %bb2.i.i2414, label %_Z14test_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit

bb2.i.i2414:                                      ; preds = %bb1.i.i2413
  %580 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %574) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2413, %bb5.i2411
  %results.17 = phi %struct.one_result* [ %578, %bb1.i.i2413 ], [ %results.16, %bb5.i2411 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.17 = phi i32 [ %574, %bb1.i.i2413 ], [ %allocated_results.16, %bb5.i2411 ] ; <i32> [#uses=3]
  %581 = phi %struct.one_result* [ %578, %bb1.i.i2413 ], [ %results.16, %bb5.i2411 ] ; <%struct.one_result*> [#uses=2]
  %582 = getelementptr inbounds %struct.one_result* %581, i32 18, i32 0 ; <double*> [#uses=1]
  store double %572, double* %582, align 4
  %583 = getelementptr inbounds %struct.one_result* %581, i32 18, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str30, i32 0, i32 0), i8** %583, align 4
  %584 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i2384, label %bb5.i2395

bb.nph7.i2384:                                    ; preds = %_Z14test_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit
  %585 = shl i8 %554, 6                           ; <i8> [#uses=1]
  %586 = add i8 %553, %554                        ; <i8> [#uses=1]
  %587 = shl i8 %586, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2387

bb2.preheader.us.i2387:                           ; preds = %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i, %bb.nph7.i2384
  %i.06.us.i2385 = phi i32 [ 0, %bb.nph7.i2384 ], [ %tmp.i2386, %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2386 = add i32 %i.06.us.i2385, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2393

_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2394, %bb.i2.us.i2388
  %588 = icmp slt i32 %tmp.i2386, %iterations.0   ; <i1> [#uses=1]
  br i1 %588, label %bb2.preheader.us.i2387, label %bb5.i2395

bb.i2.us.i2388:                                   ; preds = %bb2.bb3_crit_edge.us.i2394
  %589 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 19) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i

bb1.us.i2393:                                     ; preds = %bb1.us.i2393, %bb2.preheader.us.i2387
  %result.04.us.i2389 = phi i8 [ 0, %bb2.preheader.us.i2387 ], [ %591, %bb1.us.i2393 ] ; <i8> [#uses=1]
  %n.03.us.i2390 = phi i32 [ 0, %bb2.preheader.us.i2387 ], [ %592, %bb1.us.i2393 ] ; <i32> [#uses=2]
  %scevgep.i2391 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.03.us.i2390 ; <i8*> [#uses=1]
  %590 = load i8* %scevgep.i2391, align 1         ; <i8> [#uses=1]
  %591 = add i8 %590, %result.04.us.i2389         ; <i8> [#uses=2]
  %592 = add nsw i32 %n.03.us.i2390, 1            ; <i32> [#uses=2]
  %exitcond.i2392 = icmp eq i32 %592, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2392, label %bb2.bb3_crit_edge.us.i2394, label %bb1.us.i2393

bb2.bb3_crit_edge.us.i2394:                       ; preds = %bb1.us.i2393
  %593 = add i8 %591, %585                        ; <i8> [#uses=1]
  %594 = icmp eq i8 %587, %593                    ; <i1> [#uses=1]
  br i1 %594, label %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i, label %bb.i2.us.i2388

bb5.i2395:                                        ; preds = %_Z26check_shifted_variable_sumIh19custom_add_variableIhEEvT_S2_.exit.us.i, %_Z14test_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit
  %595 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %596 = sub i32 %595, %584                       ; <i32> [#uses=1]
  %597 = sitofp i32 %596 to double                ; <double> [#uses=1]
  %598 = fdiv double %597, 1.000000e+06           ; <double> [#uses=1]
  %.not2762 = icmp ne %struct.one_result* %results.17, null ; <i1> [#uses=1]
  %599 = icmp sgt i32 %allocated_results.17, 19   ; <i1> [#uses=1]
  %or.cond2763 = and i1 %599, %.not2762           ; <i1> [#uses=1]
  br i1 %or.cond2763, label %_Z22test_hoisted_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit, label %bb1.i.i2397

bb1.i.i2397:                                      ; preds = %bb5.i2395
  %600 = add nsw i32 %allocated_results.17, 10    ; <i32> [#uses=3]
  %601 = mul i32 %600, 12                         ; <i32> [#uses=1]
  %602 = bitcast %struct.one_result* %results.17 to i8* ; <i8*> [#uses=1]
  %603 = tail call i8* @realloc(i8* %602, i32 %601) nounwind ; <i8*> [#uses=2]
  %604 = bitcast i8* %603 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %605 = icmp eq i8* %603, null                   ; <i1> [#uses=1]
  br i1 %605, label %bb2.i.i2398, label %_Z22test_hoisted_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit

bb2.i.i2398:                                      ; preds = %bb1.i.i2397
  %606 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %600) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2397, %bb5.i2395
  %results.18 = phi %struct.one_result* [ %604, %bb1.i.i2397 ], [ %results.17, %bb5.i2395 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.18 = phi i32 [ %600, %bb1.i.i2397 ], [ %allocated_results.17, %bb5.i2395 ] ; <i32> [#uses=3]
  %607 = phi %struct.one_result* [ %604, %bb1.i.i2397 ], [ %results.17, %bb5.i2395 ] ; <%struct.one_result*> [#uses=2]
  %608 = getelementptr inbounds %struct.one_result* %607, i32 19, i32 0 ; <double*> [#uses=1]
  store double %598, double* %608, align 4
  %609 = getelementptr inbounds %struct.one_result* %607, i32 19, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i8** %609, align 4
  %610 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2369, label %bb5.i2380

bb.nph6.i2369:                                    ; preds = %_Z22test_hoisted_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit
  %611 = add i8 %555, %554                        ; <i8> [#uses=1]
  %612 = add i8 %611, %556                        ; <i8> [#uses=1]
  %613 = add i8 %612, %558                        ; <i8> [#uses=2]
  %614 = add i8 %613, %553                        ; <i8> [#uses=1]
  %615 = shl i8 %614, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2372

bb2.preheader.us.i2372:                           ; preds = %_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2369
  %i.05.us.i2370 = phi i32 [ 0, %bb.nph6.i2369 ], [ %tmp.i2371, %_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2371 = add i32 %i.05.us.i2370, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2378

_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2379, %bb.i1.us.i2373
  %616 = icmp slt i32 %tmp.i2371, %iterations.0   ; <i1> [#uses=1]
  br i1 %616, label %bb2.preheader.us.i2372, label %bb5.i2380

bb.i1.us.i2373:                                   ; preds = %bb2.bb3_crit_edge.us.i2379
  %617 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 20) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2378:                                     ; preds = %bb1.us.i2378, %bb2.preheader.us.i2372
  %result.03.us.i2374 = phi i8 [ 0, %bb2.preheader.us.i2372 ], [ %620, %bb1.us.i2378 ] ; <i8> [#uses=1]
  %n.02.us.i2375 = phi i32 [ 0, %bb2.preheader.us.i2372 ], [ %621, %bb1.us.i2378 ] ; <i32> [#uses=2]
  %scevgep.i2376 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2375 ; <i8*> [#uses=1]
  %618 = load i8* %scevgep.i2376, align 1         ; <i8> [#uses=1]
  %619 = add i8 %613, %result.03.us.i2374         ; <i8> [#uses=1]
  %620 = add i8 %619, %618                        ; <i8> [#uses=2]
  %621 = add nsw i32 %n.02.us.i2375, 1            ; <i32> [#uses=2]
  %exitcond.i2377 = icmp eq i32 %621, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2377, label %bb2.bb3_crit_edge.us.i2379, label %bb1.us.i2378

bb2.bb3_crit_edge.us.i2379:                       ; preds = %bb1.us.i2378
  %622 = icmp eq i8 %615, %620                    ; <i1> [#uses=1]
  br i1 %622, label %_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2373

bb5.i2380:                                        ; preds = %_Z26check_shifted_variable_sumIh28custom_add_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Ih19custom_add_variableIhEEvPT_iS2_PKc.exit
  %623 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %624 = sub i32 %623, %610                       ; <i32> [#uses=1]
  %625 = sitofp i32 %624 to double                ; <double> [#uses=1]
  %626 = fdiv double %625, 1.000000e+06           ; <double> [#uses=1]
  %.not2764 = icmp ne %struct.one_result* %results.18, null ; <i1> [#uses=1]
  %627 = icmp sgt i32 %allocated_results.18, 20   ; <i1> [#uses=1]
  %or.cond2765 = and i1 %627, %.not2764           ; <i1> [#uses=1]
  br i1 %or.cond2765, label %_Z14test_variable4Ih28custom_add_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2382

bb1.i.i2382:                                      ; preds = %bb5.i2380
  %628 = add nsw i32 %allocated_results.18, 10    ; <i32> [#uses=3]
  %629 = mul i32 %628, 12                         ; <i32> [#uses=1]
  %630 = bitcast %struct.one_result* %results.18 to i8* ; <i8*> [#uses=1]
  %631 = tail call i8* @realloc(i8* %630, i32 %629) nounwind ; <i8*> [#uses=2]
  %632 = bitcast i8* %631 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %633 = icmp eq i8* %631, null                   ; <i1> [#uses=1]
  br i1 %633, label %bb2.i.i2383, label %_Z14test_variable4Ih28custom_add_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2383:                                      ; preds = %bb1.i.i2382
  %634 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %628) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih28custom_add_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2382, %bb5.i2380
  %results.19 = phi %struct.one_result* [ %632, %bb1.i.i2382 ], [ %results.18, %bb5.i2380 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.19 = phi i32 [ %628, %bb1.i.i2382 ], [ %allocated_results.18, %bb5.i2380 ] ; <i32> [#uses=3]
  %635 = phi %struct.one_result* [ %632, %bb1.i.i2382 ], [ %results.18, %bb5.i2380 ] ; <%struct.one_result*> [#uses=2]
  %636 = getelementptr inbounds %struct.one_result* %635, i32 20, i32 0 ; <double*> [#uses=1]
  store double %626, double* %636, align 4
  %637 = getelementptr inbounds %struct.one_result* %635, i32 20, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str32, i32 0, i32 0), i8** %637, align 4
  %638 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2354, label %bb5.i2365

bb.nph6.i2354:                                    ; preds = %_Z14test_variable4Ih28custom_add_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %639 = sub i8 %553, %554                        ; <i8> [#uses=1]
  %640 = shl i8 %639, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2357

bb2.preheader.us.i2357:                           ; preds = %_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i, %bb.nph6.i2354
  %i.05.us.i2355 = phi i32 [ 0, %bb.nph6.i2354 ], [ %tmp.i2356, %_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2356 = add i32 %i.05.us.i2355, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2363

_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2364, %bb.i1.us.i2358
  %641 = icmp slt i32 %tmp.i2356, %iterations.0   ; <i1> [#uses=1]
  br i1 %641, label %bb2.preheader.us.i2357, label %bb5.i2365

bb.i1.us.i2358:                                   ; preds = %bb2.bb3_crit_edge.us.i2364
  %642 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 21) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i

bb1.us.i2363:                                     ; preds = %bb1.us.i2363, %bb2.preheader.us.i2357
  %result.03.us.i2359 = phi i8 [ 0, %bb2.preheader.us.i2357 ], [ %645, %bb1.us.i2363 ] ; <i8> [#uses=1]
  %n.02.us.i2360 = phi i32 [ 0, %bb2.preheader.us.i2357 ], [ %646, %bb1.us.i2363 ] ; <i32> [#uses=2]
  %scevgep.i2361 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2360 ; <i8*> [#uses=1]
  %643 = load i8* %scevgep.i2361, align 1         ; <i8> [#uses=1]
  %644 = sub i8 %result.03.us.i2359, %554         ; <i8> [#uses=1]
  %645 = add i8 %644, %643                        ; <i8> [#uses=2]
  %646 = add nsw i32 %n.02.us.i2360, 1            ; <i32> [#uses=2]
  %exitcond.i2362 = icmp eq i32 %646, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2362, label %bb2.bb3_crit_edge.us.i2364, label %bb1.us.i2363

bb2.bb3_crit_edge.us.i2364:                       ; preds = %bb1.us.i2363
  %647 = icmp eq i8 %640, %645                    ; <i1> [#uses=1]
  br i1 %647, label %_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2358

bb5.i2365:                                        ; preds = %_Z26check_shifted_variable_sumIh19custom_sub_variableIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih28custom_add_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %648 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %649 = sub i32 %648, %638                       ; <i32> [#uses=1]
  %650 = sitofp i32 %649 to double                ; <double> [#uses=1]
  %651 = fdiv double %650, 1.000000e+06           ; <double> [#uses=1]
  %.not2766 = icmp ne %struct.one_result* %results.19, null ; <i1> [#uses=1]
  %652 = icmp sgt i32 %allocated_results.19, 21   ; <i1> [#uses=1]
  %or.cond2767 = and i1 %652, %.not2766           ; <i1> [#uses=1]
  br i1 %or.cond2767, label %_Z14test_variable1Ih19custom_sub_variableIhEEvPT_iS2_PKc.exit, label %bb1.i.i2367

bb1.i.i2367:                                      ; preds = %bb5.i2365
  %653 = add nsw i32 %allocated_results.19, 10    ; <i32> [#uses=3]
  %654 = mul i32 %653, 12                         ; <i32> [#uses=1]
  %655 = bitcast %struct.one_result* %results.19 to i8* ; <i8*> [#uses=1]
  %656 = tail call i8* @realloc(i8* %655, i32 %654) nounwind ; <i8*> [#uses=2]
  %657 = bitcast i8* %656 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %658 = icmp eq i8* %656, null                   ; <i1> [#uses=1]
  br i1 %658, label %bb2.i.i2368, label %_Z14test_variable1Ih19custom_sub_variableIhEEvPT_iS2_PKc.exit

bb2.i.i2368:                                      ; preds = %bb1.i.i2367
  %659 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %653) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih19custom_sub_variableIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2367, %bb5.i2365
  %results.20 = phi %struct.one_result* [ %657, %bb1.i.i2367 ], [ %results.19, %bb5.i2365 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.20 = phi i32 [ %653, %bb1.i.i2367 ], [ %allocated_results.19, %bb5.i2365 ] ; <i32> [#uses=3]
  %660 = phi %struct.one_result* [ %657, %bb1.i.i2367 ], [ %results.19, %bb5.i2365 ] ; <%struct.one_result*> [#uses=2]
  %661 = getelementptr inbounds %struct.one_result* %660, i32 21, i32 0 ; <double*> [#uses=1]
  store double %651, double* %661, align 4
  %662 = getelementptr inbounds %struct.one_result* %660, i32 21, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str33, i32 0, i32 0), i8** %662, align 4
  %663 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i2339, label %bb5.i2350

bb.nph8.i2339:                                    ; preds = %_Z14test_variable1Ih19custom_sub_variableIhEEvPT_iS2_PKc.exit
  %sum9.i2337 = add i8 %555, %554                 ; <i8> [#uses=2]
  %664 = sub i8 0, %sum9.i2337                    ; <i8> [#uses=1]
  %665 = sub i8 %664, %556                        ; <i8> [#uses=1]
  %666 = sub i8 %665, %558                        ; <i8> [#uses=1]
  %sum.i2338 = add i8 %sum9.i2337, %556           ; <i8> [#uses=1]
  %667 = sub i8 0, %sum.i2338                     ; <i8> [#uses=1]
  %668 = sub i8 %667, %558                        ; <i8> [#uses=1]
  %669 = add i8 %668, %553                        ; <i8> [#uses=1]
  %670 = shl i8 %669, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2342

bb2.preheader.us.i2342:                           ; preds = %_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i2339
  %i.07.us.i2340 = phi i32 [ 0, %bb.nph8.i2339 ], [ %tmp.i2341, %_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2341 = add i32 %i.07.us.i2340, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2348

_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2349, %bb.i1.us.i2343
  %671 = icmp slt i32 %tmp.i2341, %iterations.0   ; <i1> [#uses=1]
  br i1 %671, label %bb2.preheader.us.i2342, label %bb5.i2350

bb.i1.us.i2343:                                   ; preds = %bb2.bb3_crit_edge.us.i2349
  %672 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 22) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2348:                                     ; preds = %bb1.us.i2348, %bb2.preheader.us.i2342
  %result.05.us.i2344 = phi i8 [ 0, %bb2.preheader.us.i2342 ], [ %675, %bb1.us.i2348 ] ; <i8> [#uses=1]
  %n.04.us.i2345 = phi i32 [ 0, %bb2.preheader.us.i2342 ], [ %676, %bb1.us.i2348 ] ; <i32> [#uses=2]
  %scevgep.i2346 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.04.us.i2345 ; <i8*> [#uses=1]
  %673 = load i8* %scevgep.i2346, align 1         ; <i8> [#uses=1]
  %674 = add i8 %666, %result.05.us.i2344         ; <i8> [#uses=1]
  %675 = add i8 %674, %673                        ; <i8> [#uses=2]
  %676 = add nsw i32 %n.04.us.i2345, 1            ; <i32> [#uses=2]
  %exitcond.i2347 = icmp eq i32 %676, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2347, label %bb2.bb3_crit_edge.us.i2349, label %bb1.us.i2348

bb2.bb3_crit_edge.us.i2349:                       ; preds = %bb1.us.i2348
  %677 = icmp eq i8 %670, %675                    ; <i1> [#uses=1]
  br i1 %677, label %_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2343

bb5.i2350:                                        ; preds = %_Z26check_shifted_variable_sumIh28custom_sub_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih19custom_sub_variableIhEEvPT_iS2_PKc.exit
  %678 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %679 = sub i32 %678, %663                       ; <i32> [#uses=1]
  %680 = sitofp i32 %679 to double                ; <double> [#uses=1]
  %681 = fdiv double %680, 1.000000e+06           ; <double> [#uses=1]
  %.not2768 = icmp ne %struct.one_result* %results.20, null ; <i1> [#uses=1]
  %682 = icmp sgt i32 %allocated_results.20, 22   ; <i1> [#uses=1]
  %or.cond2769 = and i1 %682, %.not2768           ; <i1> [#uses=1]
  br i1 %or.cond2769, label %_Z14test_variable4Ih28custom_sub_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2352

bb1.i.i2352:                                      ; preds = %bb5.i2350
  %683 = add nsw i32 %allocated_results.20, 10    ; <i32> [#uses=3]
  %684 = mul i32 %683, 12                         ; <i32> [#uses=1]
  %685 = bitcast %struct.one_result* %results.20 to i8* ; <i8*> [#uses=1]
  %686 = tail call i8* @realloc(i8* %685, i32 %684) nounwind ; <i8*> [#uses=2]
  %687 = bitcast i8* %686 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %688 = icmp eq i8* %686, null                   ; <i1> [#uses=1]
  br i1 %688, label %bb2.i.i2353, label %_Z14test_variable4Ih28custom_sub_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2353:                                      ; preds = %bb1.i.i2352
  %689 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %683) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih28custom_sub_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2352, %bb5.i2350
  %results.21 = phi %struct.one_result* [ %687, %bb1.i.i2352 ], [ %results.20, %bb5.i2350 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.21 = phi i32 [ %683, %bb1.i.i2352 ], [ %allocated_results.20, %bb5.i2350 ] ; <i32> [#uses=3]
  %690 = phi %struct.one_result* [ %687, %bb1.i.i2352 ], [ %results.20, %bb5.i2350 ] ; <%struct.one_result*> [#uses=2]
  %691 = getelementptr inbounds %struct.one_result* %690, i32 22, i32 0 ; <double*> [#uses=1]
  store double %681, double* %691, align 4
  %692 = getelementptr inbounds %struct.one_result* %690, i32 22, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str34, i32 0, i32 0), i8** %692, align 4
  %693 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2322, label %bb5.i2333

bb.nph6.i2322:                                    ; preds = %_Z14test_variable4Ih28custom_sub_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %694 = shl i8 %554, 6                           ; <i8> [#uses=1]
  %695 = mul i8 %694, %553                        ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2325

bb2.preheader.us.i2325:                           ; preds = %_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i, %bb.nph6.i2322
  %i.05.us.i2323 = phi i32 [ 0, %bb.nph6.i2322 ], [ %tmp.i2324, %_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2324 = add i32 %i.05.us.i2323, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2331

_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2332, %bb.i1.us.i2326
  %696 = icmp slt i32 %tmp.i2324, %iterations.0   ; <i1> [#uses=1]
  br i1 %696, label %bb2.preheader.us.i2325, label %bb5.i2333

bb.i1.us.i2326:                                   ; preds = %bb2.bb3_crit_edge.us.i2332
  %697 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 23) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i

bb1.us.i2331:                                     ; preds = %bb1.us.i2331, %bb2.preheader.us.i2325
  %result.03.us.i2327 = phi i8 [ 0, %bb2.preheader.us.i2325 ], [ %700, %bb1.us.i2331 ] ; <i8> [#uses=1]
  %n.02.us.i2328 = phi i32 [ 0, %bb2.preheader.us.i2325 ], [ %701, %bb1.us.i2331 ] ; <i32> [#uses=2]
  %scevgep.i2329 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2328 ; <i8*> [#uses=1]
  %698 = load i8* %scevgep.i2329, align 1         ; <i8> [#uses=1]
  %699 = mul i8 %698, %554                        ; <i8> [#uses=1]
  %700 = add i8 %699, %result.03.us.i2327         ; <i8> [#uses=2]
  %701 = add nsw i32 %n.02.us.i2328, 1            ; <i32> [#uses=2]
  %exitcond.i2330 = icmp eq i32 %701, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2330, label %bb2.bb3_crit_edge.us.i2332, label %bb1.us.i2331

bb2.bb3_crit_edge.us.i2332:                       ; preds = %bb1.us.i2331
  %702 = icmp eq i8 %695, %700                    ; <i1> [#uses=1]
  br i1 %702, label %_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2326

bb5.i2333:                                        ; preds = %_Z26check_shifted_variable_sumIh24custom_multiply_variableIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih28custom_sub_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %703 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %704 = sub i32 %703, %693                       ; <i32> [#uses=1]
  %705 = sitofp i32 %704 to double                ; <double> [#uses=1]
  %706 = fdiv double %705, 1.000000e+06           ; <double> [#uses=1]
  %.not2770 = icmp ne %struct.one_result* %results.21, null ; <i1> [#uses=1]
  %707 = icmp sgt i32 %allocated_results.21, 23   ; <i1> [#uses=1]
  %or.cond2771 = and i1 %707, %.not2770           ; <i1> [#uses=1]
  br i1 %or.cond2771, label %_Z14test_variable1Ih24custom_multiply_variableIhEEvPT_iS2_PKc.exit, label %bb1.i.i2335

bb1.i.i2335:                                      ; preds = %bb5.i2333
  %708 = add nsw i32 %allocated_results.21, 10    ; <i32> [#uses=3]
  %709 = mul i32 %708, 12                         ; <i32> [#uses=1]
  %710 = bitcast %struct.one_result* %results.21 to i8* ; <i8*> [#uses=1]
  %711 = tail call i8* @realloc(i8* %710, i32 %709) nounwind ; <i8*> [#uses=2]
  %712 = bitcast i8* %711 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %713 = icmp eq i8* %711, null                   ; <i1> [#uses=1]
  br i1 %713, label %bb2.i.i2336, label %_Z14test_variable1Ih24custom_multiply_variableIhEEvPT_iS2_PKc.exit

bb2.i.i2336:                                      ; preds = %bb1.i.i2335
  %714 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %708) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih24custom_multiply_variableIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2335, %bb5.i2333
  %results.22 = phi %struct.one_result* [ %712, %bb1.i.i2335 ], [ %results.21, %bb5.i2333 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.22 = phi i32 [ %708, %bb1.i.i2335 ], [ %allocated_results.21, %bb5.i2333 ] ; <i32> [#uses=3]
  %715 = phi %struct.one_result* [ %712, %bb1.i.i2335 ], [ %results.21, %bb5.i2333 ] ; <%struct.one_result*> [#uses=2]
  %716 = getelementptr inbounds %struct.one_result* %715, i32 23, i32 0 ; <double*> [#uses=1]
  store double %706, double* %716, align 4
  %717 = getelementptr inbounds %struct.one_result* %715, i32 23, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str35, i32 0, i32 0), i8** %717, align 4
  %718 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2307, label %bb5.i2318

bb.nph6.i2307:                                    ; preds = %_Z14test_variable1Ih24custom_multiply_variableIhEEvPT_iS2_PKc.exit
  %719 = mul i8 %555, %554                        ; <i8> [#uses=1]
  %720 = mul i8 %719, %556                        ; <i8> [#uses=1]
  %721 = mul i8 %720, %558                        ; <i8> [#uses=1]
  %722 = shl i8 %554, 6                           ; <i8> [#uses=1]
  %723 = mul i8 %722, %555                        ; <i8> [#uses=1]
  %724 = mul i8 %723, %556                        ; <i8> [#uses=1]
  %725 = mul i8 %724, %558                        ; <i8> [#uses=1]
  %726 = mul i8 %725, %553                        ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2310

bb2.preheader.us.i2310:                           ; preds = %_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2307
  %i.05.us.i2308 = phi i32 [ 0, %bb.nph6.i2307 ], [ %tmp.i2309, %_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2309 = add i32 %i.05.us.i2308, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2316

_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2317, %bb.i1.us.i2311
  %727 = icmp slt i32 %tmp.i2309, %iterations.0   ; <i1> [#uses=1]
  br i1 %727, label %bb2.preheader.us.i2310, label %bb5.i2318

bb.i1.us.i2311:                                   ; preds = %bb2.bb3_crit_edge.us.i2317
  %728 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 24) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2316:                                     ; preds = %bb1.us.i2316, %bb2.preheader.us.i2310
  %result.03.us.i2312 = phi i8 [ 0, %bb2.preheader.us.i2310 ], [ %731, %bb1.us.i2316 ] ; <i8> [#uses=1]
  %n.02.us.i2313 = phi i32 [ 0, %bb2.preheader.us.i2310 ], [ %732, %bb1.us.i2316 ] ; <i32> [#uses=2]
  %scevgep.i2314 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2313 ; <i8*> [#uses=1]
  %729 = load i8* %scevgep.i2314, align 1         ; <i8> [#uses=1]
  %730 = mul i8 %721, %729                        ; <i8> [#uses=1]
  %731 = add i8 %730, %result.03.us.i2312         ; <i8> [#uses=2]
  %732 = add nsw i32 %n.02.us.i2313, 1            ; <i32> [#uses=2]
  %exitcond.i2315 = icmp eq i32 %732, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2315, label %bb2.bb3_crit_edge.us.i2317, label %bb1.us.i2316

bb2.bb3_crit_edge.us.i2317:                       ; preds = %bb1.us.i2316
  %733 = icmp eq i8 %726, %731                    ; <i1> [#uses=1]
  br i1 %733, label %_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2311

bb5.i2318:                                        ; preds = %_Z26check_shifted_variable_sumIh33custom_multiply_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih24custom_multiply_variableIhEEvPT_iS2_PKc.exit
  %734 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %735 = sub i32 %734, %718                       ; <i32> [#uses=1]
  %736 = sitofp i32 %735 to double                ; <double> [#uses=1]
  %737 = fdiv double %736, 1.000000e+06           ; <double> [#uses=1]
  %.not2772 = icmp ne %struct.one_result* %results.22, null ; <i1> [#uses=1]
  %738 = icmp sgt i32 %allocated_results.22, 24   ; <i1> [#uses=1]
  %or.cond2773 = and i1 %738, %.not2772           ; <i1> [#uses=1]
  br i1 %or.cond2773, label %_Z14test_variable4Ih33custom_multiply_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2320

bb1.i.i2320:                                      ; preds = %bb5.i2318
  %739 = add nsw i32 %allocated_results.22, 10    ; <i32> [#uses=3]
  %740 = mul i32 %739, 12                         ; <i32> [#uses=1]
  %741 = bitcast %struct.one_result* %results.22 to i8* ; <i8*> [#uses=1]
  %742 = tail call i8* @realloc(i8* %741, i32 %740) nounwind ; <i8*> [#uses=2]
  %743 = bitcast i8* %742 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %744 = icmp eq i8* %742, null                   ; <i1> [#uses=1]
  br i1 %744, label %bb2.i.i2321, label %_Z14test_variable4Ih33custom_multiply_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2321:                                      ; preds = %bb1.i.i2320
  %745 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %739) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih33custom_multiply_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2320, %bb5.i2318
  %results.23 = phi %struct.one_result* [ %743, %bb1.i.i2320 ], [ %results.22, %bb5.i2318 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.23 = phi i32 [ %739, %bb1.i.i2320 ], [ %allocated_results.22, %bb5.i2318 ] ; <i32> [#uses=3]
  %746 = phi %struct.one_result* [ %743, %bb1.i.i2320 ], [ %results.22, %bb5.i2318 ] ; <%struct.one_result*> [#uses=2]
  %747 = getelementptr inbounds %struct.one_result* %746, i32 24, i32 0 ; <double*> [#uses=1]
  store double %737, double* %747, align 4
  %748 = getelementptr inbounds %struct.one_result* %746, i32 24, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str36, i32 0, i32 0), i8** %748, align 4
  %749 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2292, label %bb5.i2303

bb.nph6.i2292:                                    ; preds = %_Z14test_variable4Ih33custom_multiply_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %750 = mul i8 %555, %554                        ; <i8> [#uses=1]
  %751 = mul i8 %750, %556                        ; <i8> [#uses=1]
  %752 = mul i8 %751, %558                        ; <i8> [#uses=2]
  %753 = add i8 %553, %752                        ; <i8> [#uses=1]
  %754 = shl i8 %753, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2295

bb2.preheader.us.i2295:                           ; preds = %_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2292
  %i.05.us.i2293 = phi i32 [ 0, %bb.nph6.i2292 ], [ %tmp.i2294, %_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2294 = add i32 %i.05.us.i2293, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2301

_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2302, %bb.i1.us.i2296
  %755 = icmp slt i32 %tmp.i2294, %iterations.0   ; <i1> [#uses=1]
  br i1 %755, label %bb2.preheader.us.i2295, label %bb5.i2303

bb.i1.us.i2296:                                   ; preds = %bb2.bb3_crit_edge.us.i2302
  %756 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 25) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2301:                                     ; preds = %bb1.us.i2301, %bb2.preheader.us.i2295
  %result.03.us.i2297 = phi i8 [ 0, %bb2.preheader.us.i2295 ], [ %759, %bb1.us.i2301 ] ; <i8> [#uses=1]
  %n.02.us.i2298 = phi i32 [ 0, %bb2.preheader.us.i2295 ], [ %760, %bb1.us.i2301 ] ; <i32> [#uses=2]
  %scevgep.i2299 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2298 ; <i8*> [#uses=1]
  %757 = load i8* %scevgep.i2299, align 1         ; <i8> [#uses=1]
  %758 = add i8 %result.03.us.i2297, %752         ; <i8> [#uses=1]
  %759 = add i8 %758, %757                        ; <i8> [#uses=2]
  %760 = add nsw i32 %n.02.us.i2298, 1            ; <i32> [#uses=2]
  %exitcond.i2300 = icmp eq i32 %760, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2300, label %bb2.bb3_crit_edge.us.i2302, label %bb1.us.i2301

bb2.bb3_crit_edge.us.i2302:                       ; preds = %bb1.us.i2301
  %761 = icmp eq i8 %754, %759                    ; <i1> [#uses=1]
  br i1 %761, label %_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2296

bb5.i2303:                                        ; preds = %_Z26check_shifted_variable_sumIh34custom_multiply_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ih33custom_multiply_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %762 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %763 = sub i32 %762, %749                       ; <i32> [#uses=1]
  %764 = sitofp i32 %763 to double                ; <double> [#uses=1]
  %765 = fdiv double %764, 1.000000e+06           ; <double> [#uses=1]
  %.not2774 = icmp ne %struct.one_result* %results.23, null ; <i1> [#uses=1]
  %766 = icmp sgt i32 %allocated_results.23, 25   ; <i1> [#uses=1]
  %or.cond2775 = and i1 %766, %.not2774           ; <i1> [#uses=1]
  br i1 %or.cond2775, label %_Z14test_variable4Ih34custom_multiply_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2305

bb1.i.i2305:                                      ; preds = %bb5.i2303
  %767 = add nsw i32 %allocated_results.23, 10    ; <i32> [#uses=3]
  %768 = mul i32 %767, 12                         ; <i32> [#uses=1]
  %769 = bitcast %struct.one_result* %results.23 to i8* ; <i8*> [#uses=1]
  %770 = tail call i8* @realloc(i8* %769, i32 %768) nounwind ; <i8*> [#uses=2]
  %771 = bitcast i8* %770 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %772 = icmp eq i8* %770, null                   ; <i1> [#uses=1]
  br i1 %772, label %bb2.i.i2306, label %_Z14test_variable4Ih34custom_multiply_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2306:                                      ; preds = %bb1.i.i2305
  %773 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %767) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih34custom_multiply_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2305, %bb5.i2303
  %results.24 = phi %struct.one_result* [ %771, %bb1.i.i2305 ], [ %results.23, %bb5.i2303 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.24 = phi i32 [ %767, %bb1.i.i2305 ], [ %allocated_results.23, %bb5.i2303 ] ; <i32> [#uses=3]
  %774 = phi %struct.one_result* [ %771, %bb1.i.i2305 ], [ %results.23, %bb5.i2303 ] ; <%struct.one_result*> [#uses=2]
  %775 = getelementptr inbounds %struct.one_result* %774, i32 25, i32 0 ; <double*> [#uses=1]
  store double %765, double* %775, align 4
  %776 = getelementptr inbounds %struct.one_result* %774, i32 25, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str37, i32 0, i32 0), i8** %776, align 4
  %777 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2277, label %bb5.i2288

bb.nph6.i2277:                                    ; preds = %_Z14test_variable4Ih34custom_multiply_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit
  %778 = udiv i8 %553, %554                       ; <i8> [#uses=1]
  %779 = shl i8 %778, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2280

bb2.preheader.us.i2280:                           ; preds = %_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i, %bb.nph6.i2277
  %i.05.us.i2278 = phi i32 [ 0, %bb.nph6.i2277 ], [ %tmp.i2279, %_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2279 = add i32 %i.05.us.i2278, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2286

_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2287, %bb.i1.us.i2281
  %780 = icmp slt i32 %tmp.i2279, %iterations.0   ; <i1> [#uses=1]
  br i1 %780, label %bb2.preheader.us.i2280, label %bb5.i2288

bb.i1.us.i2281:                                   ; preds = %bb2.bb3_crit_edge.us.i2287
  %781 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 26) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i

bb1.us.i2286:                                     ; preds = %bb1.us.i2286, %bb2.preheader.us.i2280
  %result.03.us.i2282 = phi i8 [ 0, %bb2.preheader.us.i2280 ], [ %784, %bb1.us.i2286 ] ; <i8> [#uses=1]
  %n.02.us.i2283 = phi i32 [ 0, %bb2.preheader.us.i2280 ], [ %785, %bb1.us.i2286 ] ; <i32> [#uses=2]
  %scevgep.i2284 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2283 ; <i8*> [#uses=1]
  %782 = load i8* %scevgep.i2284, align 1         ; <i8> [#uses=1]
  %783 = udiv i8 %782, %554                       ; <i8> [#uses=1]
  %784 = add i8 %783, %result.03.us.i2282         ; <i8> [#uses=2]
  %785 = add nsw i32 %n.02.us.i2283, 1            ; <i32> [#uses=2]
  %exitcond.i2285 = icmp eq i32 %785, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2285, label %bb2.bb3_crit_edge.us.i2287, label %bb1.us.i2286

bb2.bb3_crit_edge.us.i2287:                       ; preds = %bb1.us.i2286
  %786 = icmp eq i8 %779, %784                    ; <i1> [#uses=1]
  br i1 %786, label %_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2281

bb5.i2288:                                        ; preds = %_Z26check_shifted_variable_sumIh22custom_divide_variableIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih34custom_multiply_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit
  %787 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %788 = sub i32 %787, %777                       ; <i32> [#uses=1]
  %789 = sitofp i32 %788 to double                ; <double> [#uses=1]
  %790 = fdiv double %789, 1.000000e+06           ; <double> [#uses=1]
  %.not2776 = icmp ne %struct.one_result* %results.24, null ; <i1> [#uses=1]
  %791 = icmp sgt i32 %allocated_results.24, 26   ; <i1> [#uses=1]
  %or.cond2777 = and i1 %791, %.not2776           ; <i1> [#uses=1]
  br i1 %or.cond2777, label %_Z14test_variable1Ih22custom_divide_variableIhEEvPT_iS2_PKc.exit, label %bb1.i.i2290

bb1.i.i2290:                                      ; preds = %bb5.i2288
  %792 = add nsw i32 %allocated_results.24, 10    ; <i32> [#uses=3]
  %793 = mul i32 %792, 12                         ; <i32> [#uses=1]
  %794 = bitcast %struct.one_result* %results.24 to i8* ; <i8*> [#uses=1]
  %795 = tail call i8* @realloc(i8* %794, i32 %793) nounwind ; <i8*> [#uses=2]
  %796 = bitcast i8* %795 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %797 = icmp eq i8* %795, null                   ; <i1> [#uses=1]
  br i1 %797, label %bb2.i.i2291, label %_Z14test_variable1Ih22custom_divide_variableIhEEvPT_iS2_PKc.exit

bb2.i.i2291:                                      ; preds = %bb1.i.i2290
  %798 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %792) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih22custom_divide_variableIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2290, %bb5.i2288
  %results.25 = phi %struct.one_result* [ %796, %bb1.i.i2290 ], [ %results.24, %bb5.i2288 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.25 = phi i32 [ %792, %bb1.i.i2290 ], [ %allocated_results.24, %bb5.i2288 ] ; <i32> [#uses=3]
  %799 = phi %struct.one_result* [ %796, %bb1.i.i2290 ], [ %results.24, %bb5.i2288 ] ; <%struct.one_result*> [#uses=2]
  %800 = getelementptr inbounds %struct.one_result* %799, i32 26, i32 0 ; <double*> [#uses=1]
  store double %790, double* %800, align 4
  %801 = getelementptr inbounds %struct.one_result* %799, i32 26, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str38, i32 0, i32 0), i8** %801, align 4
  %802 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2262, label %bb5.i2273

bb.nph6.i2262:                                    ; preds = %_Z14test_variable1Ih22custom_divide_variableIhEEvPT_iS2_PKc.exit
  %803 = udiv i8 %553, %554                       ; <i8> [#uses=1]
  %804 = udiv i8 %803, %555                       ; <i8> [#uses=1]
  %805 = udiv i8 %804, %556                       ; <i8> [#uses=1]
  %806 = udiv i8 %805, %558                       ; <i8> [#uses=1]
  %807 = shl i8 %806, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2265

bb2.preheader.us.i2265:                           ; preds = %_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2262
  %i.05.us.i2263 = phi i32 [ 0, %bb.nph6.i2262 ], [ %tmp.i2264, %_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2264 = add i32 %i.05.us.i2263, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2271

_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2272, %bb.i1.us.i2266
  %808 = icmp slt i32 %tmp.i2264, %iterations.0   ; <i1> [#uses=1]
  br i1 %808, label %bb2.preheader.us.i2265, label %bb5.i2273

bb.i1.us.i2266:                                   ; preds = %bb2.bb3_crit_edge.us.i2272
  %809 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 27) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2271:                                     ; preds = %bb1.us.i2271, %bb2.preheader.us.i2265
  %result.03.us.i2267 = phi i8 [ 0, %bb2.preheader.us.i2265 ], [ %815, %bb1.us.i2271 ] ; <i8> [#uses=1]
  %n.02.us.i2268 = phi i32 [ 0, %bb2.preheader.us.i2265 ], [ %816, %bb1.us.i2271 ] ; <i32> [#uses=2]
  %scevgep.i2269 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2268 ; <i8*> [#uses=1]
  %810 = load i8* %scevgep.i2269, align 1         ; <i8> [#uses=1]
  %811 = udiv i8 %810, %554                       ; <i8> [#uses=1]
  %812 = udiv i8 %811, %555                       ; <i8> [#uses=1]
  %813 = udiv i8 %812, %556                       ; <i8> [#uses=1]
  %814 = udiv i8 %813, %558                       ; <i8> [#uses=1]
  %815 = add i8 %814, %result.03.us.i2267         ; <i8> [#uses=2]
  %816 = add nsw i32 %n.02.us.i2268, 1            ; <i32> [#uses=2]
  %exitcond.i2270 = icmp eq i32 %816, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2270, label %bb2.bb3_crit_edge.us.i2272, label %bb1.us.i2271

bb2.bb3_crit_edge.us.i2272:                       ; preds = %bb1.us.i2271
  %817 = icmp eq i8 %807, %815                    ; <i1> [#uses=1]
  br i1 %817, label %_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2266

bb5.i2273:                                        ; preds = %_Z26check_shifted_variable_sumIh31custom_divide_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih22custom_divide_variableIhEEvPT_iS2_PKc.exit
  %818 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %819 = sub i32 %818, %802                       ; <i32> [#uses=1]
  %820 = sitofp i32 %819 to double                ; <double> [#uses=1]
  %821 = fdiv double %820, 1.000000e+06           ; <double> [#uses=1]
  %.not2778 = icmp ne %struct.one_result* %results.25, null ; <i1> [#uses=1]
  %822 = icmp sgt i32 %allocated_results.25, 27   ; <i1> [#uses=1]
  %or.cond2779 = and i1 %822, %.not2778           ; <i1> [#uses=1]
  br i1 %or.cond2779, label %_Z14test_variable4Ih31custom_divide_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2275

bb1.i.i2275:                                      ; preds = %bb5.i2273
  %823 = add nsw i32 %allocated_results.25, 10    ; <i32> [#uses=3]
  %824 = mul i32 %823, 12                         ; <i32> [#uses=1]
  %825 = bitcast %struct.one_result* %results.25 to i8* ; <i8*> [#uses=1]
  %826 = tail call i8* @realloc(i8* %825, i32 %824) nounwind ; <i8*> [#uses=2]
  %827 = bitcast i8* %826 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %828 = icmp eq i8* %826, null                   ; <i1> [#uses=1]
  br i1 %828, label %bb2.i.i2276, label %_Z14test_variable4Ih31custom_divide_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2276:                                      ; preds = %bb1.i.i2275
  %829 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %823) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih31custom_divide_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2275, %bb5.i2273
  %results.26 = phi %struct.one_result* [ %827, %bb1.i.i2275 ], [ %results.25, %bb5.i2273 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.26 = phi i32 [ %823, %bb1.i.i2275 ], [ %allocated_results.25, %bb5.i2273 ] ; <i32> [#uses=3]
  %830 = phi %struct.one_result* [ %827, %bb1.i.i2275 ], [ %results.25, %bb5.i2273 ] ; <%struct.one_result*> [#uses=2]
  %831 = getelementptr inbounds %struct.one_result* %830, i32 27, i32 0 ; <double*> [#uses=1]
  store double %821, double* %831, align 4
  %832 = getelementptr inbounds %struct.one_result* %830, i32 27, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str39, i32 0, i32 0), i8** %832, align 4
  %833 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2247, label %bb5.i2258

bb.nph6.i2247:                                    ; preds = %_Z14test_variable4Ih31custom_divide_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %834 = udiv i8 %554, %555                       ; <i8> [#uses=1]
  %835 = udiv i8 %834, %556                       ; <i8> [#uses=1]
  %836 = udiv i8 %835, %558                       ; <i8> [#uses=2]
  %837 = add i8 %836, %553                        ; <i8> [#uses=1]
  %838 = shl i8 %837, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2250

bb2.preheader.us.i2250:                           ; preds = %_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2247
  %i.05.us.i2248 = phi i32 [ 0, %bb.nph6.i2247 ], [ %tmp.i2249, %_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2249 = add i32 %i.05.us.i2248, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2256

_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2257, %bb.i1.us.i2251
  %839 = icmp slt i32 %tmp.i2249, %iterations.0   ; <i1> [#uses=1]
  br i1 %839, label %bb2.preheader.us.i2250, label %bb5.i2258

bb.i1.us.i2251:                                   ; preds = %bb2.bb3_crit_edge.us.i2257
  %840 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 28) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2256:                                     ; preds = %bb1.us.i2256, %bb2.preheader.us.i2250
  %result.03.us.i2252 = phi i8 [ 0, %bb2.preheader.us.i2250 ], [ %843, %bb1.us.i2256 ] ; <i8> [#uses=1]
  %n.02.us.i2253 = phi i32 [ 0, %bb2.preheader.us.i2250 ], [ %844, %bb1.us.i2256 ] ; <i32> [#uses=2]
  %scevgep.i2254 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2253 ; <i8*> [#uses=1]
  %841 = load i8* %scevgep.i2254, align 1         ; <i8> [#uses=1]
  %842 = add i8 %841, %result.03.us.i2252         ; <i8> [#uses=1]
  %843 = add i8 %842, %836                        ; <i8> [#uses=2]
  %844 = add nsw i32 %n.02.us.i2253, 1            ; <i32> [#uses=2]
  %exitcond.i2255 = icmp eq i32 %844, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2255, label %bb2.bb3_crit_edge.us.i2257, label %bb1.us.i2256

bb2.bb3_crit_edge.us.i2257:                       ; preds = %bb1.us.i2256
  %845 = icmp eq i8 %838, %843                    ; <i1> [#uses=1]
  br i1 %845, label %_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2251

bb5.i2258:                                        ; preds = %_Z26check_shifted_variable_sumIh32custom_divide_multiple_variable2IhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ih31custom_divide_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %846 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %847 = sub i32 %846, %833                       ; <i32> [#uses=1]
  %848 = sitofp i32 %847 to double                ; <double> [#uses=1]
  %849 = fdiv double %848, 1.000000e+06           ; <double> [#uses=1]
  %.not2780 = icmp ne %struct.one_result* %results.26, null ; <i1> [#uses=1]
  %850 = icmp sgt i32 %allocated_results.26, 28   ; <i1> [#uses=1]
  %or.cond2781 = and i1 %850, %.not2780           ; <i1> [#uses=1]
  br i1 %or.cond2781, label %_Z14test_variable4Ih32custom_divide_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2260

bb1.i.i2260:                                      ; preds = %bb5.i2258
  %851 = add nsw i32 %allocated_results.26, 10    ; <i32> [#uses=3]
  %852 = mul i32 %851, 12                         ; <i32> [#uses=1]
  %853 = bitcast %struct.one_result* %results.26 to i8* ; <i8*> [#uses=1]
  %854 = tail call i8* @realloc(i8* %853, i32 %852) nounwind ; <i8*> [#uses=2]
  %855 = bitcast i8* %854 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %856 = icmp eq i8* %854, null                   ; <i1> [#uses=1]
  br i1 %856, label %bb2.i.i2261, label %_Z14test_variable4Ih32custom_divide_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2261:                                      ; preds = %bb1.i.i2260
  %857 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %851) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih32custom_divide_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2260, %bb5.i2258
  %results.27 = phi %struct.one_result* [ %855, %bb1.i.i2260 ], [ %results.26, %bb5.i2258 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.27 = phi i32 [ %851, %bb1.i.i2260 ], [ %allocated_results.26, %bb5.i2258 ] ; <i32> [#uses=3]
  %858 = phi %struct.one_result* [ %855, %bb1.i.i2260 ], [ %results.26, %bb5.i2258 ] ; <%struct.one_result*> [#uses=2]
  %859 = getelementptr inbounds %struct.one_result* %858, i32 28, i32 0 ; <double*> [#uses=1]
  store double %849, double* %859, align 4
  %860 = getelementptr inbounds %struct.one_result* %858, i32 28, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str40, i32 0, i32 0), i8** %860, align 4
  %861 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i2232, label %bb5.i2243

bb.nph7.i2232:                                    ; preds = %_Z14test_variable4Ih32custom_divide_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit
  %862 = zext i8 %555 to i32                      ; <i32> [#uses=1]
  %863 = zext i8 %556 to i32                      ; <i32> [#uses=1]
  %864 = mul i32 %863, %862                       ; <i32> [#uses=1]
  %865 = zext i8 %558 to i32                      ; <i32> [#uses=1]
  %866 = udiv i32 %864, %865                      ; <i32> [#uses=1]
  %867 = trunc i32 %866 to i8                     ; <i8> [#uses=2]
  %868 = add i8 %553, %554                        ; <i8> [#uses=1]
  %869 = sub i8 %868, %867                        ; <i8> [#uses=1]
  %870 = shl i8 %869, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2235

bb2.preheader.us.i2235:                           ; preds = %_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i2232
  %i.06.us.i2233 = phi i32 [ 0, %bb.nph7.i2232 ], [ %tmp.i2234, %_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2234 = add i32 %i.06.us.i2233, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2241

_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2242, %bb.i1.us.i2236
  %871 = icmp slt i32 %tmp.i2234, %iterations.0   ; <i1> [#uses=1]
  br i1 %871, label %bb2.preheader.us.i2235, label %bb5.i2243

bb.i1.us.i2236:                                   ; preds = %bb2.bb3_crit_edge.us.i2242
  %872 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 29) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2241:                                     ; preds = %bb1.us.i2241, %bb2.preheader.us.i2235
  %result.04.us.i2237 = phi i8 [ 0, %bb2.preheader.us.i2235 ], [ %876, %bb1.us.i2241 ] ; <i8> [#uses=1]
  %n.03.us.i2238 = phi i32 [ 0, %bb2.preheader.us.i2235 ], [ %877, %bb1.us.i2241 ] ; <i32> [#uses=2]
  %scevgep.i2239 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.03.us.i2238 ; <i8*> [#uses=1]
  %873 = load i8* %scevgep.i2239, align 1         ; <i8> [#uses=1]
  %874 = add i8 %result.04.us.i2237, %554         ; <i8> [#uses=1]
  %875 = add i8 %874, %873                        ; <i8> [#uses=1]
  %876 = sub i8 %875, %867                        ; <i8> [#uses=2]
  %877 = add nsw i32 %n.03.us.i2238, 1            ; <i32> [#uses=2]
  %exitcond.i2240 = icmp eq i32 %877, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2240, label %bb2.bb3_crit_edge.us.i2242, label %bb1.us.i2241

bb2.bb3_crit_edge.us.i2242:                       ; preds = %bb1.us.i2241
  %878 = icmp eq i8 %870, %876                    ; <i1> [#uses=1]
  br i1 %878, label %_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2236

bb5.i2243:                                        ; preds = %_Z26check_shifted_variable_sumIh30custom_mixed_multiple_variableIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ih32custom_divide_multiple_variable2IhEEvPT_iS2_S2_S2_S2_PKc.exit
  %879 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %880 = sub i32 %879, %861                       ; <i32> [#uses=1]
  %881 = sitofp i32 %880 to double                ; <double> [#uses=1]
  %882 = fdiv double %881, 1.000000e+06           ; <double> [#uses=1]
  %.not2782 = icmp ne %struct.one_result* %results.27, null ; <i1> [#uses=1]
  %883 = icmp sgt i32 %allocated_results.27, 29   ; <i1> [#uses=1]
  %or.cond2783 = and i1 %883, %.not2782           ; <i1> [#uses=1]
  br i1 %or.cond2783, label %_Z14test_variable4Ih30custom_mixed_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2245

bb1.i.i2245:                                      ; preds = %bb5.i2243
  %884 = add nsw i32 %allocated_results.27, 10    ; <i32> [#uses=3]
  %885 = mul i32 %884, 12                         ; <i32> [#uses=1]
  %886 = bitcast %struct.one_result* %results.27 to i8* ; <i8*> [#uses=1]
  %887 = tail call i8* @realloc(i8* %886, i32 %885) nounwind ; <i8*> [#uses=2]
  %888 = bitcast i8* %887 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %889 = icmp eq i8* %887, null                   ; <i1> [#uses=1]
  br i1 %889, label %bb2.i.i2246, label %_Z14test_variable4Ih30custom_mixed_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2246:                                      ; preds = %bb1.i.i2245
  %890 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %884) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih30custom_mixed_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2245, %bb5.i2243
  %results.28 = phi %struct.one_result* [ %888, %bb1.i.i2245 ], [ %results.27, %bb5.i2243 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.28 = phi i32 [ %884, %bb1.i.i2245 ], [ %allocated_results.27, %bb5.i2243 ] ; <i32> [#uses=3]
  %891 = phi %struct.one_result* [ %888, %bb1.i.i2245 ], [ %results.27, %bb5.i2243 ] ; <%struct.one_result*> [#uses=2]
  %892 = getelementptr inbounds %struct.one_result* %891, i32 29, i32 0 ; <double*> [#uses=1]
  store double %882, double* %892, align 4
  %893 = getelementptr inbounds %struct.one_result* %891, i32 29, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str41, i32 0, i32 0), i8** %893, align 4
  %894 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2217, label %bb5.i2228

bb.nph6.i2217:                                    ; preds = %_Z14test_variable4Ih30custom_mixed_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %895 = and i8 %553, %554                        ; <i8> [#uses=1]
  %896 = shl i8 %895, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2220

bb2.preheader.us.i2220:                           ; preds = %_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i, %bb.nph6.i2217
  %i.05.us.i2218 = phi i32 [ 0, %bb.nph6.i2217 ], [ %tmp.i2219, %_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2219 = add i32 %i.05.us.i2218, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2226

_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2227, %bb.i1.us.i2221
  %897 = icmp slt i32 %tmp.i2219, %iterations.0   ; <i1> [#uses=1]
  br i1 %897, label %bb2.preheader.us.i2220, label %bb5.i2228

bb.i1.us.i2221:                                   ; preds = %bb2.bb3_crit_edge.us.i2227
  %898 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 30) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i

bb1.us.i2226:                                     ; preds = %bb1.us.i2226, %bb2.preheader.us.i2220
  %result.03.us.i2222 = phi i8 [ 0, %bb2.preheader.us.i2220 ], [ %901, %bb1.us.i2226 ] ; <i8> [#uses=1]
  %n.02.us.i2223 = phi i32 [ 0, %bb2.preheader.us.i2220 ], [ %902, %bb1.us.i2226 ] ; <i32> [#uses=2]
  %scevgep.i2224 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2223 ; <i8*> [#uses=1]
  %899 = load i8* %scevgep.i2224, align 1         ; <i8> [#uses=1]
  %900 = and i8 %899, %554                        ; <i8> [#uses=1]
  %901 = add i8 %900, %result.03.us.i2222         ; <i8> [#uses=2]
  %902 = add nsw i32 %n.02.us.i2223, 1            ; <i32> [#uses=2]
  %exitcond.i2225 = icmp eq i32 %902, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2225, label %bb2.bb3_crit_edge.us.i2227, label %bb1.us.i2226

bb2.bb3_crit_edge.us.i2227:                       ; preds = %bb1.us.i2226
  %903 = icmp eq i8 %896, %901                    ; <i1> [#uses=1]
  br i1 %903, label %_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2221

bb5.i2228:                                        ; preds = %_Z26check_shifted_variable_sumIh19custom_variable_andIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih30custom_mixed_multiple_variableIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %904 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %905 = sub i32 %904, %894                       ; <i32> [#uses=1]
  %906 = sitofp i32 %905 to double                ; <double> [#uses=1]
  %907 = fdiv double %906, 1.000000e+06           ; <double> [#uses=1]
  %.not2784 = icmp ne %struct.one_result* %results.28, null ; <i1> [#uses=1]
  %908 = icmp sgt i32 %allocated_results.28, 30   ; <i1> [#uses=1]
  %or.cond2785 = and i1 %908, %.not2784           ; <i1> [#uses=1]
  br i1 %or.cond2785, label %_Z14test_variable1Ih19custom_variable_andIhEEvPT_iS2_PKc.exit, label %bb1.i.i2230

bb1.i.i2230:                                      ; preds = %bb5.i2228
  %909 = add nsw i32 %allocated_results.28, 10    ; <i32> [#uses=3]
  %910 = mul i32 %909, 12                         ; <i32> [#uses=1]
  %911 = bitcast %struct.one_result* %results.28 to i8* ; <i8*> [#uses=1]
  %912 = tail call i8* @realloc(i8* %911, i32 %910) nounwind ; <i8*> [#uses=2]
  %913 = bitcast i8* %912 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %914 = icmp eq i8* %912, null                   ; <i1> [#uses=1]
  br i1 %914, label %bb2.i.i2231, label %_Z14test_variable1Ih19custom_variable_andIhEEvPT_iS2_PKc.exit

bb2.i.i2231:                                      ; preds = %bb1.i.i2230
  %915 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %909) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih19custom_variable_andIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2230, %bb5.i2228
  %results.29 = phi %struct.one_result* [ %913, %bb1.i.i2230 ], [ %results.28, %bb5.i2228 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.29 = phi i32 [ %909, %bb1.i.i2230 ], [ %allocated_results.28, %bb5.i2228 ] ; <i32> [#uses=3]
  %916 = phi %struct.one_result* [ %913, %bb1.i.i2230 ], [ %results.28, %bb5.i2228 ] ; <%struct.one_result*> [#uses=2]
  %917 = getelementptr inbounds %struct.one_result* %916, i32 30, i32 0 ; <double*> [#uses=1]
  store double %907, double* %917, align 4
  %918 = getelementptr inbounds %struct.one_result* %916, i32 30, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str42, i32 0, i32 0), i8** %918, align 4
  %919 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2202, label %bb5.i2213

bb.nph6.i2202:                                    ; preds = %_Z14test_variable1Ih19custom_variable_andIhEEvPT_iS2_PKc.exit
  %920 = and i8 %555, %554                        ; <i8> [#uses=1]
  %921 = and i8 %920, %556                        ; <i8> [#uses=1]
  %922 = and i8 %921, %558                        ; <i8> [#uses=2]
  %923 = and i8 %922, %553                        ; <i8> [#uses=1]
  %924 = shl i8 %923, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2205

bb2.preheader.us.i2205:                           ; preds = %_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2202
  %i.05.us.i2203 = phi i32 [ 0, %bb.nph6.i2202 ], [ %tmp.i2204, %_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2204 = add i32 %i.05.us.i2203, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2211

_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2212, %bb.i1.us.i2206
  %925 = icmp slt i32 %tmp.i2204, %iterations.0   ; <i1> [#uses=1]
  br i1 %925, label %bb2.preheader.us.i2205, label %bb5.i2213

bb.i1.us.i2206:                                   ; preds = %bb2.bb3_crit_edge.us.i2212
  %926 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 31) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2211:                                     ; preds = %bb1.us.i2211, %bb2.preheader.us.i2205
  %result.03.us.i2207 = phi i8 [ 0, %bb2.preheader.us.i2205 ], [ %929, %bb1.us.i2211 ] ; <i8> [#uses=1]
  %n.02.us.i2208 = phi i32 [ 0, %bb2.preheader.us.i2205 ], [ %930, %bb1.us.i2211 ] ; <i32> [#uses=2]
  %scevgep.i2209 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2208 ; <i8*> [#uses=1]
  %927 = load i8* %scevgep.i2209, align 1         ; <i8> [#uses=1]
  %928 = and i8 %922, %927                        ; <i8> [#uses=1]
  %929 = add i8 %928, %result.03.us.i2207         ; <i8> [#uses=2]
  %930 = add nsw i32 %n.02.us.i2208, 1            ; <i32> [#uses=2]
  %exitcond.i2210 = icmp eq i32 %930, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2210, label %bb2.bb3_crit_edge.us.i2212, label %bb1.us.i2211

bb2.bb3_crit_edge.us.i2212:                       ; preds = %bb1.us.i2211
  %931 = icmp eq i8 %924, %929                    ; <i1> [#uses=1]
  br i1 %931, label %_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2206

bb5.i2213:                                        ; preds = %_Z26check_shifted_variable_sumIh28custom_multiple_variable_andIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih19custom_variable_andIhEEvPT_iS2_PKc.exit
  %932 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %933 = sub i32 %932, %919                       ; <i32> [#uses=1]
  %934 = sitofp i32 %933 to double                ; <double> [#uses=1]
  %935 = fdiv double %934, 1.000000e+06           ; <double> [#uses=1]
  %.not2786 = icmp ne %struct.one_result* %results.29, null ; <i1> [#uses=1]
  %936 = icmp sgt i32 %allocated_results.29, 31   ; <i1> [#uses=1]
  %or.cond2787 = and i1 %936, %.not2786           ; <i1> [#uses=1]
  br i1 %or.cond2787, label %_Z14test_variable4Ih28custom_multiple_variable_andIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2215

bb1.i.i2215:                                      ; preds = %bb5.i2213
  %937 = add nsw i32 %allocated_results.29, 10    ; <i32> [#uses=3]
  %938 = mul i32 %937, 12                         ; <i32> [#uses=1]
  %939 = bitcast %struct.one_result* %results.29 to i8* ; <i8*> [#uses=1]
  %940 = tail call i8* @realloc(i8* %939, i32 %938) nounwind ; <i8*> [#uses=2]
  %941 = bitcast i8* %940 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %942 = icmp eq i8* %940, null                   ; <i1> [#uses=1]
  br i1 %942, label %bb2.i.i2216, label %_Z14test_variable4Ih28custom_multiple_variable_andIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2216:                                      ; preds = %bb1.i.i2215
  %943 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %937) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih28custom_multiple_variable_andIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2215, %bb5.i2213
  %results.30 = phi %struct.one_result* [ %941, %bb1.i.i2215 ], [ %results.29, %bb5.i2213 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.30 = phi i32 [ %937, %bb1.i.i2215 ], [ %allocated_results.29, %bb5.i2213 ] ; <i32> [#uses=3]
  %944 = phi %struct.one_result* [ %941, %bb1.i.i2215 ], [ %results.29, %bb5.i2213 ] ; <%struct.one_result*> [#uses=2]
  %945 = getelementptr inbounds %struct.one_result* %944, i32 31, i32 0 ; <double*> [#uses=1]
  store double %935, double* %945, align 4
  %946 = getelementptr inbounds %struct.one_result* %944, i32 31, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str43, i32 0, i32 0), i8** %946, align 4
  %947 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2187, label %bb5.i2198

bb.nph6.i2187:                                    ; preds = %_Z14test_variable4Ih28custom_multiple_variable_andIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %948 = or i8 %553, %554                         ; <i8> [#uses=1]
  %949 = shl i8 %948, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2190

bb2.preheader.us.i2190:                           ; preds = %_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i, %bb.nph6.i2187
  %i.05.us.i2188 = phi i32 [ 0, %bb.nph6.i2187 ], [ %tmp.i2189, %_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2189 = add i32 %i.05.us.i2188, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2196

_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2197, %bb.i1.us.i2191
  %950 = icmp slt i32 %tmp.i2189, %iterations.0   ; <i1> [#uses=1]
  br i1 %950, label %bb2.preheader.us.i2190, label %bb5.i2198

bb.i1.us.i2191:                                   ; preds = %bb2.bb3_crit_edge.us.i2197
  %951 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 32) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i

bb1.us.i2196:                                     ; preds = %bb1.us.i2196, %bb2.preheader.us.i2190
  %result.03.us.i2192 = phi i8 [ 0, %bb2.preheader.us.i2190 ], [ %954, %bb1.us.i2196 ] ; <i8> [#uses=1]
  %n.02.us.i2193 = phi i32 [ 0, %bb2.preheader.us.i2190 ], [ %955, %bb1.us.i2196 ] ; <i32> [#uses=2]
  %scevgep.i2194 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2193 ; <i8*> [#uses=1]
  %952 = load i8* %scevgep.i2194, align 1         ; <i8> [#uses=1]
  %953 = or i8 %952, %554                         ; <i8> [#uses=1]
  %954 = add i8 %953, %result.03.us.i2192         ; <i8> [#uses=2]
  %955 = add nsw i32 %n.02.us.i2193, 1            ; <i32> [#uses=2]
  %exitcond.i2195 = icmp eq i32 %955, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2195, label %bb2.bb3_crit_edge.us.i2197, label %bb1.us.i2196

bb2.bb3_crit_edge.us.i2197:                       ; preds = %bb1.us.i2196
  %956 = icmp eq i8 %949, %954                    ; <i1> [#uses=1]
  br i1 %956, label %_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2191

bb5.i2198:                                        ; preds = %_Z26check_shifted_variable_sumIh18custom_variable_orIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih28custom_multiple_variable_andIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %957 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %958 = sub i32 %957, %947                       ; <i32> [#uses=1]
  %959 = sitofp i32 %958 to double                ; <double> [#uses=1]
  %960 = fdiv double %959, 1.000000e+06           ; <double> [#uses=1]
  %.not2788 = icmp ne %struct.one_result* %results.30, null ; <i1> [#uses=1]
  %961 = icmp sgt i32 %allocated_results.30, 32   ; <i1> [#uses=1]
  %or.cond2789 = and i1 %961, %.not2788           ; <i1> [#uses=1]
  br i1 %or.cond2789, label %_Z14test_variable1Ih18custom_variable_orIhEEvPT_iS2_PKc.exit, label %bb1.i.i2200

bb1.i.i2200:                                      ; preds = %bb5.i2198
  %962 = add nsw i32 %allocated_results.30, 10    ; <i32> [#uses=3]
  %963 = mul i32 %962, 12                         ; <i32> [#uses=1]
  %964 = bitcast %struct.one_result* %results.30 to i8* ; <i8*> [#uses=1]
  %965 = tail call i8* @realloc(i8* %964, i32 %963) nounwind ; <i8*> [#uses=2]
  %966 = bitcast i8* %965 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %967 = icmp eq i8* %965, null                   ; <i1> [#uses=1]
  br i1 %967, label %bb2.i.i2201, label %_Z14test_variable1Ih18custom_variable_orIhEEvPT_iS2_PKc.exit

bb2.i.i2201:                                      ; preds = %bb1.i.i2200
  %968 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %962) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih18custom_variable_orIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2200, %bb5.i2198
  %results.31 = phi %struct.one_result* [ %966, %bb1.i.i2200 ], [ %results.30, %bb5.i2198 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.31 = phi i32 [ %962, %bb1.i.i2200 ], [ %allocated_results.30, %bb5.i2198 ] ; <i32> [#uses=3]
  %969 = phi %struct.one_result* [ %966, %bb1.i.i2200 ], [ %results.30, %bb5.i2198 ] ; <%struct.one_result*> [#uses=2]
  %970 = getelementptr inbounds %struct.one_result* %969, i32 32, i32 0 ; <double*> [#uses=1]
  store double %960, double* %970, align 4
  %971 = getelementptr inbounds %struct.one_result* %969, i32 32, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str44, i32 0, i32 0), i8** %971, align 4
  %972 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2172, label %bb5.i2183

bb.nph6.i2172:                                    ; preds = %_Z14test_variable1Ih18custom_variable_orIhEEvPT_iS2_PKc.exit
  %973 = or i8 %555, %554                         ; <i8> [#uses=1]
  %974 = or i8 %973, %556                         ; <i8> [#uses=1]
  %975 = or i8 %974, %558                         ; <i8> [#uses=2]
  %976 = or i8 %975, %553                         ; <i8> [#uses=1]
  %977 = shl i8 %976, 6                           ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2175

bb2.preheader.us.i2175:                           ; preds = %_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2172
  %i.05.us.i2173 = phi i32 [ 0, %bb.nph6.i2172 ], [ %tmp.i2174, %_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2174 = add i32 %i.05.us.i2173, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2181

_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2182, %bb.i1.us.i2176
  %978 = icmp slt i32 %tmp.i2174, %iterations.0   ; <i1> [#uses=1]
  br i1 %978, label %bb2.preheader.us.i2175, label %bb5.i2183

bb.i1.us.i2176:                                   ; preds = %bb2.bb3_crit_edge.us.i2182
  %979 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 33) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2181:                                     ; preds = %bb1.us.i2181, %bb2.preheader.us.i2175
  %result.03.us.i2177 = phi i8 [ 0, %bb2.preheader.us.i2175 ], [ %982, %bb1.us.i2181 ] ; <i8> [#uses=1]
  %n.02.us.i2178 = phi i32 [ 0, %bb2.preheader.us.i2175 ], [ %983, %bb1.us.i2181 ] ; <i32> [#uses=2]
  %scevgep.i2179 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2178 ; <i8*> [#uses=1]
  %980 = load i8* %scevgep.i2179, align 1         ; <i8> [#uses=1]
  %981 = or i8 %975, %980                         ; <i8> [#uses=1]
  %982 = add i8 %981, %result.03.us.i2177         ; <i8> [#uses=2]
  %983 = add nsw i32 %n.02.us.i2178, 1            ; <i32> [#uses=2]
  %exitcond.i2180 = icmp eq i32 %983, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i2180, label %bb2.bb3_crit_edge.us.i2182, label %bb1.us.i2181

bb2.bb3_crit_edge.us.i2182:                       ; preds = %bb1.us.i2181
  %984 = icmp eq i8 %977, %982                    ; <i1> [#uses=1]
  br i1 %984, label %_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2176

bb5.i2183:                                        ; preds = %_Z26check_shifted_variable_sumIh27custom_multiple_variable_orIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih18custom_variable_orIhEEvPT_iS2_PKc.exit
  %985 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %986 = sub i32 %985, %972                       ; <i32> [#uses=1]
  %987 = sitofp i32 %986 to double                ; <double> [#uses=1]
  %988 = fdiv double %987, 1.000000e+06           ; <double> [#uses=1]
  %.not2790 = icmp ne %struct.one_result* %results.31, null ; <i1> [#uses=1]
  %989 = icmp sgt i32 %allocated_results.31, 33   ; <i1> [#uses=1]
  %or.cond2791 = and i1 %989, %.not2790           ; <i1> [#uses=1]
  br i1 %or.cond2791, label %_Z14test_variable4Ih27custom_multiple_variable_orIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2185

bb1.i.i2185:                                      ; preds = %bb5.i2183
  %990 = add nsw i32 %allocated_results.31, 10    ; <i32> [#uses=3]
  %991 = mul i32 %990, 12                         ; <i32> [#uses=1]
  %992 = bitcast %struct.one_result* %results.31 to i8* ; <i8*> [#uses=1]
  %993 = tail call i8* @realloc(i8* %992, i32 %991) nounwind ; <i8*> [#uses=2]
  %994 = bitcast i8* %993 to %struct.one_result*  ; <%struct.one_result*> [#uses=2]
  %995 = icmp eq i8* %993, null                   ; <i1> [#uses=1]
  br i1 %995, label %bb2.i.i2186, label %_Z14test_variable4Ih27custom_multiple_variable_orIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2186:                                      ; preds = %bb1.i.i2185
  %996 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %990) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih27custom_multiple_variable_orIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2185, %bb5.i2183
  %results.32 = phi %struct.one_result* [ %994, %bb1.i.i2185 ], [ %results.31, %bb5.i2183 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.32 = phi i32 [ %990, %bb1.i.i2185 ], [ %allocated_results.31, %bb5.i2183 ] ; <i32> [#uses=3]
  %997 = phi %struct.one_result* [ %994, %bb1.i.i2185 ], [ %results.31, %bb5.i2183 ] ; <%struct.one_result*> [#uses=2]
  %998 = getelementptr inbounds %struct.one_result* %997, i32 33, i32 0 ; <double*> [#uses=1]
  store double %988, double* %998, align 4
  %999 = getelementptr inbounds %struct.one_result* %997, i32 33, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str45, i32 0, i32 0), i8** %999, align 4
  %1000 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2157, label %bb5.i2168

bb.nph6.i2157:                                    ; preds = %_Z14test_variable4Ih27custom_multiple_variable_orIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %1001 = xor i8 %553, %554                       ; <i8> [#uses=1]
  %1002 = shl i8 %1001, 6                         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2160

bb2.preheader.us.i2160:                           ; preds = %_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i, %bb.nph6.i2157
  %i.05.us.i2158 = phi i32 [ 0, %bb.nph6.i2157 ], [ %tmp.i2159, %_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2159 = add i32 %i.05.us.i2158, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2166

_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2167, %bb.i1.us.i2161
  %1003 = icmp slt i32 %tmp.i2159, %iterations.0  ; <i1> [#uses=1]
  br i1 %1003, label %bb2.preheader.us.i2160, label %bb5.i2168

bb.i1.us.i2161:                                   ; preds = %bb2.bb3_crit_edge.us.i2167
  %1004 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 34) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i

bb1.us.i2166:                                     ; preds = %bb1.us.i2166, %bb2.preheader.us.i2160
  %result.03.us.i2162 = phi i8 [ 0, %bb2.preheader.us.i2160 ], [ %1007, %bb1.us.i2166 ] ; <i8> [#uses=1]
  %n.02.us.i2163 = phi i32 [ 0, %bb2.preheader.us.i2160 ], [ %1008, %bb1.us.i2166 ] ; <i32> [#uses=2]
  %scevgep.i2164 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2163 ; <i8*> [#uses=1]
  %1005 = load i8* %scevgep.i2164, align 1        ; <i8> [#uses=1]
  %1006 = xor i8 %1005, %554                      ; <i8> [#uses=1]
  %1007 = add i8 %1006, %result.03.us.i2162       ; <i8> [#uses=2]
  %1008 = add nsw i32 %n.02.us.i2163, 1           ; <i32> [#uses=2]
  %exitcond.i2165 = icmp eq i32 %1008, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2165, label %bb2.bb3_crit_edge.us.i2167, label %bb1.us.i2166

bb2.bb3_crit_edge.us.i2167:                       ; preds = %bb1.us.i2166
  %1009 = icmp eq i8 %1002, %1007                 ; <i1> [#uses=1]
  br i1 %1009, label %_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i, label %bb.i1.us.i2161

bb5.i2168:                                        ; preds = %_Z26check_shifted_variable_sumIh19custom_variable_xorIhEEvT_S2_.exit.us.i, %_Z14test_variable4Ih27custom_multiple_variable_orIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %1010 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1011 = sub i32 %1010, %1000                    ; <i32> [#uses=1]
  %1012 = sitofp i32 %1011 to double              ; <double> [#uses=1]
  %1013 = fdiv double %1012, 1.000000e+06         ; <double> [#uses=1]
  %.not2792 = icmp ne %struct.one_result* %results.32, null ; <i1> [#uses=1]
  %1014 = icmp sgt i32 %allocated_results.32, 34  ; <i1> [#uses=1]
  %or.cond2793 = and i1 %1014, %.not2792          ; <i1> [#uses=1]
  br i1 %or.cond2793, label %_Z14test_variable1Ih19custom_variable_xorIhEEvPT_iS2_PKc.exit, label %bb1.i.i2170

bb1.i.i2170:                                      ; preds = %bb5.i2168
  %1015 = add nsw i32 %allocated_results.32, 10   ; <i32> [#uses=3]
  %1016 = mul i32 %1015, 12                       ; <i32> [#uses=1]
  %1017 = bitcast %struct.one_result* %results.32 to i8* ; <i8*> [#uses=1]
  %1018 = tail call i8* @realloc(i8* %1017, i32 %1016) nounwind ; <i8*> [#uses=2]
  %1019 = bitcast i8* %1018 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1020 = icmp eq i8* %1018, null                 ; <i1> [#uses=1]
  br i1 %1020, label %bb2.i.i2171, label %_Z14test_variable1Ih19custom_variable_xorIhEEvPT_iS2_PKc.exit

bb2.i.i2171:                                      ; preds = %bb1.i.i2170
  %1021 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1015) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ih19custom_variable_xorIhEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2170, %bb5.i2168
  %results.33 = phi %struct.one_result* [ %1019, %bb1.i.i2170 ], [ %results.32, %bb5.i2168 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.33 = phi i32 [ %1015, %bb1.i.i2170 ], [ %allocated_results.32, %bb5.i2168 ] ; <i32> [#uses=3]
  %1022 = phi %struct.one_result* [ %1019, %bb1.i.i2170 ], [ %results.32, %bb5.i2168 ] ; <%struct.one_result*> [#uses=2]
  %1023 = getelementptr inbounds %struct.one_result* %1022, i32 34, i32 0 ; <double*> [#uses=1]
  store double %1013, double* %1023, align 4
  %1024 = getelementptr inbounds %struct.one_result* %1022, i32 34, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str46, i32 0, i32 0), i8** %1024, align 4
  %1025 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2142, label %bb5.i2153

bb.nph6.i2142:                                    ; preds = %_Z14test_variable1Ih19custom_variable_xorIhEEvPT_iS2_PKc.exit
  %1026 = xor i8 %555, %554                       ; <i8> [#uses=1]
  %1027 = xor i8 %1026, %556                      ; <i8> [#uses=1]
  %1028 = xor i8 %1027, %558                      ; <i8> [#uses=2]
  %1029 = xor i8 %1028, %553                      ; <i8> [#uses=1]
  %1030 = shl i8 %1029, 6                         ; <i8> [#uses=1]
  br label %bb2.preheader.us.i2145

bb2.preheader.us.i2145:                           ; preds = %_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2142
  %i.05.us.i2143 = phi i32 [ 0, %bb.nph6.i2142 ], [ %tmp.i2144, %_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2144 = add i32 %i.05.us.i2143, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2151

_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2152, %bb.i1.us.i2146
  %1031 = icmp slt i32 %tmp.i2144, %iterations.0  ; <i1> [#uses=1]
  br i1 %1031, label %bb2.preheader.us.i2145, label %bb5.i2153

bb.i1.us.i2146:                                   ; preds = %bb2.bb3_crit_edge.us.i2152
  %1032 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 35) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2151:                                     ; preds = %bb1.us.i2151, %bb2.preheader.us.i2145
  %result.03.us.i2147 = phi i8 [ 0, %bb2.preheader.us.i2145 ], [ %1035, %bb1.us.i2151 ] ; <i8> [#uses=1]
  %n.02.us.i2148 = phi i32 [ 0, %bb2.preheader.us.i2145 ], [ %1036, %bb1.us.i2151 ] ; <i32> [#uses=2]
  %scevgep.i2149 = getelementptr [8000 x i8]* @data8unsigned, i32 0, i32 %n.02.us.i2148 ; <i8*> [#uses=1]
  %1033 = load i8* %scevgep.i2149, align 1        ; <i8> [#uses=1]
  %1034 = xor i8 %1028, %1033                     ; <i8> [#uses=1]
  %1035 = add i8 %1034, %result.03.us.i2147       ; <i8> [#uses=2]
  %1036 = add nsw i32 %n.02.us.i2148, 1           ; <i32> [#uses=2]
  %exitcond.i2150 = icmp eq i32 %1036, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2150, label %bb2.bb3_crit_edge.us.i2152, label %bb1.us.i2151

bb2.bb3_crit_edge.us.i2152:                       ; preds = %bb1.us.i2151
  %1037 = icmp eq i8 %1030, %1035                 ; <i1> [#uses=1]
  br i1 %1037, label %_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2146

bb5.i2153:                                        ; preds = %_Z26check_shifted_variable_sumIh28custom_multiple_variable_xorIhEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ih19custom_variable_xorIhEEvPT_iS2_PKc.exit
  %1038 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1039 = sub i32 %1038, %1025                    ; <i32> [#uses=1]
  %1040 = sitofp i32 %1039 to double              ; <double> [#uses=1]
  %1041 = fdiv double %1040, 1.000000e+06         ; <double> [#uses=1]
  %.not2794 = icmp ne %struct.one_result* %results.33, null ; <i1> [#uses=1]
  %1042 = icmp sgt i32 %allocated_results.33, 35  ; <i1> [#uses=1]
  %or.cond2795 = and i1 %1042, %.not2794          ; <i1> [#uses=1]
  br i1 %or.cond2795, label %_Z14test_variable4Ih28custom_multiple_variable_xorIhEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2155

bb1.i.i2155:                                      ; preds = %bb5.i2153
  %1043 = add nsw i32 %allocated_results.33, 10   ; <i32> [#uses=3]
  %1044 = mul i32 %1043, 12                       ; <i32> [#uses=1]
  %1045 = bitcast %struct.one_result* %results.33 to i8* ; <i8*> [#uses=1]
  %1046 = tail call i8* @realloc(i8* %1045, i32 %1044) nounwind ; <i8*> [#uses=2]
  %1047 = bitcast i8* %1046 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1048 = icmp eq i8* %1046, null                 ; <i1> [#uses=1]
  br i1 %1048, label %bb2.i.i2156, label %_Z14test_variable4Ih28custom_multiple_variable_xorIhEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2156:                                      ; preds = %bb1.i.i2155
  %1049 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1043) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ih28custom_multiple_variable_xorIhEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2155, %bb5.i2153
  %results.34 = phi %struct.one_result* [ %1047, %bb1.i.i2155 ], [ %results.33, %bb5.i2153 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.34 = phi i32 [ %1043, %bb1.i.i2155 ], [ %allocated_results.33, %bb5.i2153 ] ; <i32> [#uses=3]
  %1050 = phi %struct.one_result* [ %1047, %bb1.i.i2155 ], [ %results.33, %bb5.i2153 ] ; <%struct.one_result*> [#uses=2]
  %1051 = getelementptr inbounds %struct.one_result* %1050, i32 35, i32 0 ; <double*> [#uses=1]
  store double %1041, double* %1051, align 4
  %1052 = getelementptr inbounds %struct.one_result* %1050, i32 35, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str47, i32 0, i32 0), i8** %1052, align 4
  %1053 = fptosi double %init_value.0 to i16      ; <i16> [#uses=19]
  br label %bb.i8

bb.i8:                                            ; preds = %bb.i8, %_Z14test_variable4Ih28custom_multiple_variable_xorIhEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i6 = phi i32 [ 0, %_Z14test_variable4Ih28custom_multiple_variable_xorIhEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i, %bb.i8 ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i6, 1                  ; <i32> [#uses=2]
  %first_addr.01.i7 = getelementptr [8000 x i16]* @data16, i32 0, i32 %indvar.i6 ; <i16*> [#uses=1]
  store i16 %1053, i16* %first_addr.01.i7, align 2
  %scevgep.i.idx.mask = and i32 %tmp.i, 2147483647 ; <i32> [#uses=1]
  %1054 = icmp eq i32 %scevgep.i.idx.mask, 8000   ; <i1> [#uses=1]
  br i1 %1054, label %_Z4fillIPssEvT_S1_T0_.exit, label %bb.i8

_Z4fillIPssEvT_S1_T0_.exit:                       ; preds = %bb.i8
  %1055 = fptosi double %temp.0 to i16            ; <i16> [#uses=30]
  %1056 = shl i16 %1055, 1                        ; <i16> [#uses=9]
  %1057 = add i16 %1055, 2                        ; <i16> [#uses=10]
  %1058 = sext i16 %1056 to i32                   ; <i32> [#uses=5]
  %1059 = sext i16 %1057 to i32                   ; <i32> [#uses=5]
  %1060 = sdiv i32 %1058, %1059                   ; <i32> [#uses=1]
  %1061 = trunc i32 %1060 to i16                  ; <i16> [#uses=1]
  %1062 = add i16 %1061, %1055                    ; <i16> [#uses=12]
  %1063 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2123, label %bb5.i2138

bb.nph6.i2123:                                    ; preds = %_Z4fillIPssEvT_S1_T0_.exit
  %1064 = add i16 %1053, %1055                    ; <i16> [#uses=1]
  %1065 = mul i16 %1064, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2126

bb2.preheader.us.i2126:                           ; preds = %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127, %bb.nph6.i2123
  %i.05.us.i2124 = phi i32 [ 0, %bb.nph6.i2123 ], [ %tmp.i2125, %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127 ] ; <i32> [#uses=1]
  %tmp.i2125 = add i32 %i.05.us.i2124, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2133

_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127: ; preds = %bb2.bb3_crit_edge.us.i2137, %bb.i1.us.i2128
  %1066 = icmp slt i32 %tmp.i2125, %iterations.0  ; <i1> [#uses=1]
  br i1 %1066, label %bb2.preheader.us.i2126, label %bb5.i2138

bb.i1.us.i2128:                                   ; preds = %bb2.bb3_crit_edge.us.i2137
  %1067 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 36) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127

bb1.us.i2133:                                     ; preds = %bb1.us.i2133, %bb2.preheader.us.i2126
  %result.03.us.i2129 = phi i16 [ 0, %bb2.preheader.us.i2126 ], [ %1070, %bb1.us.i2133 ] ; <i16> [#uses=1]
  %n.02.us.i2130 = phi i32 [ 0, %bb2.preheader.us.i2126 ], [ %1071, %bb1.us.i2133 ] ; <i32> [#uses=2]
  %scevgep.i2131 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2130 ; <i16*> [#uses=1]
  %1068 = load i16* %scevgep.i2131, align 2       ; <i16> [#uses=1]
  %1069 = add i16 %result.03.us.i2129, %1055      ; <i16> [#uses=1]
  %1070 = add i16 %1069, %1068                    ; <i16> [#uses=2]
  %1071 = add nsw i32 %n.02.us.i2130, 1           ; <i32> [#uses=2]
  %exitcond.i2132 = icmp eq i32 %1071, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2132, label %bb2.bb3_crit_edge.us.i2137, label %bb1.us.i2133

bb2.bb3_crit_edge.us.i2137:                       ; preds = %bb1.us.i2133
  %1072 = sub i16 %1070, %1065                    ; <i16> [#uses=2]
  %1073 = sext i16 %1072 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2134 = sub i32 0, %1073            ; <i32> [#uses=1]
  %abscond.i.i.us.i2135 = icmp sgt i16 %1072, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2136 = select i1 %abscond.i.i.us.i2135, i32 %1073, i32 %neg.i.i.us.i2134 ; <i32> [#uses=1]
  %1074 = icmp slt i32 %abs.i.i.us.i2136, 1       ; <i1> [#uses=1]
  br i1 %1074, label %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127, label %bb.i1.us.i2128

bb5.i2138:                                        ; preds = %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i2127, %_Z4fillIPssEvT_S1_T0_.exit
  %1075 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1076 = sub i32 %1075, %1063                    ; <i32> [#uses=1]
  %1077 = sitofp i32 %1076 to double              ; <double> [#uses=1]
  %1078 = fdiv double %1077, 1.000000e+06         ; <double> [#uses=1]
  %.not2796 = icmp ne %struct.one_result* %results.34, null ; <i1> [#uses=1]
  %1079 = icmp sgt i32 %allocated_results.34, 36  ; <i1> [#uses=1]
  %or.cond2797 = and i1 %1079, %.not2796          ; <i1> [#uses=1]
  br i1 %or.cond2797, label %_Z14test_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit, label %bb1.i.i2140

bb1.i.i2140:                                      ; preds = %bb5.i2138
  %1080 = add nsw i32 %allocated_results.34, 10   ; <i32> [#uses=3]
  %1081 = mul i32 %1080, 12                       ; <i32> [#uses=1]
  %1082 = bitcast %struct.one_result* %results.34 to i8* ; <i8*> [#uses=1]
  %1083 = tail call i8* @realloc(i8* %1082, i32 %1081) nounwind ; <i8*> [#uses=2]
  %1084 = bitcast i8* %1083 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1085 = icmp eq i8* %1083, null                 ; <i1> [#uses=1]
  br i1 %1085, label %bb2.i.i2141, label %_Z14test_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit

bb2.i.i2141:                                      ; preds = %bb1.i.i2140
  %1086 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1080) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2140, %bb5.i2138
  %results.35 = phi %struct.one_result* [ %1084, %bb1.i.i2140 ], [ %results.34, %bb5.i2138 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.35 = phi i32 [ %1080, %bb1.i.i2140 ], [ %allocated_results.34, %bb5.i2138 ] ; <i32> [#uses=3]
  %1087 = phi %struct.one_result* [ %1084, %bb1.i.i2140 ], [ %results.34, %bb5.i2138 ] ; <%struct.one_result*> [#uses=2]
  %1088 = getelementptr inbounds %struct.one_result* %1087, i32 36, i32 0 ; <double*> [#uses=1]
  store double %1078, double* %1088, align 4
  %1089 = getelementptr inbounds %struct.one_result* %1087, i32 36, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str48, i32 0, i32 0), i8** %1089, align 4
  %1090 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i2105, label %bb5.i2119

bb.nph7.i2105:                                    ; preds = %_Z14test_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit
  %1091 = mul i16 %1055, 8000                     ; <i16> [#uses=1]
  %1092 = add i16 %1053, %1055                    ; <i16> [#uses=1]
  %1093 = mul i16 %1092, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2108

bb2.preheader.us.i2108:                           ; preds = %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i, %bb.nph7.i2105
  %i.06.us.i2106 = phi i32 [ 0, %bb.nph7.i2105 ], [ %tmp.i2107, %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2107 = add i32 %i.06.us.i2106, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2114

_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2118, %bb.i2.us.i2109
  %1094 = icmp slt i32 %tmp.i2107, %iterations.0  ; <i1> [#uses=1]
  br i1 %1094, label %bb2.preheader.us.i2108, label %bb5.i2119

bb.i2.us.i2109:                                   ; preds = %bb2.bb3_crit_edge.us.i2118
  %1095 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 37) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i

bb1.us.i2114:                                     ; preds = %bb1.us.i2114, %bb2.preheader.us.i2108
  %result.04.us.i2110 = phi i16 [ 0, %bb2.preheader.us.i2108 ], [ %1097, %bb1.us.i2114 ] ; <i16> [#uses=1]
  %n.03.us.i2111 = phi i32 [ 0, %bb2.preheader.us.i2108 ], [ %1098, %bb1.us.i2114 ] ; <i32> [#uses=2]
  %scevgep.i2112 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.03.us.i2111 ; <i16*> [#uses=1]
  %1096 = load i16* %scevgep.i2112, align 2       ; <i16> [#uses=1]
  %1097 = add i16 %1096, %result.04.us.i2110      ; <i16> [#uses=2]
  %1098 = add nsw i32 %n.03.us.i2111, 1           ; <i32> [#uses=2]
  %exitcond.i2113 = icmp eq i32 %1098, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2113, label %bb2.bb3_crit_edge.us.i2118, label %bb1.us.i2114

bb2.bb3_crit_edge.us.i2118:                       ; preds = %bb1.us.i2114
  %1099 = add i16 %1097, %1091                    ; <i16> [#uses=1]
  %1100 = sub i16 %1099, %1093                    ; <i16> [#uses=2]
  %1101 = sext i16 %1100 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2115 = sub i32 0, %1101            ; <i32> [#uses=1]
  %abscond.i.i.us.i2116 = icmp sgt i16 %1100, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2117 = select i1 %abscond.i.i.us.i2116, i32 %1101, i32 %neg.i.i.us.i2115 ; <i32> [#uses=1]
  %1102 = icmp slt i32 %abs.i.i.us.i2117, 1       ; <i1> [#uses=1]
  br i1 %1102, label %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i, label %bb.i2.us.i2109

bb5.i2119:                                        ; preds = %_Z26check_shifted_variable_sumIs19custom_add_variableIsEEvT_S2_.exit.us.i, %_Z14test_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit
  %1103 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1104 = sub i32 %1103, %1090                    ; <i32> [#uses=1]
  %1105 = sitofp i32 %1104 to double              ; <double> [#uses=1]
  %1106 = fdiv double %1105, 1.000000e+06         ; <double> [#uses=1]
  %.not2798 = icmp ne %struct.one_result* %results.35, null ; <i1> [#uses=1]
  %1107 = icmp sgt i32 %allocated_results.35, 37  ; <i1> [#uses=1]
  %or.cond2799 = and i1 %1107, %.not2798          ; <i1> [#uses=1]
  br i1 %or.cond2799, label %_Z22test_hoisted_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit, label %bb1.i.i2121

bb1.i.i2121:                                      ; preds = %bb5.i2119
  %1108 = add nsw i32 %allocated_results.35, 10   ; <i32> [#uses=3]
  %1109 = mul i32 %1108, 12                       ; <i32> [#uses=1]
  %1110 = bitcast %struct.one_result* %results.35 to i8* ; <i8*> [#uses=1]
  %1111 = tail call i8* @realloc(i8* %1110, i32 %1109) nounwind ; <i8*> [#uses=2]
  %1112 = bitcast i8* %1111 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1113 = icmp eq i8* %1111, null                 ; <i1> [#uses=1]
  br i1 %1113, label %bb2.i.i2122, label %_Z22test_hoisted_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit

bb2.i.i2122:                                      ; preds = %bb1.i.i2121
  %1114 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1108) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2121, %bb5.i2119
  %results.36 = phi %struct.one_result* [ %1112, %bb1.i.i2121 ], [ %results.35, %bb5.i2119 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.36 = phi i32 [ %1108, %bb1.i.i2121 ], [ %allocated_results.35, %bb5.i2119 ] ; <i32> [#uses=3]
  %1115 = phi %struct.one_result* [ %1112, %bb1.i.i2121 ], [ %results.35, %bb5.i2119 ] ; <%struct.one_result*> [#uses=2]
  %1116 = getelementptr inbounds %struct.one_result* %1115, i32 37, i32 0 ; <double*> [#uses=1]
  store double %1106, double* %1116, align 4
  %1117 = getelementptr inbounds %struct.one_result* %1115, i32 37, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str49, i32 0, i32 0), i8** %1117, align 4
  %1118 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2087, label %bb5.i2101

bb.nph6.i2087:                                    ; preds = %_Z22test_hoisted_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit
  %1119 = add i16 %1056, %1055                    ; <i16> [#uses=1]
  %1120 = add i16 %1119, %1057                    ; <i16> [#uses=1]
  %1121 = add i16 %1120, %1062                    ; <i16> [#uses=2]
  %1122 = add i16 %1121, %1053                    ; <i16> [#uses=1]
  %1123 = mul i16 %1122, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2090

bb2.preheader.us.i2090:                           ; preds = %_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2087
  %i.05.us.i2088 = phi i32 [ 0, %bb.nph6.i2087 ], [ %tmp.i2089, %_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2089 = add i32 %i.05.us.i2088, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2096

_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2100, %bb.i1.us.i2091
  %1124 = icmp slt i32 %tmp.i2089, %iterations.0  ; <i1> [#uses=1]
  br i1 %1124, label %bb2.preheader.us.i2090, label %bb5.i2101

bb.i1.us.i2091:                                   ; preds = %bb2.bb3_crit_edge.us.i2100
  %1125 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 38) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2096:                                     ; preds = %bb1.us.i2096, %bb2.preheader.us.i2090
  %result.03.us.i2092 = phi i16 [ 0, %bb2.preheader.us.i2090 ], [ %1128, %bb1.us.i2096 ] ; <i16> [#uses=1]
  %n.02.us.i2093 = phi i32 [ 0, %bb2.preheader.us.i2090 ], [ %1129, %bb1.us.i2096 ] ; <i32> [#uses=2]
  %scevgep.i2094 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2093 ; <i16*> [#uses=1]
  %1126 = load i16* %scevgep.i2094, align 2       ; <i16> [#uses=1]
  %1127 = add i16 %1121, %result.03.us.i2092      ; <i16> [#uses=1]
  %1128 = add i16 %1127, %1126                    ; <i16> [#uses=2]
  %1129 = add nsw i32 %n.02.us.i2093, 1           ; <i32> [#uses=2]
  %exitcond.i2095 = icmp eq i32 %1129, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2095, label %bb2.bb3_crit_edge.us.i2100, label %bb1.us.i2096

bb2.bb3_crit_edge.us.i2100:                       ; preds = %bb1.us.i2096
  %1130 = sub i16 %1128, %1123                    ; <i16> [#uses=2]
  %1131 = sext i16 %1130 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2097 = sub i32 0, %1131            ; <i32> [#uses=1]
  %abscond.i.i.us.i2098 = icmp sgt i16 %1130, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2099 = select i1 %abscond.i.i.us.i2098, i32 %1131, i32 %neg.i.i.us.i2097 ; <i32> [#uses=1]
  %1132 = icmp slt i32 %abs.i.i.us.i2099, 1       ; <i1> [#uses=1]
  br i1 %1132, label %_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2091

bb5.i2101:                                        ; preds = %_Z26check_shifted_variable_sumIs28custom_add_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Is19custom_add_variableIsEEvPT_iS2_PKc.exit
  %1133 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1134 = sub i32 %1133, %1118                    ; <i32> [#uses=1]
  %1135 = sitofp i32 %1134 to double              ; <double> [#uses=1]
  %1136 = fdiv double %1135, 1.000000e+06         ; <double> [#uses=1]
  %.not2800 = icmp ne %struct.one_result* %results.36, null ; <i1> [#uses=1]
  %1137 = icmp sgt i32 %allocated_results.36, 38  ; <i1> [#uses=1]
  %or.cond2801 = and i1 %1137, %.not2800          ; <i1> [#uses=1]
  br i1 %or.cond2801, label %_Z14test_variable4Is28custom_add_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2103

bb1.i.i2103:                                      ; preds = %bb5.i2101
  %1138 = add nsw i32 %allocated_results.36, 10   ; <i32> [#uses=3]
  %1139 = mul i32 %1138, 12                       ; <i32> [#uses=1]
  %1140 = bitcast %struct.one_result* %results.36 to i8* ; <i8*> [#uses=1]
  %1141 = tail call i8* @realloc(i8* %1140, i32 %1139) nounwind ; <i8*> [#uses=2]
  %1142 = bitcast i8* %1141 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1143 = icmp eq i8* %1141, null                 ; <i1> [#uses=1]
  br i1 %1143, label %bb2.i.i2104, label %_Z14test_variable4Is28custom_add_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2104:                                      ; preds = %bb1.i.i2103
  %1144 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1138) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is28custom_add_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2103, %bb5.i2101
  %results.37 = phi %struct.one_result* [ %1142, %bb1.i.i2103 ], [ %results.36, %bb5.i2101 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.37 = phi i32 [ %1138, %bb1.i.i2103 ], [ %allocated_results.36, %bb5.i2101 ] ; <i32> [#uses=3]
  %1145 = phi %struct.one_result* [ %1142, %bb1.i.i2103 ], [ %results.36, %bb5.i2101 ] ; <%struct.one_result*> [#uses=2]
  %1146 = getelementptr inbounds %struct.one_result* %1145, i32 38, i32 0 ; <double*> [#uses=1]
  store double %1136, double* %1146, align 4
  %1147 = getelementptr inbounds %struct.one_result* %1145, i32 38, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str50, i32 0, i32 0), i8** %1147, align 4
  %1148 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2069, label %bb5.i2083

bb.nph6.i2069:                                    ; preds = %_Z14test_variable4Is28custom_add_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1149 = sub i16 %1053, %1055                    ; <i16> [#uses=1]
  %1150 = mul i16 %1149, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2072

bb2.preheader.us.i2072:                           ; preds = %_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i, %bb.nph6.i2069
  %i.05.us.i2070 = phi i32 [ 0, %bb.nph6.i2069 ], [ %tmp.i2071, %_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2071 = add i32 %i.05.us.i2070, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2078

_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2082, %bb.i1.us.i2073
  %1151 = icmp slt i32 %tmp.i2071, %iterations.0  ; <i1> [#uses=1]
  br i1 %1151, label %bb2.preheader.us.i2072, label %bb5.i2083

bb.i1.us.i2073:                                   ; preds = %bb2.bb3_crit_edge.us.i2082
  %1152 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 39) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i

bb1.us.i2078:                                     ; preds = %bb1.us.i2078, %bb2.preheader.us.i2072
  %result.03.us.i2074 = phi i16 [ 0, %bb2.preheader.us.i2072 ], [ %1155, %bb1.us.i2078 ] ; <i16> [#uses=1]
  %n.02.us.i2075 = phi i32 [ 0, %bb2.preheader.us.i2072 ], [ %1156, %bb1.us.i2078 ] ; <i32> [#uses=2]
  %scevgep.i2076 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2075 ; <i16*> [#uses=1]
  %1153 = load i16* %scevgep.i2076, align 2       ; <i16> [#uses=1]
  %1154 = sub i16 %result.03.us.i2074, %1055      ; <i16> [#uses=1]
  %1155 = add i16 %1154, %1153                    ; <i16> [#uses=2]
  %1156 = add nsw i32 %n.02.us.i2075, 1           ; <i32> [#uses=2]
  %exitcond.i2077 = icmp eq i32 %1156, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2077, label %bb2.bb3_crit_edge.us.i2082, label %bb1.us.i2078

bb2.bb3_crit_edge.us.i2082:                       ; preds = %bb1.us.i2078
  %1157 = sub i16 %1155, %1150                    ; <i16> [#uses=2]
  %1158 = sext i16 %1157 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2079 = sub i32 0, %1158            ; <i32> [#uses=1]
  %abscond.i.i.us.i2080 = icmp sgt i16 %1157, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2081 = select i1 %abscond.i.i.us.i2080, i32 %1158, i32 %neg.i.i.us.i2079 ; <i32> [#uses=1]
  %1159 = icmp slt i32 %abs.i.i.us.i2081, 1       ; <i1> [#uses=1]
  br i1 %1159, label %_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i, label %bb.i1.us.i2073

bb5.i2083:                                        ; preds = %_Z26check_shifted_variable_sumIs19custom_sub_variableIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is28custom_add_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1160 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1161 = sub i32 %1160, %1148                    ; <i32> [#uses=1]
  %1162 = sitofp i32 %1161 to double              ; <double> [#uses=1]
  %1163 = fdiv double %1162, 1.000000e+06         ; <double> [#uses=1]
  %.not2802 = icmp ne %struct.one_result* %results.37, null ; <i1> [#uses=1]
  %1164 = icmp sgt i32 %allocated_results.37, 39  ; <i1> [#uses=1]
  %or.cond2803 = and i1 %1164, %.not2802          ; <i1> [#uses=1]
  br i1 %or.cond2803, label %_Z14test_variable1Is19custom_sub_variableIsEEvPT_iS2_PKc.exit, label %bb1.i.i2085

bb1.i.i2085:                                      ; preds = %bb5.i2083
  %1165 = add nsw i32 %allocated_results.37, 10   ; <i32> [#uses=3]
  %1166 = mul i32 %1165, 12                       ; <i32> [#uses=1]
  %1167 = bitcast %struct.one_result* %results.37 to i8* ; <i8*> [#uses=1]
  %1168 = tail call i8* @realloc(i8* %1167, i32 %1166) nounwind ; <i8*> [#uses=2]
  %1169 = bitcast i8* %1168 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1170 = icmp eq i8* %1168, null                 ; <i1> [#uses=1]
  br i1 %1170, label %bb2.i.i2086, label %_Z14test_variable1Is19custom_sub_variableIsEEvPT_iS2_PKc.exit

bb2.i.i2086:                                      ; preds = %bb1.i.i2085
  %1171 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1165) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is19custom_sub_variableIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2085, %bb5.i2083
  %results.38 = phi %struct.one_result* [ %1169, %bb1.i.i2085 ], [ %results.37, %bb5.i2083 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.38 = phi i32 [ %1165, %bb1.i.i2085 ], [ %allocated_results.37, %bb5.i2083 ] ; <i32> [#uses=3]
  %1172 = phi %struct.one_result* [ %1169, %bb1.i.i2085 ], [ %results.37, %bb5.i2083 ] ; <%struct.one_result*> [#uses=2]
  %1173 = getelementptr inbounds %struct.one_result* %1172, i32 39, i32 0 ; <double*> [#uses=1]
  store double %1163, double* %1173, align 4
  %1174 = getelementptr inbounds %struct.one_result* %1172, i32 39, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str51, i32 0, i32 0), i8** %1174, align 4
  %1175 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i2051, label %bb5.i2065

bb.nph8.i2051:                                    ; preds = %_Z14test_variable1Is19custom_sub_variableIsEEvPT_iS2_PKc.exit
  %sum9.i2049 = add i16 %1056, %1055              ; <i16> [#uses=2]
  %1176 = sub i16 0, %sum9.i2049                  ; <i16> [#uses=1]
  %1177 = sub i16 %1176, %1057                    ; <i16> [#uses=1]
  %1178 = sub i16 %1177, %1062                    ; <i16> [#uses=1]
  %sum.i2050 = add i16 %sum9.i2049, %1057         ; <i16> [#uses=1]
  %1179 = sub i16 0, %sum.i2050                   ; <i16> [#uses=1]
  %1180 = sub i16 %1179, %1062                    ; <i16> [#uses=1]
  %1181 = add i16 %1180, %1053                    ; <i16> [#uses=1]
  %1182 = mul i16 %1181, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2054

bb2.preheader.us.i2054:                           ; preds = %_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i2051
  %i.07.us.i2052 = phi i32 [ 0, %bb.nph8.i2051 ], [ %tmp.i2053, %_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2053 = add i32 %i.07.us.i2052, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2060

_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2064, %bb.i1.us.i2055
  %1183 = icmp slt i32 %tmp.i2053, %iterations.0  ; <i1> [#uses=1]
  br i1 %1183, label %bb2.preheader.us.i2054, label %bb5.i2065

bb.i1.us.i2055:                                   ; preds = %bb2.bb3_crit_edge.us.i2064
  %1184 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 40) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2060:                                     ; preds = %bb1.us.i2060, %bb2.preheader.us.i2054
  %result.05.us.i2056 = phi i16 [ 0, %bb2.preheader.us.i2054 ], [ %1187, %bb1.us.i2060 ] ; <i16> [#uses=1]
  %n.04.us.i2057 = phi i32 [ 0, %bb2.preheader.us.i2054 ], [ %1188, %bb1.us.i2060 ] ; <i32> [#uses=2]
  %scevgep.i2058 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.04.us.i2057 ; <i16*> [#uses=1]
  %1185 = load i16* %scevgep.i2058, align 2       ; <i16> [#uses=1]
  %1186 = add i16 %1178, %result.05.us.i2056      ; <i16> [#uses=1]
  %1187 = add i16 %1186, %1185                    ; <i16> [#uses=2]
  %1188 = add nsw i32 %n.04.us.i2057, 1           ; <i32> [#uses=2]
  %exitcond.i2059 = icmp eq i32 %1188, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2059, label %bb2.bb3_crit_edge.us.i2064, label %bb1.us.i2060

bb2.bb3_crit_edge.us.i2064:                       ; preds = %bb1.us.i2060
  %1189 = sub i16 %1187, %1182                    ; <i16> [#uses=2]
  %1190 = sext i16 %1189 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2061 = sub i32 0, %1190            ; <i32> [#uses=1]
  %abscond.i.i.us.i2062 = icmp sgt i16 %1189, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2063 = select i1 %abscond.i.i.us.i2062, i32 %1190, i32 %neg.i.i.us.i2061 ; <i32> [#uses=1]
  %1191 = icmp slt i32 %abs.i.i.us.i2063, 1       ; <i1> [#uses=1]
  br i1 %1191, label %_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2055

bb5.i2065:                                        ; preds = %_Z26check_shifted_variable_sumIs28custom_sub_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is19custom_sub_variableIsEEvPT_iS2_PKc.exit
  %1192 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1193 = sub i32 %1192, %1175                    ; <i32> [#uses=1]
  %1194 = sitofp i32 %1193 to double              ; <double> [#uses=1]
  %1195 = fdiv double %1194, 1.000000e+06         ; <double> [#uses=1]
  %.not2804 = icmp ne %struct.one_result* %results.38, null ; <i1> [#uses=1]
  %1196 = icmp sgt i32 %allocated_results.38, 40  ; <i1> [#uses=1]
  %or.cond2805 = and i1 %1196, %.not2804          ; <i1> [#uses=1]
  br i1 %or.cond2805, label %_Z14test_variable4Is28custom_sub_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2067

bb1.i.i2067:                                      ; preds = %bb5.i2065
  %1197 = add nsw i32 %allocated_results.38, 10   ; <i32> [#uses=3]
  %1198 = mul i32 %1197, 12                       ; <i32> [#uses=1]
  %1199 = bitcast %struct.one_result* %results.38 to i8* ; <i8*> [#uses=1]
  %1200 = tail call i8* @realloc(i8* %1199, i32 %1198) nounwind ; <i8*> [#uses=2]
  %1201 = bitcast i8* %1200 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1202 = icmp eq i8* %1200, null                 ; <i1> [#uses=1]
  br i1 %1202, label %bb2.i.i2068, label %_Z14test_variable4Is28custom_sub_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2068:                                      ; preds = %bb1.i.i2067
  %1203 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1197) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is28custom_sub_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2067, %bb5.i2065
  %results.39 = phi %struct.one_result* [ %1201, %bb1.i.i2067 ], [ %results.38, %bb5.i2065 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.39 = phi i32 [ %1197, %bb1.i.i2067 ], [ %allocated_results.38, %bb5.i2065 ] ; <i32> [#uses=3]
  %1204 = phi %struct.one_result* [ %1201, %bb1.i.i2067 ], [ %results.38, %bb5.i2065 ] ; <%struct.one_result*> [#uses=2]
  %1205 = getelementptr inbounds %struct.one_result* %1204, i32 40, i32 0 ; <double*> [#uses=1]
  store double %1195, double* %1205, align 4
  %1206 = getelementptr inbounds %struct.one_result* %1204, i32 40, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str52, i32 0, i32 0), i8** %1206, align 4
  %1207 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2031, label %bb5.i2045

bb.nph6.i2031:                                    ; preds = %_Z14test_variable4Is28custom_sub_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1208 = mul i16 %1055, 8000                     ; <i16> [#uses=1]
  %1209 = mul i16 %1208, %1053                    ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2034

bb2.preheader.us.i2034:                           ; preds = %_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i, %bb.nph6.i2031
  %i.05.us.i2032 = phi i32 [ 0, %bb.nph6.i2031 ], [ %tmp.i2033, %_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2033 = add i32 %i.05.us.i2032, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2040

_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2044, %bb.i1.us.i2035
  %1210 = icmp slt i32 %tmp.i2033, %iterations.0  ; <i1> [#uses=1]
  br i1 %1210, label %bb2.preheader.us.i2034, label %bb5.i2045

bb.i1.us.i2035:                                   ; preds = %bb2.bb3_crit_edge.us.i2044
  %1211 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 41) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i

bb1.us.i2040:                                     ; preds = %bb1.us.i2040, %bb2.preheader.us.i2034
  %result.03.us.i2036 = phi i16 [ 0, %bb2.preheader.us.i2034 ], [ %1214, %bb1.us.i2040 ] ; <i16> [#uses=1]
  %n.02.us.i2037 = phi i32 [ 0, %bb2.preheader.us.i2034 ], [ %1215, %bb1.us.i2040 ] ; <i32> [#uses=2]
  %scevgep.i2038 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2037 ; <i16*> [#uses=1]
  %1212 = load i16* %scevgep.i2038, align 2       ; <i16> [#uses=1]
  %1213 = mul i16 %1212, %1055                    ; <i16> [#uses=1]
  %1214 = add i16 %1213, %result.03.us.i2036      ; <i16> [#uses=2]
  %1215 = add nsw i32 %n.02.us.i2037, 1           ; <i32> [#uses=2]
  %exitcond.i2039 = icmp eq i32 %1215, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2039, label %bb2.bb3_crit_edge.us.i2044, label %bb1.us.i2040

bb2.bb3_crit_edge.us.i2044:                       ; preds = %bb1.us.i2040
  %1216 = sub i16 %1214, %1209                    ; <i16> [#uses=2]
  %1217 = sext i16 %1216 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2041 = sub i32 0, %1217            ; <i32> [#uses=1]
  %abscond.i.i.us.i2042 = icmp sgt i16 %1216, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2043 = select i1 %abscond.i.i.us.i2042, i32 %1217, i32 %neg.i.i.us.i2041 ; <i32> [#uses=1]
  %1218 = icmp slt i32 %abs.i.i.us.i2043, 1       ; <i1> [#uses=1]
  br i1 %1218, label %_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i, label %bb.i1.us.i2035

bb5.i2045:                                        ; preds = %_Z26check_shifted_variable_sumIs24custom_multiply_variableIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is28custom_sub_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1219 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1220 = sub i32 %1219, %1207                    ; <i32> [#uses=1]
  %1221 = sitofp i32 %1220 to double              ; <double> [#uses=1]
  %1222 = fdiv double %1221, 1.000000e+06         ; <double> [#uses=1]
  %.not2806 = icmp ne %struct.one_result* %results.39, null ; <i1> [#uses=1]
  %1223 = icmp sgt i32 %allocated_results.39, 41  ; <i1> [#uses=1]
  %or.cond2807 = and i1 %1223, %.not2806          ; <i1> [#uses=1]
  br i1 %or.cond2807, label %_Z14test_variable1Is24custom_multiply_variableIsEEvPT_iS2_PKc.exit, label %bb1.i.i2047

bb1.i.i2047:                                      ; preds = %bb5.i2045
  %1224 = add nsw i32 %allocated_results.39, 10   ; <i32> [#uses=3]
  %1225 = mul i32 %1224, 12                       ; <i32> [#uses=1]
  %1226 = bitcast %struct.one_result* %results.39 to i8* ; <i8*> [#uses=1]
  %1227 = tail call i8* @realloc(i8* %1226, i32 %1225) nounwind ; <i8*> [#uses=2]
  %1228 = bitcast i8* %1227 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1229 = icmp eq i8* %1227, null                 ; <i1> [#uses=1]
  br i1 %1229, label %bb2.i.i2048, label %_Z14test_variable1Is24custom_multiply_variableIsEEvPT_iS2_PKc.exit

bb2.i.i2048:                                      ; preds = %bb1.i.i2047
  %1230 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1224) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is24custom_multiply_variableIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i2047, %bb5.i2045
  %results.40 = phi %struct.one_result* [ %1228, %bb1.i.i2047 ], [ %results.39, %bb5.i2045 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.40 = phi i32 [ %1224, %bb1.i.i2047 ], [ %allocated_results.39, %bb5.i2045 ] ; <i32> [#uses=3]
  %1231 = phi %struct.one_result* [ %1228, %bb1.i.i2047 ], [ %results.39, %bb5.i2045 ] ; <%struct.one_result*> [#uses=2]
  %1232 = getelementptr inbounds %struct.one_result* %1231, i32 41, i32 0 ; <double*> [#uses=1]
  store double %1222, double* %1232, align 4
  %1233 = getelementptr inbounds %struct.one_result* %1231, i32 41, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str53, i32 0, i32 0), i8** %1233, align 4
  %1234 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i2013, label %bb5.i2027

bb.nph6.i2013:                                    ; preds = %_Z14test_variable1Is24custom_multiply_variableIsEEvPT_iS2_PKc.exit
  %1235 = mul i16 %1056, %1055                    ; <i16> [#uses=1]
  %1236 = mul i16 %1235, %1057                    ; <i16> [#uses=1]
  %1237 = mul i16 %1236, %1062                    ; <i16> [#uses=1]
  %1238 = mul i16 %1055, 8000                     ; <i16> [#uses=1]
  %1239 = mul i16 %1238, %1056                    ; <i16> [#uses=1]
  %1240 = mul i16 %1239, %1057                    ; <i16> [#uses=1]
  %1241 = mul i16 %1240, %1062                    ; <i16> [#uses=1]
  %1242 = mul i16 %1241, %1053                    ; <i16> [#uses=1]
  br label %bb2.preheader.us.i2016

bb2.preheader.us.i2016:                           ; preds = %_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i2013
  %i.05.us.i2014 = phi i32 [ 0, %bb.nph6.i2013 ], [ %tmp.i2015, %_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i2015 = add i32 %i.05.us.i2014, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2022

_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2026, %bb.i1.us.i2017
  %1243 = icmp slt i32 %tmp.i2015, %iterations.0  ; <i1> [#uses=1]
  br i1 %1243, label %bb2.preheader.us.i2016, label %bb5.i2027

bb.i1.us.i2017:                                   ; preds = %bb2.bb3_crit_edge.us.i2026
  %1244 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 42) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2022:                                     ; preds = %bb1.us.i2022, %bb2.preheader.us.i2016
  %result.03.us.i2018 = phi i16 [ 0, %bb2.preheader.us.i2016 ], [ %1247, %bb1.us.i2022 ] ; <i16> [#uses=1]
  %n.02.us.i2019 = phi i32 [ 0, %bb2.preheader.us.i2016 ], [ %1248, %bb1.us.i2022 ] ; <i32> [#uses=2]
  %scevgep.i2020 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2019 ; <i16*> [#uses=1]
  %1245 = load i16* %scevgep.i2020, align 2       ; <i16> [#uses=1]
  %1246 = mul i16 %1237, %1245                    ; <i16> [#uses=1]
  %1247 = add i16 %1246, %result.03.us.i2018      ; <i16> [#uses=2]
  %1248 = add nsw i32 %n.02.us.i2019, 1           ; <i32> [#uses=2]
  %exitcond.i2021 = icmp eq i32 %1248, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2021, label %bb2.bb3_crit_edge.us.i2026, label %bb1.us.i2022

bb2.bb3_crit_edge.us.i2026:                       ; preds = %bb1.us.i2022
  %1249 = sub i16 %1247, %1242                    ; <i16> [#uses=2]
  %1250 = sext i16 %1249 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2023 = sub i32 0, %1250            ; <i32> [#uses=1]
  %abscond.i.i.us.i2024 = icmp sgt i16 %1249, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2025 = select i1 %abscond.i.i.us.i2024, i32 %1250, i32 %neg.i.i.us.i2023 ; <i32> [#uses=1]
  %1251 = icmp slt i32 %abs.i.i.us.i2025, 1       ; <i1> [#uses=1]
  br i1 %1251, label %_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i2017

bb5.i2027:                                        ; preds = %_Z26check_shifted_variable_sumIs33custom_multiply_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is24custom_multiply_variableIsEEvPT_iS2_PKc.exit
  %1252 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1253 = sub i32 %1252, %1234                    ; <i32> [#uses=1]
  %1254 = sitofp i32 %1253 to double              ; <double> [#uses=1]
  %1255 = fdiv double %1254, 1.000000e+06         ; <double> [#uses=1]
  %.not2808 = icmp ne %struct.one_result* %results.40, null ; <i1> [#uses=1]
  %1256 = icmp sgt i32 %allocated_results.40, 42  ; <i1> [#uses=1]
  %or.cond2809 = and i1 %1256, %.not2808          ; <i1> [#uses=1]
  br i1 %or.cond2809, label %_Z14test_variable4Is33custom_multiply_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2029

bb1.i.i2029:                                      ; preds = %bb5.i2027
  %1257 = add nsw i32 %allocated_results.40, 10   ; <i32> [#uses=3]
  %1258 = mul i32 %1257, 12                       ; <i32> [#uses=1]
  %1259 = bitcast %struct.one_result* %results.40 to i8* ; <i8*> [#uses=1]
  %1260 = tail call i8* @realloc(i8* %1259, i32 %1258) nounwind ; <i8*> [#uses=2]
  %1261 = bitcast i8* %1260 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1262 = icmp eq i8* %1260, null                 ; <i1> [#uses=1]
  br i1 %1262, label %bb2.i.i2030, label %_Z14test_variable4Is33custom_multiply_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2030:                                      ; preds = %bb1.i.i2029
  %1263 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1257) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is33custom_multiply_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2029, %bb5.i2027
  %results.41 = phi %struct.one_result* [ %1261, %bb1.i.i2029 ], [ %results.40, %bb5.i2027 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.41 = phi i32 [ %1257, %bb1.i.i2029 ], [ %allocated_results.40, %bb5.i2027 ] ; <i32> [#uses=3]
  %1264 = phi %struct.one_result* [ %1261, %bb1.i.i2029 ], [ %results.40, %bb5.i2027 ] ; <%struct.one_result*> [#uses=2]
  %1265 = getelementptr inbounds %struct.one_result* %1264, i32 42, i32 0 ; <double*> [#uses=1]
  store double %1255, double* %1265, align 4
  %1266 = getelementptr inbounds %struct.one_result* %1264, i32 42, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str54, i32 0, i32 0), i8** %1266, align 4
  %1267 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1995, label %bb5.i2009

bb.nph6.i1995:                                    ; preds = %_Z14test_variable4Is33custom_multiply_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1268 = mul i16 %1056, %1055                    ; <i16> [#uses=1]
  %1269 = mul i16 %1268, %1057                    ; <i16> [#uses=1]
  %1270 = mul i16 %1269, %1062                    ; <i16> [#uses=2]
  %1271 = add i16 %1053, %1270                    ; <i16> [#uses=1]
  %1272 = mul i16 %1271, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1998

bb2.preheader.us.i1998:                           ; preds = %_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1995
  %i.05.us.i1996 = phi i32 [ 0, %bb.nph6.i1995 ], [ %tmp.i1997, %_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1997 = add i32 %i.05.us.i1996, 1          ; <i32> [#uses=2]
  br label %bb1.us.i2004

_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i2008, %bb.i1.us.i1999
  %1273 = icmp slt i32 %tmp.i1997, %iterations.0  ; <i1> [#uses=1]
  br i1 %1273, label %bb2.preheader.us.i1998, label %bb5.i2009

bb.i1.us.i1999:                                   ; preds = %bb2.bb3_crit_edge.us.i2008
  %1274 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 43) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i2004:                                     ; preds = %bb1.us.i2004, %bb2.preheader.us.i1998
  %result.03.us.i2000 = phi i16 [ 0, %bb2.preheader.us.i1998 ], [ %1277, %bb1.us.i2004 ] ; <i16> [#uses=1]
  %n.02.us.i2001 = phi i32 [ 0, %bb2.preheader.us.i1998 ], [ %1278, %bb1.us.i2004 ] ; <i32> [#uses=2]
  %scevgep.i2002 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i2001 ; <i16*> [#uses=1]
  %1275 = load i16* %scevgep.i2002, align 2       ; <i16> [#uses=1]
  %1276 = add i16 %result.03.us.i2000, %1270      ; <i16> [#uses=1]
  %1277 = add i16 %1276, %1275                    ; <i16> [#uses=2]
  %1278 = add nsw i32 %n.02.us.i2001, 1           ; <i32> [#uses=2]
  %exitcond.i2003 = icmp eq i32 %1278, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i2003, label %bb2.bb3_crit_edge.us.i2008, label %bb1.us.i2004

bb2.bb3_crit_edge.us.i2008:                       ; preds = %bb1.us.i2004
  %1279 = sub i16 %1277, %1272                    ; <i16> [#uses=2]
  %1280 = sext i16 %1279 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i2005 = sub i32 0, %1280            ; <i32> [#uses=1]
  %abscond.i.i.us.i2006 = icmp sgt i16 %1279, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i2007 = select i1 %abscond.i.i.us.i2006, i32 %1280, i32 %neg.i.i.us.i2005 ; <i32> [#uses=1]
  %1281 = icmp slt i32 %abs.i.i.us.i2007, 1       ; <i1> [#uses=1]
  br i1 %1281, label %_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1999

bb5.i2009:                                        ; preds = %_Z26check_shifted_variable_sumIs34custom_multiply_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Is33custom_multiply_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1282 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1283 = sub i32 %1282, %1267                    ; <i32> [#uses=1]
  %1284 = sitofp i32 %1283 to double              ; <double> [#uses=1]
  %1285 = fdiv double %1284, 1.000000e+06         ; <double> [#uses=1]
  %.not2810 = icmp ne %struct.one_result* %results.41, null ; <i1> [#uses=1]
  %1286 = icmp sgt i32 %allocated_results.41, 43  ; <i1> [#uses=1]
  %or.cond2811 = and i1 %1286, %.not2810          ; <i1> [#uses=1]
  br i1 %or.cond2811, label %_Z14test_variable4Is34custom_multiply_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i2011

bb1.i.i2011:                                      ; preds = %bb5.i2009
  %1287 = add nsw i32 %allocated_results.41, 10   ; <i32> [#uses=3]
  %1288 = mul i32 %1287, 12                       ; <i32> [#uses=1]
  %1289 = bitcast %struct.one_result* %results.41 to i8* ; <i8*> [#uses=1]
  %1290 = tail call i8* @realloc(i8* %1289, i32 %1288) nounwind ; <i8*> [#uses=2]
  %1291 = bitcast i8* %1290 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1292 = icmp eq i8* %1290, null                 ; <i1> [#uses=1]
  br i1 %1292, label %bb2.i.i2012, label %_Z14test_variable4Is34custom_multiply_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i2012:                                      ; preds = %bb1.i.i2011
  %1293 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1287) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is34custom_multiply_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i2011, %bb5.i2009
  %results.42 = phi %struct.one_result* [ %1291, %bb1.i.i2011 ], [ %results.41, %bb5.i2009 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.42 = phi i32 [ %1287, %bb1.i.i2011 ], [ %allocated_results.41, %bb5.i2009 ] ; <i32> [#uses=3]
  %1294 = phi %struct.one_result* [ %1291, %bb1.i.i2011 ], [ %results.41, %bb5.i2009 ] ; <%struct.one_result*> [#uses=2]
  %1295 = getelementptr inbounds %struct.one_result* %1294, i32 43, i32 0 ; <double*> [#uses=1]
  store double %1285, double* %1295, align 4
  %1296 = getelementptr inbounds %struct.one_result* %1294, i32 43, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str55, i32 0, i32 0), i8** %1296, align 4
  %1297 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1975, label %bb5.i1991

bb.nph6.i1975:                                    ; preds = %_Z14test_variable4Is34custom_multiply_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1298 = sext i16 %1055 to i32                   ; <i32> [#uses=2]
  %1299 = sext i16 %1053 to i32                   ; <i32> [#uses=1]
  %1300 = sdiv i32 %1299, %1298                   ; <i32> [#uses=1]
  %retval12.i.i.us.i1986 = trunc i32 %1300 to i16 ; <i16> [#uses=1]
  %1301 = mul i16 %retval12.i.i.us.i1986, 8000    ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1978

bb2.preheader.us.i1978:                           ; preds = %_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i, %bb.nph6.i1975
  %i.05.us.i1976 = phi i32 [ 0, %bb.nph6.i1975 ], [ %tmp.i1977, %_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1977 = add i32 %i.05.us.i1976, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1985

_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1990, %bb.i1.us.i1979
  %1302 = icmp slt i32 %tmp.i1977, %iterations.0  ; <i1> [#uses=1]
  br i1 %1302, label %bb2.preheader.us.i1978, label %bb5.i1991

bb.i1.us.i1979:                                   ; preds = %bb2.bb3_crit_edge.us.i1990
  %1303 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 44) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i

bb1.us.i1985:                                     ; preds = %bb1.us.i1985, %bb2.preheader.us.i1978
  %result.03.us.i1980 = phi i16 [ 0, %bb2.preheader.us.i1978 ], [ %1307, %bb1.us.i1985 ] ; <i16> [#uses=1]
  %n.02.us.i1981 = phi i32 [ 0, %bb2.preheader.us.i1978 ], [ %1308, %bb1.us.i1985 ] ; <i32> [#uses=2]
  %scevgep.i1982 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1981 ; <i16*> [#uses=1]
  %1304 = load i16* %scevgep.i1982, align 2       ; <i16> [#uses=1]
  %1305 = sext i16 %1304 to i32                   ; <i32> [#uses=1]
  %1306 = sdiv i32 %1305, %1298                   ; <i32> [#uses=1]
  %retval12.i.us.i1983 = trunc i32 %1306 to i16   ; <i16> [#uses=1]
  %1307 = add i16 %retval12.i.us.i1983, %result.03.us.i1980 ; <i16> [#uses=2]
  %1308 = add nsw i32 %n.02.us.i1981, 1           ; <i32> [#uses=2]
  %exitcond.i1984 = icmp eq i32 %1308, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1984, label %bb2.bb3_crit_edge.us.i1990, label %bb1.us.i1985

bb2.bb3_crit_edge.us.i1990:                       ; preds = %bb1.us.i1985
  %1309 = sub i16 %1307, %1301                    ; <i16> [#uses=2]
  %1310 = sext i16 %1309 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1987 = sub i32 0, %1310            ; <i32> [#uses=1]
  %abscond.i.i.us.i1988 = icmp sgt i16 %1309, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1989 = select i1 %abscond.i.i.us.i1988, i32 %1310, i32 %neg.i.i.us.i1987 ; <i32> [#uses=1]
  %1311 = icmp slt i32 %abs.i.i.us.i1989, 1       ; <i1> [#uses=1]
  br i1 %1311, label %_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i, label %bb.i1.us.i1979

bb5.i1991:                                        ; preds = %_Z26check_shifted_variable_sumIs22custom_divide_variableIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is34custom_multiply_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1312 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1313 = sub i32 %1312, %1297                    ; <i32> [#uses=1]
  %1314 = sitofp i32 %1313 to double              ; <double> [#uses=1]
  %1315 = fdiv double %1314, 1.000000e+06         ; <double> [#uses=1]
  %.not2812 = icmp ne %struct.one_result* %results.42, null ; <i1> [#uses=1]
  %1316 = icmp sgt i32 %allocated_results.42, 44  ; <i1> [#uses=1]
  %or.cond2813 = and i1 %1316, %.not2812          ; <i1> [#uses=1]
  br i1 %or.cond2813, label %_Z14test_variable1Is22custom_divide_variableIsEEvPT_iS2_PKc.exit, label %bb1.i.i1993

bb1.i.i1993:                                      ; preds = %bb5.i1991
  %1317 = add nsw i32 %allocated_results.42, 10   ; <i32> [#uses=3]
  %1318 = mul i32 %1317, 12                       ; <i32> [#uses=1]
  %1319 = bitcast %struct.one_result* %results.42 to i8* ; <i8*> [#uses=1]
  %1320 = tail call i8* @realloc(i8* %1319, i32 %1318) nounwind ; <i8*> [#uses=2]
  %1321 = bitcast i8* %1320 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1322 = icmp eq i8* %1320, null                 ; <i1> [#uses=1]
  br i1 %1322, label %bb2.i.i1994, label %_Z14test_variable1Is22custom_divide_variableIsEEvPT_iS2_PKc.exit

bb2.i.i1994:                                      ; preds = %bb1.i.i1993
  %1323 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1317) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is22custom_divide_variableIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1993, %bb5.i1991
  %results.43 = phi %struct.one_result* [ %1321, %bb1.i.i1993 ], [ %results.42, %bb5.i1991 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.43 = phi i32 [ %1317, %bb1.i.i1993 ], [ %allocated_results.42, %bb5.i1991 ] ; <i32> [#uses=3]
  %1324 = phi %struct.one_result* [ %1321, %bb1.i.i1993 ], [ %results.42, %bb5.i1991 ] ; <%struct.one_result*> [#uses=2]
  %1325 = getelementptr inbounds %struct.one_result* %1324, i32 44, i32 0 ; <double*> [#uses=1]
  store double %1315, double* %1325, align 4
  %1326 = getelementptr inbounds %struct.one_result* %1324, i32 44, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str56, i32 0, i32 0), i8** %1326, align 4
  %1327 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1957, label %bb5.i1971

bb.nph6.i1957:                                    ; preds = %_Z14test_variable1Is22custom_divide_variableIsEEvPT_iS2_PKc.exit
  %1328 = sext i16 %1055 to i32                   ; <i32> [#uses=2]
  %1329 = sext i16 %1062 to i32                   ; <i32> [#uses=2]
  %1330 = sext i16 %1053 to i32                   ; <i32> [#uses=1]
  %1331 = sdiv i32 %1330, %1328                   ; <i32> [#uses=1]
  %1332 = sdiv i32 %1331, %1058                   ; <i32> [#uses=1]
  %1333 = sdiv i32 %1332, %1059                   ; <i32> [#uses=1]
  %1334 = sdiv i32 %1333, %1329                   ; <i32> [#uses=1]
  %retval12.i.i.us.i = trunc i32 %1334 to i16     ; <i16> [#uses=1]
  %1335 = mul i16 %retval12.i.i.us.i, 8000        ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1960

bb2.preheader.us.i1960:                           ; preds = %_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1957
  %i.05.us.i1958 = phi i32 [ 0, %bb.nph6.i1957 ], [ %tmp.i1959, %_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1959 = add i32 %i.05.us.i1958, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1966

_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1970, %bb.i1.us.i1961
  %1336 = icmp slt i32 %tmp.i1959, %iterations.0  ; <i1> [#uses=1]
  br i1 %1336, label %bb2.preheader.us.i1960, label %bb5.i1971

bb.i1.us.i1961:                                   ; preds = %bb2.bb3_crit_edge.us.i1970
  %1337 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 45) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1966:                                     ; preds = %bb1.us.i1966, %bb2.preheader.us.i1960
  %result.03.us.i1962 = phi i16 [ 0, %bb2.preheader.us.i1960 ], [ %1344, %bb1.us.i1966 ] ; <i16> [#uses=1]
  %n.02.us.i1963 = phi i32 [ 0, %bb2.preheader.us.i1960 ], [ %1345, %bb1.us.i1966 ] ; <i32> [#uses=2]
  %scevgep.i1964 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1963 ; <i16*> [#uses=1]
  %1338 = load i16* %scevgep.i1964, align 2       ; <i16> [#uses=1]
  %1339 = sext i16 %1338 to i32                   ; <i32> [#uses=1]
  %1340 = sdiv i32 %1339, %1328                   ; <i32> [#uses=1]
  %1341 = sdiv i32 %1340, %1058                   ; <i32> [#uses=1]
  %1342 = sdiv i32 %1341, %1059                   ; <i32> [#uses=1]
  %1343 = sdiv i32 %1342, %1329                   ; <i32> [#uses=1]
  %retval12.i.us.i = trunc i32 %1343 to i16       ; <i16> [#uses=1]
  %1344 = add i16 %retval12.i.us.i, %result.03.us.i1962 ; <i16> [#uses=2]
  %1345 = add nsw i32 %n.02.us.i1963, 1           ; <i32> [#uses=2]
  %exitcond.i1965 = icmp eq i32 %1345, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1965, label %bb2.bb3_crit_edge.us.i1970, label %bb1.us.i1966

bb2.bb3_crit_edge.us.i1970:                       ; preds = %bb1.us.i1966
  %1346 = sub i16 %1344, %1335                    ; <i16> [#uses=2]
  %1347 = sext i16 %1346 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1967 = sub i32 0, %1347            ; <i32> [#uses=1]
  %abscond.i.i.us.i1968 = icmp sgt i16 %1346, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1969 = select i1 %abscond.i.i.us.i1968, i32 %1347, i32 %neg.i.i.us.i1967 ; <i32> [#uses=1]
  %1348 = icmp slt i32 %abs.i.i.us.i1969, 1       ; <i1> [#uses=1]
  br i1 %1348, label %_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1961

bb5.i1971:                                        ; preds = %_Z26check_shifted_variable_sumIs31custom_divide_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is22custom_divide_variableIsEEvPT_iS2_PKc.exit
  %1349 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1350 = sub i32 %1349, %1327                    ; <i32> [#uses=1]
  %1351 = sitofp i32 %1350 to double              ; <double> [#uses=1]
  %1352 = fdiv double %1351, 1.000000e+06         ; <double> [#uses=1]
  %.not2814 = icmp ne %struct.one_result* %results.43, null ; <i1> [#uses=1]
  %1353 = icmp sgt i32 %allocated_results.43, 45  ; <i1> [#uses=1]
  %or.cond2815 = and i1 %1353, %.not2814          ; <i1> [#uses=1]
  br i1 %or.cond2815, label %_Z14test_variable4Is31custom_divide_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1973

bb1.i.i1973:                                      ; preds = %bb5.i1971
  %1354 = add nsw i32 %allocated_results.43, 10   ; <i32> [#uses=3]
  %1355 = mul i32 %1354, 12                       ; <i32> [#uses=1]
  %1356 = bitcast %struct.one_result* %results.43 to i8* ; <i8*> [#uses=1]
  %1357 = tail call i8* @realloc(i8* %1356, i32 %1355) nounwind ; <i8*> [#uses=2]
  %1358 = bitcast i8* %1357 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1359 = icmp eq i8* %1357, null                 ; <i1> [#uses=1]
  br i1 %1359, label %bb2.i.i1974, label %_Z14test_variable4Is31custom_divide_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1974:                                      ; preds = %bb1.i.i1973
  %1360 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1354) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is31custom_divide_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1973, %bb5.i1971
  %results.44 = phi %struct.one_result* [ %1358, %bb1.i.i1973 ], [ %results.43, %bb5.i1971 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.44 = phi i32 [ %1354, %bb1.i.i1973 ], [ %allocated_results.43, %bb5.i1971 ] ; <i32> [#uses=3]
  %1361 = phi %struct.one_result* [ %1358, %bb1.i.i1973 ], [ %results.43, %bb5.i1971 ] ; <%struct.one_result*> [#uses=2]
  %1362 = getelementptr inbounds %struct.one_result* %1361, i32 45, i32 0 ; <double*> [#uses=1]
  store double %1352, double* %1362, align 4
  %1363 = getelementptr inbounds %struct.one_result* %1361, i32 45, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str57, i32 0, i32 0), i8** %1363, align 4
  %1364 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1939, label %bb5.i1953

bb.nph6.i1939:                                    ; preds = %_Z14test_variable4Is31custom_divide_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1365 = sext i16 %1055 to i32                   ; <i32> [#uses=1]
  %1366 = sext i16 %1062 to i32                   ; <i32> [#uses=1]
  %1367 = sdiv i32 %1365, %1058                   ; <i32> [#uses=1]
  %1368 = sdiv i32 %1367, %1059                   ; <i32> [#uses=1]
  %1369 = sdiv i32 %1368, %1366                   ; <i32> [#uses=1]
  %1370 = trunc i32 %1369 to i16                  ; <i16> [#uses=2]
  %1371 = add i16 %1370, %1053                    ; <i16> [#uses=1]
  %1372 = mul i16 %1371, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1942

bb2.preheader.us.i1942:                           ; preds = %_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1939
  %i.05.us.i1940 = phi i32 [ 0, %bb.nph6.i1939 ], [ %tmp.i1941, %_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1941 = add i32 %i.05.us.i1940, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1948

_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1952, %bb.i1.us.i1943
  %1373 = icmp slt i32 %tmp.i1941, %iterations.0  ; <i1> [#uses=1]
  br i1 %1373, label %bb2.preheader.us.i1942, label %bb5.i1953

bb.i1.us.i1943:                                   ; preds = %bb2.bb3_crit_edge.us.i1952
  %1374 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 46) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1948:                                     ; preds = %bb1.us.i1948, %bb2.preheader.us.i1942
  %result.03.us.i1944 = phi i16 [ 0, %bb2.preheader.us.i1942 ], [ %1377, %bb1.us.i1948 ] ; <i16> [#uses=1]
  %n.02.us.i1945 = phi i32 [ 0, %bb2.preheader.us.i1942 ], [ %1378, %bb1.us.i1948 ] ; <i32> [#uses=2]
  %scevgep.i1946 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1945 ; <i16*> [#uses=1]
  %1375 = load i16* %scevgep.i1946, align 2       ; <i16> [#uses=1]
  %1376 = add i16 %1375, %result.03.us.i1944      ; <i16> [#uses=1]
  %1377 = add i16 %1376, %1370                    ; <i16> [#uses=2]
  %1378 = add nsw i32 %n.02.us.i1945, 1           ; <i32> [#uses=2]
  %exitcond.i1947 = icmp eq i32 %1378, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1947, label %bb2.bb3_crit_edge.us.i1952, label %bb1.us.i1948

bb2.bb3_crit_edge.us.i1952:                       ; preds = %bb1.us.i1948
  %1379 = sub i16 %1377, %1372                    ; <i16> [#uses=2]
  %1380 = sext i16 %1379 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1949 = sub i32 0, %1380            ; <i32> [#uses=1]
  %abscond.i.i.us.i1950 = icmp sgt i16 %1379, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1951 = select i1 %abscond.i.i.us.i1950, i32 %1380, i32 %neg.i.i.us.i1949 ; <i32> [#uses=1]
  %1381 = icmp slt i32 %abs.i.i.us.i1951, 1       ; <i1> [#uses=1]
  br i1 %1381, label %_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1943

bb5.i1953:                                        ; preds = %_Z26check_shifted_variable_sumIs32custom_divide_multiple_variable2IsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Is31custom_divide_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1382 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1383 = sub i32 %1382, %1364                    ; <i32> [#uses=1]
  %1384 = sitofp i32 %1383 to double              ; <double> [#uses=1]
  %1385 = fdiv double %1384, 1.000000e+06         ; <double> [#uses=1]
  %.not2816 = icmp ne %struct.one_result* %results.44, null ; <i1> [#uses=1]
  %1386 = icmp sgt i32 %allocated_results.44, 46  ; <i1> [#uses=1]
  %or.cond2817 = and i1 %1386, %.not2816          ; <i1> [#uses=1]
  br i1 %or.cond2817, label %_Z14test_variable4Is32custom_divide_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1955

bb1.i.i1955:                                      ; preds = %bb5.i1953
  %1387 = add nsw i32 %allocated_results.44, 10   ; <i32> [#uses=3]
  %1388 = mul i32 %1387, 12                       ; <i32> [#uses=1]
  %1389 = bitcast %struct.one_result* %results.44 to i8* ; <i8*> [#uses=1]
  %1390 = tail call i8* @realloc(i8* %1389, i32 %1388) nounwind ; <i8*> [#uses=2]
  %1391 = bitcast i8* %1390 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1392 = icmp eq i8* %1390, null                 ; <i1> [#uses=1]
  br i1 %1392, label %bb2.i.i1956, label %_Z14test_variable4Is32custom_divide_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1956:                                      ; preds = %bb1.i.i1955
  %1393 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1387) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is32custom_divide_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1955, %bb5.i1953
  %results.45 = phi %struct.one_result* [ %1391, %bb1.i.i1955 ], [ %results.44, %bb5.i1953 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.45 = phi i32 [ %1387, %bb1.i.i1955 ], [ %allocated_results.44, %bb5.i1953 ] ; <i32> [#uses=3]
  %1394 = phi %struct.one_result* [ %1391, %bb1.i.i1955 ], [ %results.44, %bb5.i1953 ] ; <%struct.one_result*> [#uses=2]
  %1395 = getelementptr inbounds %struct.one_result* %1394, i32 46, i32 0 ; <double*> [#uses=1]
  store double %1385, double* %1395, align 4
  %1396 = getelementptr inbounds %struct.one_result* %1394, i32 46, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str58, i32 0, i32 0), i8** %1396, align 4
  %1397 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i1921, label %bb5.i1935

bb.nph7.i1921:                                    ; preds = %_Z14test_variable4Is32custom_divide_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1398 = mul i32 %1059, %1058                    ; <i32> [#uses=1]
  %1399 = sext i16 %1062 to i32                   ; <i32> [#uses=1]
  %1400 = sdiv i32 %1398, %1399                   ; <i32> [#uses=1]
  %1401 = trunc i32 %1400 to i16                  ; <i16> [#uses=2]
  %1402 = add i16 %1053, %1055                    ; <i16> [#uses=1]
  %1403 = sub i16 %1402, %1401                    ; <i16> [#uses=1]
  %1404 = mul i16 %1403, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1924

bb2.preheader.us.i1924:                           ; preds = %_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i1921
  %i.06.us.i1922 = phi i32 [ 0, %bb.nph7.i1921 ], [ %tmp.i1923, %_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1923 = add i32 %i.06.us.i1922, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1930

_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1934, %bb.i1.us.i1925
  %1405 = icmp slt i32 %tmp.i1923, %iterations.0  ; <i1> [#uses=1]
  br i1 %1405, label %bb2.preheader.us.i1924, label %bb5.i1935

bb.i1.us.i1925:                                   ; preds = %bb2.bb3_crit_edge.us.i1934
  %1406 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 47) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1930:                                     ; preds = %bb1.us.i1930, %bb2.preheader.us.i1924
  %result.04.us.i1926 = phi i16 [ 0, %bb2.preheader.us.i1924 ], [ %1410, %bb1.us.i1930 ] ; <i16> [#uses=1]
  %n.03.us.i1927 = phi i32 [ 0, %bb2.preheader.us.i1924 ], [ %1411, %bb1.us.i1930 ] ; <i32> [#uses=2]
  %scevgep.i1928 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.03.us.i1927 ; <i16*> [#uses=1]
  %1407 = load i16* %scevgep.i1928, align 2       ; <i16> [#uses=1]
  %1408 = add i16 %result.04.us.i1926, %1055      ; <i16> [#uses=1]
  %1409 = add i16 %1408, %1407                    ; <i16> [#uses=1]
  %1410 = sub i16 %1409, %1401                    ; <i16> [#uses=2]
  %1411 = add nsw i32 %n.03.us.i1927, 1           ; <i32> [#uses=2]
  %exitcond.i1929 = icmp eq i32 %1411, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1929, label %bb2.bb3_crit_edge.us.i1934, label %bb1.us.i1930

bb2.bb3_crit_edge.us.i1934:                       ; preds = %bb1.us.i1930
  %1412 = sub i16 %1410, %1404                    ; <i16> [#uses=2]
  %1413 = sext i16 %1412 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1931 = sub i32 0, %1413            ; <i32> [#uses=1]
  %abscond.i.i.us.i1932 = icmp sgt i16 %1412, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1933 = select i1 %abscond.i.i.us.i1932, i32 %1413, i32 %neg.i.i.us.i1931 ; <i32> [#uses=1]
  %1414 = icmp slt i32 %abs.i.i.us.i1933, 1       ; <i1> [#uses=1]
  br i1 %1414, label %_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1925

bb5.i1935:                                        ; preds = %_Z26check_shifted_variable_sumIs30custom_mixed_multiple_variableIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Is32custom_divide_multiple_variable2IsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1415 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1416 = sub i32 %1415, %1397                    ; <i32> [#uses=1]
  %1417 = sitofp i32 %1416 to double              ; <double> [#uses=1]
  %1418 = fdiv double %1417, 1.000000e+06         ; <double> [#uses=1]
  %.not2818 = icmp ne %struct.one_result* %results.45, null ; <i1> [#uses=1]
  %1419 = icmp sgt i32 %allocated_results.45, 47  ; <i1> [#uses=1]
  %or.cond2819 = and i1 %1419, %.not2818          ; <i1> [#uses=1]
  br i1 %or.cond2819, label %_Z14test_variable4Is30custom_mixed_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1937

bb1.i.i1937:                                      ; preds = %bb5.i1935
  %1420 = add nsw i32 %allocated_results.45, 10   ; <i32> [#uses=3]
  %1421 = mul i32 %1420, 12                       ; <i32> [#uses=1]
  %1422 = bitcast %struct.one_result* %results.45 to i8* ; <i8*> [#uses=1]
  %1423 = tail call i8* @realloc(i8* %1422, i32 %1421) nounwind ; <i8*> [#uses=2]
  %1424 = bitcast i8* %1423 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1425 = icmp eq i8* %1423, null                 ; <i1> [#uses=1]
  br i1 %1425, label %bb2.i.i1938, label %_Z14test_variable4Is30custom_mixed_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1938:                                      ; preds = %bb1.i.i1937
  %1426 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1420) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is30custom_mixed_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1937, %bb5.i1935
  %results.46 = phi %struct.one_result* [ %1424, %bb1.i.i1937 ], [ %results.45, %bb5.i1935 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.46 = phi i32 [ %1420, %bb1.i.i1937 ], [ %allocated_results.45, %bb5.i1935 ] ; <i32> [#uses=3]
  %1427 = phi %struct.one_result* [ %1424, %bb1.i.i1937 ], [ %results.45, %bb5.i1935 ] ; <%struct.one_result*> [#uses=2]
  %1428 = getelementptr inbounds %struct.one_result* %1427, i32 47, i32 0 ; <double*> [#uses=1]
  store double %1418, double* %1428, align 4
  %1429 = getelementptr inbounds %struct.one_result* %1427, i32 47, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str59, i32 0, i32 0), i8** %1429, align 4
  %1430 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1903, label %bb5.i1917

bb.nph6.i1903:                                    ; preds = %_Z14test_variable4Is30custom_mixed_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1431 = and i16 %1053, %1055                    ; <i16> [#uses=1]
  %1432 = mul i16 %1431, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1906

bb2.preheader.us.i1906:                           ; preds = %_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i, %bb.nph6.i1903
  %i.05.us.i1904 = phi i32 [ 0, %bb.nph6.i1903 ], [ %tmp.i1905, %_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1905 = add i32 %i.05.us.i1904, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1912

_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1916, %bb.i1.us.i1907
  %1433 = icmp slt i32 %tmp.i1905, %iterations.0  ; <i1> [#uses=1]
  br i1 %1433, label %bb2.preheader.us.i1906, label %bb5.i1917

bb.i1.us.i1907:                                   ; preds = %bb2.bb3_crit_edge.us.i1916
  %1434 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 48) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i

bb1.us.i1912:                                     ; preds = %bb1.us.i1912, %bb2.preheader.us.i1906
  %result.03.us.i1908 = phi i16 [ 0, %bb2.preheader.us.i1906 ], [ %1437, %bb1.us.i1912 ] ; <i16> [#uses=1]
  %n.02.us.i1909 = phi i32 [ 0, %bb2.preheader.us.i1906 ], [ %1438, %bb1.us.i1912 ] ; <i32> [#uses=2]
  %scevgep.i1910 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1909 ; <i16*> [#uses=1]
  %1435 = load i16* %scevgep.i1910, align 2       ; <i16> [#uses=1]
  %1436 = and i16 %1435, %1055                    ; <i16> [#uses=1]
  %1437 = add i16 %1436, %result.03.us.i1908      ; <i16> [#uses=2]
  %1438 = add nsw i32 %n.02.us.i1909, 1           ; <i32> [#uses=2]
  %exitcond.i1911 = icmp eq i32 %1438, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1911, label %bb2.bb3_crit_edge.us.i1916, label %bb1.us.i1912

bb2.bb3_crit_edge.us.i1916:                       ; preds = %bb1.us.i1912
  %1439 = sub i16 %1437, %1432                    ; <i16> [#uses=2]
  %1440 = sext i16 %1439 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1913 = sub i32 0, %1440            ; <i32> [#uses=1]
  %abscond.i.i.us.i1914 = icmp sgt i16 %1439, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1915 = select i1 %abscond.i.i.us.i1914, i32 %1440, i32 %neg.i.i.us.i1913 ; <i32> [#uses=1]
  %1441 = icmp slt i32 %abs.i.i.us.i1915, 1       ; <i1> [#uses=1]
  br i1 %1441, label %_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i, label %bb.i1.us.i1907

bb5.i1917:                                        ; preds = %_Z26check_shifted_variable_sumIs19custom_variable_andIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is30custom_mixed_multiple_variableIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1442 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1443 = sub i32 %1442, %1430                    ; <i32> [#uses=1]
  %1444 = sitofp i32 %1443 to double              ; <double> [#uses=1]
  %1445 = fdiv double %1444, 1.000000e+06         ; <double> [#uses=1]
  %.not2820 = icmp ne %struct.one_result* %results.46, null ; <i1> [#uses=1]
  %1446 = icmp sgt i32 %allocated_results.46, 48  ; <i1> [#uses=1]
  %or.cond2821 = and i1 %1446, %.not2820          ; <i1> [#uses=1]
  br i1 %or.cond2821, label %_Z14test_variable1Is19custom_variable_andIsEEvPT_iS2_PKc.exit, label %bb1.i.i1919

bb1.i.i1919:                                      ; preds = %bb5.i1917
  %1447 = add nsw i32 %allocated_results.46, 10   ; <i32> [#uses=3]
  %1448 = mul i32 %1447, 12                       ; <i32> [#uses=1]
  %1449 = bitcast %struct.one_result* %results.46 to i8* ; <i8*> [#uses=1]
  %1450 = tail call i8* @realloc(i8* %1449, i32 %1448) nounwind ; <i8*> [#uses=2]
  %1451 = bitcast i8* %1450 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1452 = icmp eq i8* %1450, null                 ; <i1> [#uses=1]
  br i1 %1452, label %bb2.i.i1920, label %_Z14test_variable1Is19custom_variable_andIsEEvPT_iS2_PKc.exit

bb2.i.i1920:                                      ; preds = %bb1.i.i1919
  %1453 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1447) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is19custom_variable_andIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1919, %bb5.i1917
  %results.47 = phi %struct.one_result* [ %1451, %bb1.i.i1919 ], [ %results.46, %bb5.i1917 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.47 = phi i32 [ %1447, %bb1.i.i1919 ], [ %allocated_results.46, %bb5.i1917 ] ; <i32> [#uses=3]
  %1454 = phi %struct.one_result* [ %1451, %bb1.i.i1919 ], [ %results.46, %bb5.i1917 ] ; <%struct.one_result*> [#uses=2]
  %1455 = getelementptr inbounds %struct.one_result* %1454, i32 48, i32 0 ; <double*> [#uses=1]
  store double %1445, double* %1455, align 4
  %1456 = getelementptr inbounds %struct.one_result* %1454, i32 48, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str60, i32 0, i32 0), i8** %1456, align 4
  %1457 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1885, label %bb5.i1899

bb.nph6.i1885:                                    ; preds = %_Z14test_variable1Is19custom_variable_andIsEEvPT_iS2_PKc.exit
  %1458 = and i16 %1056, %1055                    ; <i16> [#uses=1]
  %1459 = and i16 %1458, %1057                    ; <i16> [#uses=1]
  %1460 = and i16 %1459, %1062                    ; <i16> [#uses=2]
  %1461 = and i16 %1460, %1053                    ; <i16> [#uses=1]
  %1462 = mul i16 %1461, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1888

bb2.preheader.us.i1888:                           ; preds = %_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1885
  %i.05.us.i1886 = phi i32 [ 0, %bb.nph6.i1885 ], [ %tmp.i1887, %_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1887 = add i32 %i.05.us.i1886, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1894

_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1898, %bb.i1.us.i1889
  %1463 = icmp slt i32 %tmp.i1887, %iterations.0  ; <i1> [#uses=1]
  br i1 %1463, label %bb2.preheader.us.i1888, label %bb5.i1899

bb.i1.us.i1889:                                   ; preds = %bb2.bb3_crit_edge.us.i1898
  %1464 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 49) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1894:                                     ; preds = %bb1.us.i1894, %bb2.preheader.us.i1888
  %result.03.us.i1890 = phi i16 [ 0, %bb2.preheader.us.i1888 ], [ %1467, %bb1.us.i1894 ] ; <i16> [#uses=1]
  %n.02.us.i1891 = phi i32 [ 0, %bb2.preheader.us.i1888 ], [ %1468, %bb1.us.i1894 ] ; <i32> [#uses=2]
  %scevgep.i1892 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1891 ; <i16*> [#uses=1]
  %1465 = load i16* %scevgep.i1892, align 2       ; <i16> [#uses=1]
  %1466 = and i16 %1460, %1465                    ; <i16> [#uses=1]
  %1467 = add i16 %1466, %result.03.us.i1890      ; <i16> [#uses=2]
  %1468 = add nsw i32 %n.02.us.i1891, 1           ; <i32> [#uses=2]
  %exitcond.i1893 = icmp eq i32 %1468, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1893, label %bb2.bb3_crit_edge.us.i1898, label %bb1.us.i1894

bb2.bb3_crit_edge.us.i1898:                       ; preds = %bb1.us.i1894
  %1469 = sub i16 %1467, %1462                    ; <i16> [#uses=2]
  %1470 = sext i16 %1469 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1895 = sub i32 0, %1470            ; <i32> [#uses=1]
  %abscond.i.i.us.i1896 = icmp sgt i16 %1469, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1897 = select i1 %abscond.i.i.us.i1896, i32 %1470, i32 %neg.i.i.us.i1895 ; <i32> [#uses=1]
  %1471 = icmp slt i32 %abs.i.i.us.i1897, 1       ; <i1> [#uses=1]
  br i1 %1471, label %_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1889

bb5.i1899:                                        ; preds = %_Z26check_shifted_variable_sumIs28custom_multiple_variable_andIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is19custom_variable_andIsEEvPT_iS2_PKc.exit
  %1472 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1473 = sub i32 %1472, %1457                    ; <i32> [#uses=1]
  %1474 = sitofp i32 %1473 to double              ; <double> [#uses=1]
  %1475 = fdiv double %1474, 1.000000e+06         ; <double> [#uses=1]
  %.not2822 = icmp ne %struct.one_result* %results.47, null ; <i1> [#uses=1]
  %1476 = icmp sgt i32 %allocated_results.47, 49  ; <i1> [#uses=1]
  %or.cond2823 = and i1 %1476, %.not2822          ; <i1> [#uses=1]
  br i1 %or.cond2823, label %_Z14test_variable4Is28custom_multiple_variable_andIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1901

bb1.i.i1901:                                      ; preds = %bb5.i1899
  %1477 = add nsw i32 %allocated_results.47, 10   ; <i32> [#uses=3]
  %1478 = mul i32 %1477, 12                       ; <i32> [#uses=1]
  %1479 = bitcast %struct.one_result* %results.47 to i8* ; <i8*> [#uses=1]
  %1480 = tail call i8* @realloc(i8* %1479, i32 %1478) nounwind ; <i8*> [#uses=2]
  %1481 = bitcast i8* %1480 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1482 = icmp eq i8* %1480, null                 ; <i1> [#uses=1]
  br i1 %1482, label %bb2.i.i1902, label %_Z14test_variable4Is28custom_multiple_variable_andIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1902:                                      ; preds = %bb1.i.i1901
  %1483 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1477) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is28custom_multiple_variable_andIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1901, %bb5.i1899
  %results.48 = phi %struct.one_result* [ %1481, %bb1.i.i1901 ], [ %results.47, %bb5.i1899 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.48 = phi i32 [ %1477, %bb1.i.i1901 ], [ %allocated_results.47, %bb5.i1899 ] ; <i32> [#uses=3]
  %1484 = phi %struct.one_result* [ %1481, %bb1.i.i1901 ], [ %results.47, %bb5.i1899 ] ; <%struct.one_result*> [#uses=2]
  %1485 = getelementptr inbounds %struct.one_result* %1484, i32 49, i32 0 ; <double*> [#uses=1]
  store double %1475, double* %1485, align 4
  %1486 = getelementptr inbounds %struct.one_result* %1484, i32 49, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str61, i32 0, i32 0), i8** %1486, align 4
  %1487 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1867, label %bb5.i1881

bb.nph6.i1867:                                    ; preds = %_Z14test_variable4Is28custom_multiple_variable_andIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1488 = or i16 %1053, %1055                     ; <i16> [#uses=1]
  %1489 = mul i16 %1488, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1870

bb2.preheader.us.i1870:                           ; preds = %_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i, %bb.nph6.i1867
  %i.05.us.i1868 = phi i32 [ 0, %bb.nph6.i1867 ], [ %tmp.i1869, %_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1869 = add i32 %i.05.us.i1868, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1876

_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1880, %bb.i1.us.i1871
  %1490 = icmp slt i32 %tmp.i1869, %iterations.0  ; <i1> [#uses=1]
  br i1 %1490, label %bb2.preheader.us.i1870, label %bb5.i1881

bb.i1.us.i1871:                                   ; preds = %bb2.bb3_crit_edge.us.i1880
  %1491 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 50) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i

bb1.us.i1876:                                     ; preds = %bb1.us.i1876, %bb2.preheader.us.i1870
  %result.03.us.i1872 = phi i16 [ 0, %bb2.preheader.us.i1870 ], [ %1494, %bb1.us.i1876 ] ; <i16> [#uses=1]
  %n.02.us.i1873 = phi i32 [ 0, %bb2.preheader.us.i1870 ], [ %1495, %bb1.us.i1876 ] ; <i32> [#uses=2]
  %scevgep.i1874 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1873 ; <i16*> [#uses=1]
  %1492 = load i16* %scevgep.i1874, align 2       ; <i16> [#uses=1]
  %1493 = or i16 %1492, %1055                     ; <i16> [#uses=1]
  %1494 = add i16 %1493, %result.03.us.i1872      ; <i16> [#uses=2]
  %1495 = add nsw i32 %n.02.us.i1873, 1           ; <i32> [#uses=2]
  %exitcond.i1875 = icmp eq i32 %1495, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1875, label %bb2.bb3_crit_edge.us.i1880, label %bb1.us.i1876

bb2.bb3_crit_edge.us.i1880:                       ; preds = %bb1.us.i1876
  %1496 = sub i16 %1494, %1489                    ; <i16> [#uses=2]
  %1497 = sext i16 %1496 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1877 = sub i32 0, %1497            ; <i32> [#uses=1]
  %abscond.i.i.us.i1878 = icmp sgt i16 %1496, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1879 = select i1 %abscond.i.i.us.i1878, i32 %1497, i32 %neg.i.i.us.i1877 ; <i32> [#uses=1]
  %1498 = icmp slt i32 %abs.i.i.us.i1879, 1       ; <i1> [#uses=1]
  br i1 %1498, label %_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i, label %bb.i1.us.i1871

bb5.i1881:                                        ; preds = %_Z26check_shifted_variable_sumIs18custom_variable_orIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is28custom_multiple_variable_andIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1499 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1500 = sub i32 %1499, %1487                    ; <i32> [#uses=1]
  %1501 = sitofp i32 %1500 to double              ; <double> [#uses=1]
  %1502 = fdiv double %1501, 1.000000e+06         ; <double> [#uses=1]
  %.not2824 = icmp ne %struct.one_result* %results.48, null ; <i1> [#uses=1]
  %1503 = icmp sgt i32 %allocated_results.48, 50  ; <i1> [#uses=1]
  %or.cond2825 = and i1 %1503, %.not2824          ; <i1> [#uses=1]
  br i1 %or.cond2825, label %_Z14test_variable1Is18custom_variable_orIsEEvPT_iS2_PKc.exit, label %bb1.i.i1883

bb1.i.i1883:                                      ; preds = %bb5.i1881
  %1504 = add nsw i32 %allocated_results.48, 10   ; <i32> [#uses=3]
  %1505 = mul i32 %1504, 12                       ; <i32> [#uses=1]
  %1506 = bitcast %struct.one_result* %results.48 to i8* ; <i8*> [#uses=1]
  %1507 = tail call i8* @realloc(i8* %1506, i32 %1505) nounwind ; <i8*> [#uses=2]
  %1508 = bitcast i8* %1507 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1509 = icmp eq i8* %1507, null                 ; <i1> [#uses=1]
  br i1 %1509, label %bb2.i.i1884, label %_Z14test_variable1Is18custom_variable_orIsEEvPT_iS2_PKc.exit

bb2.i.i1884:                                      ; preds = %bb1.i.i1883
  %1510 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1504) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is18custom_variable_orIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1883, %bb5.i1881
  %results.49 = phi %struct.one_result* [ %1508, %bb1.i.i1883 ], [ %results.48, %bb5.i1881 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.49 = phi i32 [ %1504, %bb1.i.i1883 ], [ %allocated_results.48, %bb5.i1881 ] ; <i32> [#uses=3]
  %1511 = phi %struct.one_result* [ %1508, %bb1.i.i1883 ], [ %results.48, %bb5.i1881 ] ; <%struct.one_result*> [#uses=2]
  %1512 = getelementptr inbounds %struct.one_result* %1511, i32 50, i32 0 ; <double*> [#uses=1]
  store double %1502, double* %1512, align 4
  %1513 = getelementptr inbounds %struct.one_result* %1511, i32 50, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str62, i32 0, i32 0), i8** %1513, align 4
  %1514 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1849, label %bb5.i1863

bb.nph6.i1849:                                    ; preds = %_Z14test_variable1Is18custom_variable_orIsEEvPT_iS2_PKc.exit
  %1515 = or i16 %1056, %1055                     ; <i16> [#uses=1]
  %1516 = or i16 %1515, %1057                     ; <i16> [#uses=1]
  %1517 = or i16 %1516, %1062                     ; <i16> [#uses=2]
  %1518 = or i16 %1517, %1053                     ; <i16> [#uses=1]
  %1519 = mul i16 %1518, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1852

bb2.preheader.us.i1852:                           ; preds = %_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1849
  %i.05.us.i1850 = phi i32 [ 0, %bb.nph6.i1849 ], [ %tmp.i1851, %_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1851 = add i32 %i.05.us.i1850, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1858

_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1862, %bb.i1.us.i1853
  %1520 = icmp slt i32 %tmp.i1851, %iterations.0  ; <i1> [#uses=1]
  br i1 %1520, label %bb2.preheader.us.i1852, label %bb5.i1863

bb.i1.us.i1853:                                   ; preds = %bb2.bb3_crit_edge.us.i1862
  %1521 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 51) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1858:                                     ; preds = %bb1.us.i1858, %bb2.preheader.us.i1852
  %result.03.us.i1854 = phi i16 [ 0, %bb2.preheader.us.i1852 ], [ %1524, %bb1.us.i1858 ] ; <i16> [#uses=1]
  %n.02.us.i1855 = phi i32 [ 0, %bb2.preheader.us.i1852 ], [ %1525, %bb1.us.i1858 ] ; <i32> [#uses=2]
  %scevgep.i1856 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1855 ; <i16*> [#uses=1]
  %1522 = load i16* %scevgep.i1856, align 2       ; <i16> [#uses=1]
  %1523 = or i16 %1517, %1522                     ; <i16> [#uses=1]
  %1524 = add i16 %1523, %result.03.us.i1854      ; <i16> [#uses=2]
  %1525 = add nsw i32 %n.02.us.i1855, 1           ; <i32> [#uses=2]
  %exitcond.i1857 = icmp eq i32 %1525, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1857, label %bb2.bb3_crit_edge.us.i1862, label %bb1.us.i1858

bb2.bb3_crit_edge.us.i1862:                       ; preds = %bb1.us.i1858
  %1526 = sub i16 %1524, %1519                    ; <i16> [#uses=2]
  %1527 = sext i16 %1526 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1859 = sub i32 0, %1527            ; <i32> [#uses=1]
  %abscond.i.i.us.i1860 = icmp sgt i16 %1526, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1861 = select i1 %abscond.i.i.us.i1860, i32 %1527, i32 %neg.i.i.us.i1859 ; <i32> [#uses=1]
  %1528 = icmp slt i32 %abs.i.i.us.i1861, 1       ; <i1> [#uses=1]
  br i1 %1528, label %_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1853

bb5.i1863:                                        ; preds = %_Z26check_shifted_variable_sumIs27custom_multiple_variable_orIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is18custom_variable_orIsEEvPT_iS2_PKc.exit
  %1529 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1530 = sub i32 %1529, %1514                    ; <i32> [#uses=1]
  %1531 = sitofp i32 %1530 to double              ; <double> [#uses=1]
  %1532 = fdiv double %1531, 1.000000e+06         ; <double> [#uses=1]
  %.not2826 = icmp ne %struct.one_result* %results.49, null ; <i1> [#uses=1]
  %1533 = icmp sgt i32 %allocated_results.49, 51  ; <i1> [#uses=1]
  %or.cond2827 = and i1 %1533, %.not2826          ; <i1> [#uses=1]
  br i1 %or.cond2827, label %_Z14test_variable4Is27custom_multiple_variable_orIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1865

bb1.i.i1865:                                      ; preds = %bb5.i1863
  %1534 = add nsw i32 %allocated_results.49, 10   ; <i32> [#uses=3]
  %1535 = mul i32 %1534, 12                       ; <i32> [#uses=1]
  %1536 = bitcast %struct.one_result* %results.49 to i8* ; <i8*> [#uses=1]
  %1537 = tail call i8* @realloc(i8* %1536, i32 %1535) nounwind ; <i8*> [#uses=2]
  %1538 = bitcast i8* %1537 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1539 = icmp eq i8* %1537, null                 ; <i1> [#uses=1]
  br i1 %1539, label %bb2.i.i1866, label %_Z14test_variable4Is27custom_multiple_variable_orIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1866:                                      ; preds = %bb1.i.i1865
  %1540 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1534) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is27custom_multiple_variable_orIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1865, %bb5.i1863
  %results.50 = phi %struct.one_result* [ %1538, %bb1.i.i1865 ], [ %results.49, %bb5.i1863 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.50 = phi i32 [ %1534, %bb1.i.i1865 ], [ %allocated_results.49, %bb5.i1863 ] ; <i32> [#uses=3]
  %1541 = phi %struct.one_result* [ %1538, %bb1.i.i1865 ], [ %results.49, %bb5.i1863 ] ; <%struct.one_result*> [#uses=2]
  %1542 = getelementptr inbounds %struct.one_result* %1541, i32 51, i32 0 ; <double*> [#uses=1]
  store double %1532, double* %1542, align 4
  %1543 = getelementptr inbounds %struct.one_result* %1541, i32 51, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str63, i32 0, i32 0), i8** %1543, align 4
  %1544 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1831, label %bb5.i1845

bb.nph6.i1831:                                    ; preds = %_Z14test_variable4Is27custom_multiple_variable_orIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1545 = xor i16 %1053, %1055                    ; <i16> [#uses=1]
  %1546 = mul i16 %1545, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1834

bb2.preheader.us.i1834:                           ; preds = %_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i, %bb.nph6.i1831
  %i.05.us.i1832 = phi i32 [ 0, %bb.nph6.i1831 ], [ %tmp.i1833, %_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1833 = add i32 %i.05.us.i1832, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1840

_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1844, %bb.i1.us.i1835
  %1547 = icmp slt i32 %tmp.i1833, %iterations.0  ; <i1> [#uses=1]
  br i1 %1547, label %bb2.preheader.us.i1834, label %bb5.i1845

bb.i1.us.i1835:                                   ; preds = %bb2.bb3_crit_edge.us.i1844
  %1548 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 52) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i

bb1.us.i1840:                                     ; preds = %bb1.us.i1840, %bb2.preheader.us.i1834
  %result.03.us.i1836 = phi i16 [ 0, %bb2.preheader.us.i1834 ], [ %1551, %bb1.us.i1840 ] ; <i16> [#uses=1]
  %n.02.us.i1837 = phi i32 [ 0, %bb2.preheader.us.i1834 ], [ %1552, %bb1.us.i1840 ] ; <i32> [#uses=2]
  %scevgep.i1838 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1837 ; <i16*> [#uses=1]
  %1549 = load i16* %scevgep.i1838, align 2       ; <i16> [#uses=1]
  %1550 = xor i16 %1549, %1055                    ; <i16> [#uses=1]
  %1551 = add i16 %1550, %result.03.us.i1836      ; <i16> [#uses=2]
  %1552 = add nsw i32 %n.02.us.i1837, 1           ; <i32> [#uses=2]
  %exitcond.i1839 = icmp eq i32 %1552, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1839, label %bb2.bb3_crit_edge.us.i1844, label %bb1.us.i1840

bb2.bb3_crit_edge.us.i1844:                       ; preds = %bb1.us.i1840
  %1553 = sub i16 %1551, %1546                    ; <i16> [#uses=2]
  %1554 = sext i16 %1553 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1841 = sub i32 0, %1554            ; <i32> [#uses=1]
  %abscond.i.i.us.i1842 = icmp sgt i16 %1553, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1843 = select i1 %abscond.i.i.us.i1842, i32 %1554, i32 %neg.i.i.us.i1841 ; <i32> [#uses=1]
  %1555 = icmp slt i32 %abs.i.i.us.i1843, 1       ; <i1> [#uses=1]
  br i1 %1555, label %_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i, label %bb.i1.us.i1835

bb5.i1845:                                        ; preds = %_Z26check_shifted_variable_sumIs19custom_variable_xorIsEEvT_S2_.exit.us.i, %_Z14test_variable4Is27custom_multiple_variable_orIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %1556 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1557 = sub i32 %1556, %1544                    ; <i32> [#uses=1]
  %1558 = sitofp i32 %1557 to double              ; <double> [#uses=1]
  %1559 = fdiv double %1558, 1.000000e+06         ; <double> [#uses=1]
  %.not2828 = icmp ne %struct.one_result* %results.50, null ; <i1> [#uses=1]
  %1560 = icmp sgt i32 %allocated_results.50, 52  ; <i1> [#uses=1]
  %or.cond2829 = and i1 %1560, %.not2828          ; <i1> [#uses=1]
  br i1 %or.cond2829, label %_Z14test_variable1Is19custom_variable_xorIsEEvPT_iS2_PKc.exit, label %bb1.i.i1847

bb1.i.i1847:                                      ; preds = %bb5.i1845
  %1561 = add nsw i32 %allocated_results.50, 10   ; <i32> [#uses=3]
  %1562 = mul i32 %1561, 12                       ; <i32> [#uses=1]
  %1563 = bitcast %struct.one_result* %results.50 to i8* ; <i8*> [#uses=1]
  %1564 = tail call i8* @realloc(i8* %1563, i32 %1562) nounwind ; <i8*> [#uses=2]
  %1565 = bitcast i8* %1564 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1566 = icmp eq i8* %1564, null                 ; <i1> [#uses=1]
  br i1 %1566, label %bb2.i.i1848, label %_Z14test_variable1Is19custom_variable_xorIsEEvPT_iS2_PKc.exit

bb2.i.i1848:                                      ; preds = %bb1.i.i1847
  %1567 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1561) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Is19custom_variable_xorIsEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1847, %bb5.i1845
  %results.51 = phi %struct.one_result* [ %1565, %bb1.i.i1847 ], [ %results.50, %bb5.i1845 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.51 = phi i32 [ %1561, %bb1.i.i1847 ], [ %allocated_results.50, %bb5.i1845 ] ; <i32> [#uses=3]
  %1568 = phi %struct.one_result* [ %1565, %bb1.i.i1847 ], [ %results.50, %bb5.i1845 ] ; <%struct.one_result*> [#uses=2]
  %1569 = getelementptr inbounds %struct.one_result* %1568, i32 52, i32 0 ; <double*> [#uses=1]
  store double %1559, double* %1569, align 4
  %1570 = getelementptr inbounds %struct.one_result* %1568, i32 52, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str64, i32 0, i32 0), i8** %1570, align 4
  %1571 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1813, label %bb5.i1827

bb.nph6.i1813:                                    ; preds = %_Z14test_variable1Is19custom_variable_xorIsEEvPT_iS2_PKc.exit
  %1572 = xor i16 %1056, %1055                    ; <i16> [#uses=1]
  %1573 = xor i16 %1572, %1057                    ; <i16> [#uses=1]
  %1574 = xor i16 %1573, %1062                    ; <i16> [#uses=2]
  %1575 = xor i16 %1574, %1053                    ; <i16> [#uses=1]
  %1576 = mul i16 %1575, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1816

bb2.preheader.us.i1816:                           ; preds = %_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1813
  %i.05.us.i1814 = phi i32 [ 0, %bb.nph6.i1813 ], [ %tmp.i1815, %_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1815 = add i32 %i.05.us.i1814, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1822

_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1826, %bb.i1.us.i1817
  %1577 = icmp slt i32 %tmp.i1815, %iterations.0  ; <i1> [#uses=1]
  br i1 %1577, label %bb2.preheader.us.i1816, label %bb5.i1827

bb.i1.us.i1817:                                   ; preds = %bb2.bb3_crit_edge.us.i1826
  %1578 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 53) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1822:                                     ; preds = %bb1.us.i1822, %bb2.preheader.us.i1816
  %result.03.us.i1818 = phi i16 [ 0, %bb2.preheader.us.i1816 ], [ %1581, %bb1.us.i1822 ] ; <i16> [#uses=1]
  %n.02.us.i1819 = phi i32 [ 0, %bb2.preheader.us.i1816 ], [ %1582, %bb1.us.i1822 ] ; <i32> [#uses=2]
  %scevgep.i1820 = getelementptr [8000 x i16]* @data16, i32 0, i32 %n.02.us.i1819 ; <i16*> [#uses=1]
  %1579 = load i16* %scevgep.i1820, align 2       ; <i16> [#uses=1]
  %1580 = xor i16 %1574, %1579                    ; <i16> [#uses=1]
  %1581 = add i16 %1580, %result.03.us.i1818      ; <i16> [#uses=2]
  %1582 = add nsw i32 %n.02.us.i1819, 1           ; <i32> [#uses=2]
  %exitcond.i1821 = icmp eq i32 %1582, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1821, label %bb2.bb3_crit_edge.us.i1826, label %bb1.us.i1822

bb2.bb3_crit_edge.us.i1826:                       ; preds = %bb1.us.i1822
  %1583 = sub i16 %1581, %1576                    ; <i16> [#uses=2]
  %1584 = sext i16 %1583 to i32                   ; <i32> [#uses=2]
  %neg.i.i.us.i1823 = sub i32 0, %1584            ; <i32> [#uses=1]
  %abscond.i.i.us.i1824 = icmp sgt i16 %1583, -1  ; <i1> [#uses=1]
  %abs.i.i.us.i1825 = select i1 %abscond.i.i.us.i1824, i32 %1584, i32 %neg.i.i.us.i1823 ; <i32> [#uses=1]
  %1585 = icmp slt i32 %abs.i.i.us.i1825, 1       ; <i1> [#uses=1]
  br i1 %1585, label %_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1817

bb5.i1827:                                        ; preds = %_Z26check_shifted_variable_sumIs28custom_multiple_variable_xorIsEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Is19custom_variable_xorIsEEvPT_iS2_PKc.exit
  %1586 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1587 = sub i32 %1586, %1571                    ; <i32> [#uses=1]
  %1588 = sitofp i32 %1587 to double              ; <double> [#uses=1]
  %1589 = fdiv double %1588, 1.000000e+06         ; <double> [#uses=1]
  %.not2830 = icmp ne %struct.one_result* %results.51, null ; <i1> [#uses=1]
  %1590 = icmp sgt i32 %allocated_results.51, 53  ; <i1> [#uses=1]
  %or.cond2831 = and i1 %1590, %.not2830          ; <i1> [#uses=1]
  br i1 %or.cond2831, label %_Z14test_variable4Is28custom_multiple_variable_xorIsEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1829

bb1.i.i1829:                                      ; preds = %bb5.i1827
  %1591 = add nsw i32 %allocated_results.51, 10   ; <i32> [#uses=3]
  %1592 = mul i32 %1591, 12                       ; <i32> [#uses=1]
  %1593 = bitcast %struct.one_result* %results.51 to i8* ; <i8*> [#uses=1]
  %1594 = tail call i8* @realloc(i8* %1593, i32 %1592) nounwind ; <i8*> [#uses=2]
  %1595 = bitcast i8* %1594 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1596 = icmp eq i8* %1594, null                 ; <i1> [#uses=1]
  br i1 %1596, label %bb2.i.i1830, label %_Z14test_variable4Is28custom_multiple_variable_xorIsEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1830:                                      ; preds = %bb1.i.i1829
  %1597 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1591) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Is28custom_multiple_variable_xorIsEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1829, %bb5.i1827
  %results.52 = phi %struct.one_result* [ %1595, %bb1.i.i1829 ], [ %results.51, %bb5.i1827 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.52 = phi i32 [ %1591, %bb1.i.i1829 ], [ %allocated_results.51, %bb5.i1827 ] ; <i32> [#uses=3]
  %1598 = phi %struct.one_result* [ %1595, %bb1.i.i1829 ], [ %results.51, %bb5.i1827 ] ; <%struct.one_result*> [#uses=2]
  %1599 = getelementptr inbounds %struct.one_result* %1598, i32 53, i32 0 ; <double*> [#uses=1]
  store double %1589, double* %1599, align 4
  %1600 = getelementptr inbounds %struct.one_result* %1598, i32 53, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str65, i32 0, i32 0), i8** %1600, align 4
  %1601 = fptoui double %init_value.0 to i16      ; <i16> [#uses=19]
  br label %bb.i13

bb.i13:                                           ; preds = %bb.i13, %_Z14test_variable4Is28custom_multiple_variable_xorIsEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i9 = phi i32 [ 0, %_Z14test_variable4Is28custom_multiple_variable_xorIsEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i11, %bb.i13 ] ; <i32> [#uses=2]
  %tmp.i11 = add i32 %indvar.i9, 1                ; <i32> [#uses=2]
  %first_addr.01.i10 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %indvar.i9 ; <i16*> [#uses=1]
  store i16 %1601, i16* %first_addr.01.i10, align 2
  %scevgep.i12.idx.mask = and i32 %tmp.i11, 2147483647 ; <i32> [#uses=1]
  %1602 = icmp eq i32 %scevgep.i12.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %1602, label %_Z4fillIPttEvT_S1_T0_.exit, label %bb.i13

_Z4fillIPttEvT_S1_T0_.exit:                       ; preds = %bb.i13
  %1603 = fptoui double %temp.0 to i16            ; <i16> [#uses=32]
  %1604 = shl i16 %1603, 1                        ; <i16> [#uses=13]
  %1605 = add i16 %1603, 2                        ; <i16> [#uses=14]
  %1606 = udiv i16 %1604, %1605                   ; <i16> [#uses=1]
  %1607 = add i16 %1606, %1603                    ; <i16> [#uses=13]
  %1608 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1797, label %bb5.i1809

bb.nph6.i1797:                                    ; preds = %_Z4fillIPttEvT_S1_T0_.exit
  %1609 = add i16 %1601, %1603                    ; <i16> [#uses=1]
  %1610 = mul i16 %1609, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1800

bb2.preheader.us.i1800:                           ; preds = %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801, %bb.nph6.i1797
  %i.05.us.i1798 = phi i32 [ 0, %bb.nph6.i1797 ], [ %tmp.i1799, %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801 ] ; <i32> [#uses=1]
  %tmp.i1799 = add i32 %i.05.us.i1798, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1807

_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801: ; preds = %bb2.bb3_crit_edge.us.i1808, %bb.i1.us.i1802
  %1611 = icmp slt i32 %tmp.i1799, %iterations.0  ; <i1> [#uses=1]
  br i1 %1611, label %bb2.preheader.us.i1800, label %bb5.i1809

bb.i1.us.i1802:                                   ; preds = %bb2.bb3_crit_edge.us.i1808
  %1612 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 54) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801

bb1.us.i1807:                                     ; preds = %bb1.us.i1807, %bb2.preheader.us.i1800
  %result.03.us.i1803 = phi i16 [ 0, %bb2.preheader.us.i1800 ], [ %1615, %bb1.us.i1807 ] ; <i16> [#uses=1]
  %n.02.us.i1804 = phi i32 [ 0, %bb2.preheader.us.i1800 ], [ %1616, %bb1.us.i1807 ] ; <i32> [#uses=2]
  %scevgep.i1805 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1804 ; <i16*> [#uses=1]
  %1613 = load i16* %scevgep.i1805, align 2       ; <i16> [#uses=1]
  %1614 = add i16 %result.03.us.i1803, %1603      ; <i16> [#uses=1]
  %1615 = add i16 %1614, %1613                    ; <i16> [#uses=2]
  %1616 = add nsw i32 %n.02.us.i1804, 1           ; <i32> [#uses=2]
  %exitcond.i1806 = icmp eq i32 %1616, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1806, label %bb2.bb3_crit_edge.us.i1808, label %bb1.us.i1807

bb2.bb3_crit_edge.us.i1808:                       ; preds = %bb1.us.i1807
  %1617 = icmp eq i16 %1610, %1615                ; <i1> [#uses=1]
  br i1 %1617, label %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801, label %bb.i1.us.i1802

bb5.i1809:                                        ; preds = %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i1801, %_Z4fillIPttEvT_S1_T0_.exit
  %1618 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1619 = sub i32 %1618, %1608                    ; <i32> [#uses=1]
  %1620 = sitofp i32 %1619 to double              ; <double> [#uses=1]
  %1621 = fdiv double %1620, 1.000000e+06         ; <double> [#uses=1]
  %.not2832 = icmp ne %struct.one_result* %results.52, null ; <i1> [#uses=1]
  %1622 = icmp sgt i32 %allocated_results.52, 54  ; <i1> [#uses=1]
  %or.cond2833 = and i1 %1622, %.not2832          ; <i1> [#uses=1]
  br i1 %or.cond2833, label %_Z14test_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit, label %bb1.i.i1811

bb1.i.i1811:                                      ; preds = %bb5.i1809
  %1623 = add nsw i32 %allocated_results.52, 10   ; <i32> [#uses=3]
  %1624 = mul i32 %1623, 12                       ; <i32> [#uses=1]
  %1625 = bitcast %struct.one_result* %results.52 to i8* ; <i8*> [#uses=1]
  %1626 = tail call i8* @realloc(i8* %1625, i32 %1624) nounwind ; <i8*> [#uses=2]
  %1627 = bitcast i8* %1626 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1628 = icmp eq i8* %1626, null                 ; <i1> [#uses=1]
  br i1 %1628, label %bb2.i.i1812, label %_Z14test_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit

bb2.i.i1812:                                      ; preds = %bb1.i.i1811
  %1629 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1623) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1811, %bb5.i1809
  %results.53 = phi %struct.one_result* [ %1627, %bb1.i.i1811 ], [ %results.52, %bb5.i1809 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.53 = phi i32 [ %1623, %bb1.i.i1811 ], [ %allocated_results.52, %bb5.i1809 ] ; <i32> [#uses=3]
  %1630 = phi %struct.one_result* [ %1627, %bb1.i.i1811 ], [ %results.52, %bb5.i1809 ] ; <%struct.one_result*> [#uses=2]
  %1631 = getelementptr inbounds %struct.one_result* %1630, i32 54, i32 0 ; <double*> [#uses=1]
  store double %1621, double* %1631, align 4
  %1632 = getelementptr inbounds %struct.one_result* %1630, i32 54, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str66, i32 0, i32 0), i8** %1632, align 4
  %1633 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i1783, label %bb5.i1793

bb.nph7.i1783:                                    ; preds = %_Z14test_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit
  %1634 = mul i16 %1603, 8000                     ; <i16> [#uses=1]
  %1635 = add i16 %1601, %1603                    ; <i16> [#uses=1]
  %1636 = mul i16 %1635, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1786

bb2.preheader.us.i1786:                           ; preds = %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i, %bb.nph7.i1783
  %i.06.us.i1784 = phi i32 [ 0, %bb.nph7.i1783 ], [ %tmp.i1785, %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1785 = add i32 %i.06.us.i1784, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1791

_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1792, %bb.i2.us.i
  %1637 = icmp slt i32 %tmp.i1785, %iterations.0  ; <i1> [#uses=1]
  br i1 %1637, label %bb2.preheader.us.i1786, label %bb5.i1793

bb.i2.us.i:                                       ; preds = %bb2.bb3_crit_edge.us.i1792
  %1638 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 55) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i

bb1.us.i1791:                                     ; preds = %bb1.us.i1791, %bb2.preheader.us.i1786
  %result.04.us.i1787 = phi i16 [ 0, %bb2.preheader.us.i1786 ], [ %1640, %bb1.us.i1791 ] ; <i16> [#uses=1]
  %n.03.us.i1788 = phi i32 [ 0, %bb2.preheader.us.i1786 ], [ %1641, %bb1.us.i1791 ] ; <i32> [#uses=2]
  %scevgep.i1789 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.03.us.i1788 ; <i16*> [#uses=1]
  %1639 = load i16* %scevgep.i1789, align 2       ; <i16> [#uses=1]
  %1640 = add i16 %1639, %result.04.us.i1787      ; <i16> [#uses=2]
  %1641 = add nsw i32 %n.03.us.i1788, 1           ; <i32> [#uses=2]
  %exitcond.i1790 = icmp eq i32 %1641, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1790, label %bb2.bb3_crit_edge.us.i1792, label %bb1.us.i1791

bb2.bb3_crit_edge.us.i1792:                       ; preds = %bb1.us.i1791
  %1642 = add i16 %1640, %1634                    ; <i16> [#uses=1]
  %1643 = icmp eq i16 %1636, %1642                ; <i1> [#uses=1]
  br i1 %1643, label %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i, label %bb.i2.us.i

bb5.i1793:                                        ; preds = %_Z26check_shifted_variable_sumIt19custom_add_variableItEEvT_S2_.exit.us.i, %_Z14test_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit
  %1644 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1645 = sub i32 %1644, %1633                    ; <i32> [#uses=1]
  %1646 = sitofp i32 %1645 to double              ; <double> [#uses=1]
  %1647 = fdiv double %1646, 1.000000e+06         ; <double> [#uses=1]
  %.not2834 = icmp ne %struct.one_result* %results.53, null ; <i1> [#uses=1]
  %1648 = icmp sgt i32 %allocated_results.53, 55  ; <i1> [#uses=1]
  %or.cond2835 = and i1 %1648, %.not2834          ; <i1> [#uses=1]
  br i1 %or.cond2835, label %_Z22test_hoisted_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit, label %bb1.i.i1795

bb1.i.i1795:                                      ; preds = %bb5.i1793
  %1649 = add nsw i32 %allocated_results.53, 10   ; <i32> [#uses=3]
  %1650 = mul i32 %1649, 12                       ; <i32> [#uses=1]
  %1651 = bitcast %struct.one_result* %results.53 to i8* ; <i8*> [#uses=1]
  %1652 = tail call i8* @realloc(i8* %1651, i32 %1650) nounwind ; <i8*> [#uses=2]
  %1653 = bitcast i8* %1652 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1654 = icmp eq i8* %1652, null                 ; <i1> [#uses=1]
  br i1 %1654, label %bb2.i.i1796, label %_Z22test_hoisted_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit

bb2.i.i1796:                                      ; preds = %bb1.i.i1795
  %1655 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1649) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1795, %bb5.i1793
  %results.54 = phi %struct.one_result* [ %1653, %bb1.i.i1795 ], [ %results.53, %bb5.i1793 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.54 = phi i32 [ %1649, %bb1.i.i1795 ], [ %allocated_results.53, %bb5.i1793 ] ; <i32> [#uses=3]
  %1656 = phi %struct.one_result* [ %1653, %bb1.i.i1795 ], [ %results.53, %bb5.i1793 ] ; <%struct.one_result*> [#uses=2]
  %1657 = getelementptr inbounds %struct.one_result* %1656, i32 55, i32 0 ; <double*> [#uses=1]
  store double %1647, double* %1657, align 4
  %1658 = getelementptr inbounds %struct.one_result* %1656, i32 55, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str67, i32 0, i32 0), i8** %1658, align 4
  %1659 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1768, label %bb5.i1779

bb.nph6.i1768:                                    ; preds = %_Z22test_hoisted_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit
  %1660 = add i16 %1604, %1603                    ; <i16> [#uses=1]
  %1661 = add i16 %1660, %1605                    ; <i16> [#uses=1]
  %1662 = add i16 %1661, %1607                    ; <i16> [#uses=2]
  %1663 = add i16 %1662, %1601                    ; <i16> [#uses=1]
  %1664 = mul i16 %1663, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1771

bb2.preheader.us.i1771:                           ; preds = %_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1768
  %i.05.us.i1769 = phi i32 [ 0, %bb.nph6.i1768 ], [ %tmp.i1770, %_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1770 = add i32 %i.05.us.i1769, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1777

_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1778, %bb.i1.us.i1772
  %1665 = icmp slt i32 %tmp.i1770, %iterations.0  ; <i1> [#uses=1]
  br i1 %1665, label %bb2.preheader.us.i1771, label %bb5.i1779

bb.i1.us.i1772:                                   ; preds = %bb2.bb3_crit_edge.us.i1778
  %1666 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 56) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1777:                                     ; preds = %bb1.us.i1777, %bb2.preheader.us.i1771
  %result.03.us.i1773 = phi i16 [ 0, %bb2.preheader.us.i1771 ], [ %1669, %bb1.us.i1777 ] ; <i16> [#uses=1]
  %n.02.us.i1774 = phi i32 [ 0, %bb2.preheader.us.i1771 ], [ %1670, %bb1.us.i1777 ] ; <i32> [#uses=2]
  %scevgep.i1775 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1774 ; <i16*> [#uses=1]
  %1667 = load i16* %scevgep.i1775, align 2       ; <i16> [#uses=1]
  %1668 = add i16 %1662, %result.03.us.i1773      ; <i16> [#uses=1]
  %1669 = add i16 %1668, %1667                    ; <i16> [#uses=2]
  %1670 = add nsw i32 %n.02.us.i1774, 1           ; <i32> [#uses=2]
  %exitcond.i1776 = icmp eq i32 %1670, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1776, label %bb2.bb3_crit_edge.us.i1778, label %bb1.us.i1777

bb2.bb3_crit_edge.us.i1778:                       ; preds = %bb1.us.i1777
  %1671 = icmp eq i16 %1664, %1669                ; <i1> [#uses=1]
  br i1 %1671, label %_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1772

bb5.i1779:                                        ; preds = %_Z26check_shifted_variable_sumIt28custom_add_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1It19custom_add_variableItEEvPT_iS2_PKc.exit
  %1672 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1673 = sub i32 %1672, %1659                    ; <i32> [#uses=1]
  %1674 = sitofp i32 %1673 to double              ; <double> [#uses=1]
  %1675 = fdiv double %1674, 1.000000e+06         ; <double> [#uses=1]
  %.not2836 = icmp ne %struct.one_result* %results.54, null ; <i1> [#uses=1]
  %1676 = icmp sgt i32 %allocated_results.54, 56  ; <i1> [#uses=1]
  %or.cond2837 = and i1 %1676, %.not2836          ; <i1> [#uses=1]
  br i1 %or.cond2837, label %_Z14test_variable4It28custom_add_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1781

bb1.i.i1781:                                      ; preds = %bb5.i1779
  %1677 = add nsw i32 %allocated_results.54, 10   ; <i32> [#uses=3]
  %1678 = mul i32 %1677, 12                       ; <i32> [#uses=1]
  %1679 = bitcast %struct.one_result* %results.54 to i8* ; <i8*> [#uses=1]
  %1680 = tail call i8* @realloc(i8* %1679, i32 %1678) nounwind ; <i8*> [#uses=2]
  %1681 = bitcast i8* %1680 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1682 = icmp eq i8* %1680, null                 ; <i1> [#uses=1]
  br i1 %1682, label %bb2.i.i1782, label %_Z14test_variable4It28custom_add_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1782:                                      ; preds = %bb1.i.i1781
  %1683 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1677) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It28custom_add_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1781, %bb5.i1779
  %results.55 = phi %struct.one_result* [ %1681, %bb1.i.i1781 ], [ %results.54, %bb5.i1779 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.55 = phi i32 [ %1677, %bb1.i.i1781 ], [ %allocated_results.54, %bb5.i1779 ] ; <i32> [#uses=3]
  %1684 = phi %struct.one_result* [ %1681, %bb1.i.i1781 ], [ %results.54, %bb5.i1779 ] ; <%struct.one_result*> [#uses=2]
  %1685 = getelementptr inbounds %struct.one_result* %1684, i32 56, i32 0 ; <double*> [#uses=1]
  store double %1675, double* %1685, align 4
  %1686 = getelementptr inbounds %struct.one_result* %1684, i32 56, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str68, i32 0, i32 0), i8** %1686, align 4
  %1687 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1753, label %bb5.i1764

bb.nph6.i1753:                                    ; preds = %_Z14test_variable4It28custom_add_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1688 = sub i16 %1601, %1603                    ; <i16> [#uses=1]
  %1689 = mul i16 %1688, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1756

bb2.preheader.us.i1756:                           ; preds = %_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i, %bb.nph6.i1753
  %i.05.us.i1754 = phi i32 [ 0, %bb.nph6.i1753 ], [ %tmp.i1755, %_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1755 = add i32 %i.05.us.i1754, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1762

_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1763, %bb.i1.us.i1757
  %1690 = icmp slt i32 %tmp.i1755, %iterations.0  ; <i1> [#uses=1]
  br i1 %1690, label %bb2.preheader.us.i1756, label %bb5.i1764

bb.i1.us.i1757:                                   ; preds = %bb2.bb3_crit_edge.us.i1763
  %1691 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 57) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i

bb1.us.i1762:                                     ; preds = %bb1.us.i1762, %bb2.preheader.us.i1756
  %result.03.us.i1758 = phi i16 [ 0, %bb2.preheader.us.i1756 ], [ %1694, %bb1.us.i1762 ] ; <i16> [#uses=1]
  %n.02.us.i1759 = phi i32 [ 0, %bb2.preheader.us.i1756 ], [ %1695, %bb1.us.i1762 ] ; <i32> [#uses=2]
  %scevgep.i1760 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1759 ; <i16*> [#uses=1]
  %1692 = load i16* %scevgep.i1760, align 2       ; <i16> [#uses=1]
  %1693 = sub i16 %result.03.us.i1758, %1603      ; <i16> [#uses=1]
  %1694 = add i16 %1693, %1692                    ; <i16> [#uses=2]
  %1695 = add nsw i32 %n.02.us.i1759, 1           ; <i32> [#uses=2]
  %exitcond.i1761 = icmp eq i32 %1695, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1761, label %bb2.bb3_crit_edge.us.i1763, label %bb1.us.i1762

bb2.bb3_crit_edge.us.i1763:                       ; preds = %bb1.us.i1762
  %1696 = icmp eq i16 %1689, %1694                ; <i1> [#uses=1]
  br i1 %1696, label %_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i, label %bb.i1.us.i1757

bb5.i1764:                                        ; preds = %_Z26check_shifted_variable_sumIt19custom_sub_variableItEEvT_S2_.exit.us.i, %_Z14test_variable4It28custom_add_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1697 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1698 = sub i32 %1697, %1687                    ; <i32> [#uses=1]
  %1699 = sitofp i32 %1698 to double              ; <double> [#uses=1]
  %1700 = fdiv double %1699, 1.000000e+06         ; <double> [#uses=1]
  %.not2838 = icmp ne %struct.one_result* %results.55, null ; <i1> [#uses=1]
  %1701 = icmp sgt i32 %allocated_results.55, 57  ; <i1> [#uses=1]
  %or.cond2839 = and i1 %1701, %.not2838          ; <i1> [#uses=1]
  br i1 %or.cond2839, label %_Z14test_variable1It19custom_sub_variableItEEvPT_iS2_PKc.exit, label %bb1.i.i1766

bb1.i.i1766:                                      ; preds = %bb5.i1764
  %1702 = add nsw i32 %allocated_results.55, 10   ; <i32> [#uses=3]
  %1703 = mul i32 %1702, 12                       ; <i32> [#uses=1]
  %1704 = bitcast %struct.one_result* %results.55 to i8* ; <i8*> [#uses=1]
  %1705 = tail call i8* @realloc(i8* %1704, i32 %1703) nounwind ; <i8*> [#uses=2]
  %1706 = bitcast i8* %1705 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1707 = icmp eq i8* %1705, null                 ; <i1> [#uses=1]
  br i1 %1707, label %bb2.i.i1767, label %_Z14test_variable1It19custom_sub_variableItEEvPT_iS2_PKc.exit

bb2.i.i1767:                                      ; preds = %bb1.i.i1766
  %1708 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1702) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It19custom_sub_variableItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1766, %bb5.i1764
  %results.56 = phi %struct.one_result* [ %1706, %bb1.i.i1766 ], [ %results.55, %bb5.i1764 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.56 = phi i32 [ %1702, %bb1.i.i1766 ], [ %allocated_results.55, %bb5.i1764 ] ; <i32> [#uses=3]
  %1709 = phi %struct.one_result* [ %1706, %bb1.i.i1766 ], [ %results.55, %bb5.i1764 ] ; <%struct.one_result*> [#uses=2]
  %1710 = getelementptr inbounds %struct.one_result* %1709, i32 57, i32 0 ; <double*> [#uses=1]
  store double %1700, double* %1710, align 4
  %1711 = getelementptr inbounds %struct.one_result* %1709, i32 57, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str69, i32 0, i32 0), i8** %1711, align 4
  %1712 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i1738, label %bb5.i1749

bb.nph8.i1738:                                    ; preds = %_Z14test_variable1It19custom_sub_variableItEEvPT_iS2_PKc.exit
  %sum9.i1736 = add i16 %1604, %1603              ; <i16> [#uses=2]
  %1713 = sub i16 0, %sum9.i1736                  ; <i16> [#uses=1]
  %1714 = sub i16 %1713, %1605                    ; <i16> [#uses=1]
  %1715 = sub i16 %1714, %1607                    ; <i16> [#uses=1]
  %sum.i1737 = add i16 %sum9.i1736, %1605         ; <i16> [#uses=1]
  %1716 = sub i16 0, %sum.i1737                   ; <i16> [#uses=1]
  %1717 = sub i16 %1716, %1607                    ; <i16> [#uses=1]
  %1718 = add i16 %1717, %1601                    ; <i16> [#uses=1]
  %1719 = mul i16 %1718, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1741

bb2.preheader.us.i1741:                           ; preds = %_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i1738
  %i.07.us.i1739 = phi i32 [ 0, %bb.nph8.i1738 ], [ %tmp.i1740, %_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1740 = add i32 %i.07.us.i1739, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1747

_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1748, %bb.i1.us.i1742
  %1720 = icmp slt i32 %tmp.i1740, %iterations.0  ; <i1> [#uses=1]
  br i1 %1720, label %bb2.preheader.us.i1741, label %bb5.i1749

bb.i1.us.i1742:                                   ; preds = %bb2.bb3_crit_edge.us.i1748
  %1721 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 58) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1747:                                     ; preds = %bb1.us.i1747, %bb2.preheader.us.i1741
  %result.05.us.i1743 = phi i16 [ 0, %bb2.preheader.us.i1741 ], [ %1724, %bb1.us.i1747 ] ; <i16> [#uses=1]
  %n.04.us.i1744 = phi i32 [ 0, %bb2.preheader.us.i1741 ], [ %1725, %bb1.us.i1747 ] ; <i32> [#uses=2]
  %scevgep.i1745 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.04.us.i1744 ; <i16*> [#uses=1]
  %1722 = load i16* %scevgep.i1745, align 2       ; <i16> [#uses=1]
  %1723 = add i16 %1715, %result.05.us.i1743      ; <i16> [#uses=1]
  %1724 = add i16 %1723, %1722                    ; <i16> [#uses=2]
  %1725 = add nsw i32 %n.04.us.i1744, 1           ; <i32> [#uses=2]
  %exitcond.i1746 = icmp eq i32 %1725, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1746, label %bb2.bb3_crit_edge.us.i1748, label %bb1.us.i1747

bb2.bb3_crit_edge.us.i1748:                       ; preds = %bb1.us.i1747
  %1726 = icmp eq i16 %1719, %1724                ; <i1> [#uses=1]
  br i1 %1726, label %_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1742

bb5.i1749:                                        ; preds = %_Z26check_shifted_variable_sumIt28custom_sub_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It19custom_sub_variableItEEvPT_iS2_PKc.exit
  %1727 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1728 = sub i32 %1727, %1712                    ; <i32> [#uses=1]
  %1729 = sitofp i32 %1728 to double              ; <double> [#uses=1]
  %1730 = fdiv double %1729, 1.000000e+06         ; <double> [#uses=1]
  %.not2840 = icmp ne %struct.one_result* %results.56, null ; <i1> [#uses=1]
  %1731 = icmp sgt i32 %allocated_results.56, 58  ; <i1> [#uses=1]
  %or.cond2841 = and i1 %1731, %.not2840          ; <i1> [#uses=1]
  br i1 %or.cond2841, label %_Z14test_variable4It28custom_sub_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1751

bb1.i.i1751:                                      ; preds = %bb5.i1749
  %1732 = add nsw i32 %allocated_results.56, 10   ; <i32> [#uses=3]
  %1733 = mul i32 %1732, 12                       ; <i32> [#uses=1]
  %1734 = bitcast %struct.one_result* %results.56 to i8* ; <i8*> [#uses=1]
  %1735 = tail call i8* @realloc(i8* %1734, i32 %1733) nounwind ; <i8*> [#uses=2]
  %1736 = bitcast i8* %1735 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1737 = icmp eq i8* %1735, null                 ; <i1> [#uses=1]
  br i1 %1737, label %bb2.i.i1752, label %_Z14test_variable4It28custom_sub_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1752:                                      ; preds = %bb1.i.i1751
  %1738 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1732) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It28custom_sub_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1751, %bb5.i1749
  %results.57 = phi %struct.one_result* [ %1736, %bb1.i.i1751 ], [ %results.56, %bb5.i1749 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.57 = phi i32 [ %1732, %bb1.i.i1751 ], [ %allocated_results.56, %bb5.i1749 ] ; <i32> [#uses=3]
  %1739 = phi %struct.one_result* [ %1736, %bb1.i.i1751 ], [ %results.56, %bb5.i1749 ] ; <%struct.one_result*> [#uses=2]
  %1740 = getelementptr inbounds %struct.one_result* %1739, i32 58, i32 0 ; <double*> [#uses=1]
  store double %1730, double* %1740, align 4
  %1741 = getelementptr inbounds %struct.one_result* %1739, i32 58, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str70, i32 0, i32 0), i8** %1741, align 4
  %1742 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1721, label %bb5.i1732

bb.nph6.i1721:                                    ; preds = %_Z14test_variable4It28custom_sub_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1743 = mul i16 %1603, 8000                     ; <i16> [#uses=1]
  %1744 = mul i16 %1743, %1601                    ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1724

bb2.preheader.us.i1724:                           ; preds = %_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i, %bb.nph6.i1721
  %i.05.us.i1722 = phi i32 [ 0, %bb.nph6.i1721 ], [ %tmp.i1723, %_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1723 = add i32 %i.05.us.i1722, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1730

_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1731, %bb.i1.us.i1725
  %1745 = icmp slt i32 %tmp.i1723, %iterations.0  ; <i1> [#uses=1]
  br i1 %1745, label %bb2.preheader.us.i1724, label %bb5.i1732

bb.i1.us.i1725:                                   ; preds = %bb2.bb3_crit_edge.us.i1731
  %1746 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 59) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i

bb1.us.i1730:                                     ; preds = %bb1.us.i1730, %bb2.preheader.us.i1724
  %result.03.us.i1726 = phi i16 [ 0, %bb2.preheader.us.i1724 ], [ %1749, %bb1.us.i1730 ] ; <i16> [#uses=1]
  %n.02.us.i1727 = phi i32 [ 0, %bb2.preheader.us.i1724 ], [ %1750, %bb1.us.i1730 ] ; <i32> [#uses=2]
  %scevgep.i1728 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1727 ; <i16*> [#uses=1]
  %1747 = load i16* %scevgep.i1728, align 2       ; <i16> [#uses=1]
  %1748 = mul i16 %1747, %1603                    ; <i16> [#uses=1]
  %1749 = add i16 %1748, %result.03.us.i1726      ; <i16> [#uses=2]
  %1750 = add nsw i32 %n.02.us.i1727, 1           ; <i32> [#uses=2]
  %exitcond.i1729 = icmp eq i32 %1750, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1729, label %bb2.bb3_crit_edge.us.i1731, label %bb1.us.i1730

bb2.bb3_crit_edge.us.i1731:                       ; preds = %bb1.us.i1730
  %1751 = icmp eq i16 %1744, %1749                ; <i1> [#uses=1]
  br i1 %1751, label %_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i, label %bb.i1.us.i1725

bb5.i1732:                                        ; preds = %_Z26check_shifted_variable_sumIt24custom_multiply_variableItEEvT_S2_.exit.us.i, %_Z14test_variable4It28custom_sub_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1752 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1753 = sub i32 %1752, %1742                    ; <i32> [#uses=1]
  %1754 = sitofp i32 %1753 to double              ; <double> [#uses=1]
  %1755 = fdiv double %1754, 1.000000e+06         ; <double> [#uses=1]
  %.not2842 = icmp ne %struct.one_result* %results.57, null ; <i1> [#uses=1]
  %1756 = icmp sgt i32 %allocated_results.57, 59  ; <i1> [#uses=1]
  %or.cond2843 = and i1 %1756, %.not2842          ; <i1> [#uses=1]
  br i1 %or.cond2843, label %_Z14test_variable1It24custom_multiply_variableItEEvPT_iS2_PKc.exit, label %bb1.i.i1734

bb1.i.i1734:                                      ; preds = %bb5.i1732
  %1757 = add nsw i32 %allocated_results.57, 10   ; <i32> [#uses=3]
  %1758 = mul i32 %1757, 12                       ; <i32> [#uses=1]
  %1759 = bitcast %struct.one_result* %results.57 to i8* ; <i8*> [#uses=1]
  %1760 = tail call i8* @realloc(i8* %1759, i32 %1758) nounwind ; <i8*> [#uses=2]
  %1761 = bitcast i8* %1760 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1762 = icmp eq i8* %1760, null                 ; <i1> [#uses=1]
  br i1 %1762, label %bb2.i.i1735, label %_Z14test_variable1It24custom_multiply_variableItEEvPT_iS2_PKc.exit

bb2.i.i1735:                                      ; preds = %bb1.i.i1734
  %1763 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1757) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It24custom_multiply_variableItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1734, %bb5.i1732
  %results.58 = phi %struct.one_result* [ %1761, %bb1.i.i1734 ], [ %results.57, %bb5.i1732 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.58 = phi i32 [ %1757, %bb1.i.i1734 ], [ %allocated_results.57, %bb5.i1732 ] ; <i32> [#uses=3]
  %1764 = phi %struct.one_result* [ %1761, %bb1.i.i1734 ], [ %results.57, %bb5.i1732 ] ; <%struct.one_result*> [#uses=2]
  %1765 = getelementptr inbounds %struct.one_result* %1764, i32 59, i32 0 ; <double*> [#uses=1]
  store double %1755, double* %1765, align 4
  %1766 = getelementptr inbounds %struct.one_result* %1764, i32 59, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str71, i32 0, i32 0), i8** %1766, align 4
  %1767 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1706, label %bb5.i1717

bb.nph6.i1706:                                    ; preds = %_Z14test_variable1It24custom_multiply_variableItEEvPT_iS2_PKc.exit
  %1768 = mul i16 %1604, %1603                    ; <i16> [#uses=1]
  %1769 = mul i16 %1768, %1605                    ; <i16> [#uses=1]
  %1770 = mul i16 %1769, %1607                    ; <i16> [#uses=1]
  %1771 = mul i16 %1603, 8000                     ; <i16> [#uses=1]
  %1772 = mul i16 %1771, %1604                    ; <i16> [#uses=1]
  %1773 = mul i16 %1772, %1605                    ; <i16> [#uses=1]
  %1774 = mul i16 %1773, %1607                    ; <i16> [#uses=1]
  %1775 = mul i16 %1774, %1601                    ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1709

bb2.preheader.us.i1709:                           ; preds = %_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1706
  %i.05.us.i1707 = phi i32 [ 0, %bb.nph6.i1706 ], [ %tmp.i1708, %_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1708 = add i32 %i.05.us.i1707, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1715

_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1716, %bb.i1.us.i1710
  %1776 = icmp slt i32 %tmp.i1708, %iterations.0  ; <i1> [#uses=1]
  br i1 %1776, label %bb2.preheader.us.i1709, label %bb5.i1717

bb.i1.us.i1710:                                   ; preds = %bb2.bb3_crit_edge.us.i1716
  %1777 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 60) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1715:                                     ; preds = %bb1.us.i1715, %bb2.preheader.us.i1709
  %result.03.us.i1711 = phi i16 [ 0, %bb2.preheader.us.i1709 ], [ %1780, %bb1.us.i1715 ] ; <i16> [#uses=1]
  %n.02.us.i1712 = phi i32 [ 0, %bb2.preheader.us.i1709 ], [ %1781, %bb1.us.i1715 ] ; <i32> [#uses=2]
  %scevgep.i1713 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1712 ; <i16*> [#uses=1]
  %1778 = load i16* %scevgep.i1713, align 2       ; <i16> [#uses=1]
  %1779 = mul i16 %1770, %1778                    ; <i16> [#uses=1]
  %1780 = add i16 %1779, %result.03.us.i1711      ; <i16> [#uses=2]
  %1781 = add nsw i32 %n.02.us.i1712, 1           ; <i32> [#uses=2]
  %exitcond.i1714 = icmp eq i32 %1781, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1714, label %bb2.bb3_crit_edge.us.i1716, label %bb1.us.i1715

bb2.bb3_crit_edge.us.i1716:                       ; preds = %bb1.us.i1715
  %1782 = icmp eq i16 %1775, %1780                ; <i1> [#uses=1]
  br i1 %1782, label %_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1710

bb5.i1717:                                        ; preds = %_Z26check_shifted_variable_sumIt33custom_multiply_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It24custom_multiply_variableItEEvPT_iS2_PKc.exit
  %1783 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1784 = sub i32 %1783, %1767                    ; <i32> [#uses=1]
  %1785 = sitofp i32 %1784 to double              ; <double> [#uses=1]
  %1786 = fdiv double %1785, 1.000000e+06         ; <double> [#uses=1]
  %.not2844 = icmp ne %struct.one_result* %results.58, null ; <i1> [#uses=1]
  %1787 = icmp sgt i32 %allocated_results.58, 60  ; <i1> [#uses=1]
  %or.cond2845 = and i1 %1787, %.not2844          ; <i1> [#uses=1]
  br i1 %or.cond2845, label %_Z14test_variable4It33custom_multiply_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1719

bb1.i.i1719:                                      ; preds = %bb5.i1717
  %1788 = add nsw i32 %allocated_results.58, 10   ; <i32> [#uses=3]
  %1789 = mul i32 %1788, 12                       ; <i32> [#uses=1]
  %1790 = bitcast %struct.one_result* %results.58 to i8* ; <i8*> [#uses=1]
  %1791 = tail call i8* @realloc(i8* %1790, i32 %1789) nounwind ; <i8*> [#uses=2]
  %1792 = bitcast i8* %1791 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1793 = icmp eq i8* %1791, null                 ; <i1> [#uses=1]
  br i1 %1793, label %bb2.i.i1720, label %_Z14test_variable4It33custom_multiply_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1720:                                      ; preds = %bb1.i.i1719
  %1794 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1788) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It33custom_multiply_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1719, %bb5.i1717
  %results.59 = phi %struct.one_result* [ %1792, %bb1.i.i1719 ], [ %results.58, %bb5.i1717 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.59 = phi i32 [ %1788, %bb1.i.i1719 ], [ %allocated_results.58, %bb5.i1717 ] ; <i32> [#uses=3]
  %1795 = phi %struct.one_result* [ %1792, %bb1.i.i1719 ], [ %results.58, %bb5.i1717 ] ; <%struct.one_result*> [#uses=2]
  %1796 = getelementptr inbounds %struct.one_result* %1795, i32 60, i32 0 ; <double*> [#uses=1]
  store double %1786, double* %1796, align 4
  %1797 = getelementptr inbounds %struct.one_result* %1795, i32 60, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str72, i32 0, i32 0), i8** %1797, align 4
  %1798 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1691, label %bb5.i1702

bb.nph6.i1691:                                    ; preds = %_Z14test_variable4It33custom_multiply_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1799 = mul i16 %1604, %1603                    ; <i16> [#uses=1]
  %1800 = mul i16 %1799, %1605                    ; <i16> [#uses=1]
  %1801 = mul i16 %1800, %1607                    ; <i16> [#uses=2]
  %1802 = add i16 %1601, %1801                    ; <i16> [#uses=1]
  %1803 = mul i16 %1802, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1694

bb2.preheader.us.i1694:                           ; preds = %_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1691
  %i.05.us.i1692 = phi i32 [ 0, %bb.nph6.i1691 ], [ %tmp.i1693, %_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1693 = add i32 %i.05.us.i1692, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1700

_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1701, %bb.i1.us.i1695
  %1804 = icmp slt i32 %tmp.i1693, %iterations.0  ; <i1> [#uses=1]
  br i1 %1804, label %bb2.preheader.us.i1694, label %bb5.i1702

bb.i1.us.i1695:                                   ; preds = %bb2.bb3_crit_edge.us.i1701
  %1805 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 61) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1700:                                     ; preds = %bb1.us.i1700, %bb2.preheader.us.i1694
  %result.03.us.i1696 = phi i16 [ 0, %bb2.preheader.us.i1694 ], [ %1808, %bb1.us.i1700 ] ; <i16> [#uses=1]
  %n.02.us.i1697 = phi i32 [ 0, %bb2.preheader.us.i1694 ], [ %1809, %bb1.us.i1700 ] ; <i32> [#uses=2]
  %scevgep.i1698 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1697 ; <i16*> [#uses=1]
  %1806 = load i16* %scevgep.i1698, align 2       ; <i16> [#uses=1]
  %1807 = add i16 %result.03.us.i1696, %1801      ; <i16> [#uses=1]
  %1808 = add i16 %1807, %1806                    ; <i16> [#uses=2]
  %1809 = add nsw i32 %n.02.us.i1697, 1           ; <i32> [#uses=2]
  %exitcond.i1699 = icmp eq i32 %1809, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1699, label %bb2.bb3_crit_edge.us.i1701, label %bb1.us.i1700

bb2.bb3_crit_edge.us.i1701:                       ; preds = %bb1.us.i1700
  %1810 = icmp eq i16 %1803, %1808                ; <i1> [#uses=1]
  br i1 %1810, label %_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1695

bb5.i1702:                                        ; preds = %_Z26check_shifted_variable_sumIt34custom_multiply_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4It33custom_multiply_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1811 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1812 = sub i32 %1811, %1798                    ; <i32> [#uses=1]
  %1813 = sitofp i32 %1812 to double              ; <double> [#uses=1]
  %1814 = fdiv double %1813, 1.000000e+06         ; <double> [#uses=1]
  %.not2846 = icmp ne %struct.one_result* %results.59, null ; <i1> [#uses=1]
  %1815 = icmp sgt i32 %allocated_results.59, 61  ; <i1> [#uses=1]
  %or.cond2847 = and i1 %1815, %.not2846          ; <i1> [#uses=1]
  br i1 %or.cond2847, label %_Z14test_variable4It34custom_multiply_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1704

bb1.i.i1704:                                      ; preds = %bb5.i1702
  %1816 = add nsw i32 %allocated_results.59, 10   ; <i32> [#uses=3]
  %1817 = mul i32 %1816, 12                       ; <i32> [#uses=1]
  %1818 = bitcast %struct.one_result* %results.59 to i8* ; <i8*> [#uses=1]
  %1819 = tail call i8* @realloc(i8* %1818, i32 %1817) nounwind ; <i8*> [#uses=2]
  %1820 = bitcast i8* %1819 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1821 = icmp eq i8* %1819, null                 ; <i1> [#uses=1]
  br i1 %1821, label %bb2.i.i1705, label %_Z14test_variable4It34custom_multiply_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1705:                                      ; preds = %bb1.i.i1704
  %1822 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1816) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It34custom_multiply_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1704, %bb5.i1702
  %results.60 = phi %struct.one_result* [ %1820, %bb1.i.i1704 ], [ %results.59, %bb5.i1702 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.60 = phi i32 [ %1816, %bb1.i.i1704 ], [ %allocated_results.59, %bb5.i1702 ] ; <i32> [#uses=3]
  %1823 = phi %struct.one_result* [ %1820, %bb1.i.i1704 ], [ %results.59, %bb5.i1702 ] ; <%struct.one_result*> [#uses=2]
  %1824 = getelementptr inbounds %struct.one_result* %1823, i32 61, i32 0 ; <double*> [#uses=1]
  store double %1814, double* %1824, align 4
  %1825 = getelementptr inbounds %struct.one_result* %1823, i32 61, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([39 x i8]* @.str73, i32 0, i32 0), i8** %1825, align 4
  %1826 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1676, label %bb5.i1687

bb.nph6.i1676:                                    ; preds = %_Z14test_variable4It34custom_multiply_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1827 = udiv i16 %1601, %1603                   ; <i16> [#uses=1]
  %1828 = mul i16 %1827, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1679

bb2.preheader.us.i1679:                           ; preds = %_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i, %bb.nph6.i1676
  %i.05.us.i1677 = phi i32 [ 0, %bb.nph6.i1676 ], [ %tmp.i1678, %_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1678 = add i32 %i.05.us.i1677, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1685

_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1686, %bb.i1.us.i1680
  %1829 = icmp slt i32 %tmp.i1678, %iterations.0  ; <i1> [#uses=1]
  br i1 %1829, label %bb2.preheader.us.i1679, label %bb5.i1687

bb.i1.us.i1680:                                   ; preds = %bb2.bb3_crit_edge.us.i1686
  %1830 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 62) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i

bb1.us.i1685:                                     ; preds = %bb1.us.i1685, %bb2.preheader.us.i1679
  %result.03.us.i1681 = phi i16 [ 0, %bb2.preheader.us.i1679 ], [ %1833, %bb1.us.i1685 ] ; <i16> [#uses=1]
  %n.02.us.i1682 = phi i32 [ 0, %bb2.preheader.us.i1679 ], [ %1834, %bb1.us.i1685 ] ; <i32> [#uses=2]
  %scevgep.i1683 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1682 ; <i16*> [#uses=1]
  %1831 = load i16* %scevgep.i1683, align 2       ; <i16> [#uses=1]
  %1832 = udiv i16 %1831, %1603                   ; <i16> [#uses=1]
  %1833 = add i16 %1832, %result.03.us.i1681      ; <i16> [#uses=2]
  %1834 = add nsw i32 %n.02.us.i1682, 1           ; <i32> [#uses=2]
  %exitcond.i1684 = icmp eq i32 %1834, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1684, label %bb2.bb3_crit_edge.us.i1686, label %bb1.us.i1685

bb2.bb3_crit_edge.us.i1686:                       ; preds = %bb1.us.i1685
  %1835 = icmp eq i16 %1828, %1833                ; <i1> [#uses=1]
  br i1 %1835, label %_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i, label %bb.i1.us.i1680

bb5.i1687:                                        ; preds = %_Z26check_shifted_variable_sumIt22custom_divide_variableItEEvT_S2_.exit.us.i, %_Z14test_variable4It34custom_multiply_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1836 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1837 = sub i32 %1836, %1826                    ; <i32> [#uses=1]
  %1838 = sitofp i32 %1837 to double              ; <double> [#uses=1]
  %1839 = fdiv double %1838, 1.000000e+06         ; <double> [#uses=1]
  %.not2848 = icmp ne %struct.one_result* %results.60, null ; <i1> [#uses=1]
  %1840 = icmp sgt i32 %allocated_results.60, 62  ; <i1> [#uses=1]
  %or.cond2849 = and i1 %1840, %.not2848          ; <i1> [#uses=1]
  br i1 %or.cond2849, label %_Z14test_variable1It22custom_divide_variableItEEvPT_iS2_PKc.exit, label %bb1.i.i1689

bb1.i.i1689:                                      ; preds = %bb5.i1687
  %1841 = add nsw i32 %allocated_results.60, 10   ; <i32> [#uses=3]
  %1842 = mul i32 %1841, 12                       ; <i32> [#uses=1]
  %1843 = bitcast %struct.one_result* %results.60 to i8* ; <i8*> [#uses=1]
  %1844 = tail call i8* @realloc(i8* %1843, i32 %1842) nounwind ; <i8*> [#uses=2]
  %1845 = bitcast i8* %1844 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1846 = icmp eq i8* %1844, null                 ; <i1> [#uses=1]
  br i1 %1846, label %bb2.i.i1690, label %_Z14test_variable1It22custom_divide_variableItEEvPT_iS2_PKc.exit

bb2.i.i1690:                                      ; preds = %bb1.i.i1689
  %1847 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1841) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It22custom_divide_variableItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1689, %bb5.i1687
  %results.61 = phi %struct.one_result* [ %1845, %bb1.i.i1689 ], [ %results.60, %bb5.i1687 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.61 = phi i32 [ %1841, %bb1.i.i1689 ], [ %allocated_results.60, %bb5.i1687 ] ; <i32> [#uses=3]
  %1848 = phi %struct.one_result* [ %1845, %bb1.i.i1689 ], [ %results.60, %bb5.i1687 ] ; <%struct.one_result*> [#uses=2]
  %1849 = getelementptr inbounds %struct.one_result* %1848, i32 62, i32 0 ; <double*> [#uses=1]
  store double %1839, double* %1849, align 4
  %1850 = getelementptr inbounds %struct.one_result* %1848, i32 62, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str74, i32 0, i32 0), i8** %1850, align 4
  %1851 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1661, label %bb5.i1672

bb.nph6.i1661:                                    ; preds = %_Z14test_variable1It22custom_divide_variableItEEvPT_iS2_PKc.exit
  %1852 = udiv i16 %1601, %1603                   ; <i16> [#uses=1]
  %1853 = udiv i16 %1852, %1604                   ; <i16> [#uses=1]
  %1854 = udiv i16 %1853, %1605                   ; <i16> [#uses=1]
  %1855 = udiv i16 %1854, %1607                   ; <i16> [#uses=1]
  %1856 = mul i16 %1855, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1664

bb2.preheader.us.i1664:                           ; preds = %_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1661
  %i.05.us.i1662 = phi i32 [ 0, %bb.nph6.i1661 ], [ %tmp.i1663, %_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1663 = add i32 %i.05.us.i1662, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1670

_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1671, %bb.i1.us.i1665
  %1857 = icmp slt i32 %tmp.i1663, %iterations.0  ; <i1> [#uses=1]
  br i1 %1857, label %bb2.preheader.us.i1664, label %bb5.i1672

bb.i1.us.i1665:                                   ; preds = %bb2.bb3_crit_edge.us.i1671
  %1858 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 63) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1670:                                     ; preds = %bb1.us.i1670, %bb2.preheader.us.i1664
  %result.03.us.i1666 = phi i16 [ 0, %bb2.preheader.us.i1664 ], [ %1864, %bb1.us.i1670 ] ; <i16> [#uses=1]
  %n.02.us.i1667 = phi i32 [ 0, %bb2.preheader.us.i1664 ], [ %1865, %bb1.us.i1670 ] ; <i32> [#uses=2]
  %scevgep.i1668 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1667 ; <i16*> [#uses=1]
  %1859 = load i16* %scevgep.i1668, align 2       ; <i16> [#uses=1]
  %1860 = udiv i16 %1859, %1603                   ; <i16> [#uses=1]
  %1861 = udiv i16 %1860, %1604                   ; <i16> [#uses=1]
  %1862 = udiv i16 %1861, %1605                   ; <i16> [#uses=1]
  %1863 = udiv i16 %1862, %1607                   ; <i16> [#uses=1]
  %1864 = add i16 %1863, %result.03.us.i1666      ; <i16> [#uses=2]
  %1865 = add nsw i32 %n.02.us.i1667, 1           ; <i32> [#uses=2]
  %exitcond.i1669 = icmp eq i32 %1865, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1669, label %bb2.bb3_crit_edge.us.i1671, label %bb1.us.i1670

bb2.bb3_crit_edge.us.i1671:                       ; preds = %bb1.us.i1670
  %1866 = icmp eq i16 %1856, %1864                ; <i1> [#uses=1]
  br i1 %1866, label %_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1665

bb5.i1672:                                        ; preds = %_Z26check_shifted_variable_sumIt31custom_divide_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It22custom_divide_variableItEEvPT_iS2_PKc.exit
  %1867 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1868 = sub i32 %1867, %1851                    ; <i32> [#uses=1]
  %1869 = sitofp i32 %1868 to double              ; <double> [#uses=1]
  %1870 = fdiv double %1869, 1.000000e+06         ; <double> [#uses=1]
  %.not2850 = icmp ne %struct.one_result* %results.61, null ; <i1> [#uses=1]
  %1871 = icmp sgt i32 %allocated_results.61, 63  ; <i1> [#uses=1]
  %or.cond2851 = and i1 %1871, %.not2850          ; <i1> [#uses=1]
  br i1 %or.cond2851, label %_Z14test_variable4It31custom_divide_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1674

bb1.i.i1674:                                      ; preds = %bb5.i1672
  %1872 = add nsw i32 %allocated_results.61, 10   ; <i32> [#uses=3]
  %1873 = mul i32 %1872, 12                       ; <i32> [#uses=1]
  %1874 = bitcast %struct.one_result* %results.61 to i8* ; <i8*> [#uses=1]
  %1875 = tail call i8* @realloc(i8* %1874, i32 %1873) nounwind ; <i8*> [#uses=2]
  %1876 = bitcast i8* %1875 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1877 = icmp eq i8* %1875, null                 ; <i1> [#uses=1]
  br i1 %1877, label %bb2.i.i1675, label %_Z14test_variable4It31custom_divide_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1675:                                      ; preds = %bb1.i.i1674
  %1878 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1872) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It31custom_divide_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1674, %bb5.i1672
  %results.62 = phi %struct.one_result* [ %1876, %bb1.i.i1674 ], [ %results.61, %bb5.i1672 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.62 = phi i32 [ %1872, %bb1.i.i1674 ], [ %allocated_results.61, %bb5.i1672 ] ; <i32> [#uses=3]
  %1879 = phi %struct.one_result* [ %1876, %bb1.i.i1674 ], [ %results.61, %bb5.i1672 ] ; <%struct.one_result*> [#uses=2]
  %1880 = getelementptr inbounds %struct.one_result* %1879, i32 63, i32 0 ; <double*> [#uses=1]
  store double %1870, double* %1880, align 4
  %1881 = getelementptr inbounds %struct.one_result* %1879, i32 63, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str75, i32 0, i32 0), i8** %1881, align 4
  %1882 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1646, label %bb5.i1657

bb.nph6.i1646:                                    ; preds = %_Z14test_variable4It31custom_divide_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1883 = udiv i16 %1603, %1604                   ; <i16> [#uses=1]
  %1884 = udiv i16 %1883, %1605                   ; <i16> [#uses=1]
  %1885 = udiv i16 %1884, %1607                   ; <i16> [#uses=2]
  %1886 = add i16 %1885, %1601                    ; <i16> [#uses=1]
  %1887 = mul i16 %1886, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1649

bb2.preheader.us.i1649:                           ; preds = %_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1646
  %i.05.us.i1647 = phi i32 [ 0, %bb.nph6.i1646 ], [ %tmp.i1648, %_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1648 = add i32 %i.05.us.i1647, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1655

_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1656, %bb.i1.us.i1650
  %1888 = icmp slt i32 %tmp.i1648, %iterations.0  ; <i1> [#uses=1]
  br i1 %1888, label %bb2.preheader.us.i1649, label %bb5.i1657

bb.i1.us.i1650:                                   ; preds = %bb2.bb3_crit_edge.us.i1656
  %1889 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 64) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1655:                                     ; preds = %bb1.us.i1655, %bb2.preheader.us.i1649
  %result.03.us.i1651 = phi i16 [ 0, %bb2.preheader.us.i1649 ], [ %1892, %bb1.us.i1655 ] ; <i16> [#uses=1]
  %n.02.us.i1652 = phi i32 [ 0, %bb2.preheader.us.i1649 ], [ %1893, %bb1.us.i1655 ] ; <i32> [#uses=2]
  %scevgep.i1653 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1652 ; <i16*> [#uses=1]
  %1890 = load i16* %scevgep.i1653, align 2       ; <i16> [#uses=1]
  %1891 = add i16 %1890, %result.03.us.i1651      ; <i16> [#uses=1]
  %1892 = add i16 %1891, %1885                    ; <i16> [#uses=2]
  %1893 = add nsw i32 %n.02.us.i1652, 1           ; <i32> [#uses=2]
  %exitcond.i1654 = icmp eq i32 %1893, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1654, label %bb2.bb3_crit_edge.us.i1656, label %bb1.us.i1655

bb2.bb3_crit_edge.us.i1656:                       ; preds = %bb1.us.i1655
  %1894 = icmp eq i16 %1887, %1892                ; <i1> [#uses=1]
  br i1 %1894, label %_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1650

bb5.i1657:                                        ; preds = %_Z26check_shifted_variable_sumIt32custom_divide_multiple_variable2ItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4It31custom_divide_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1895 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1896 = sub i32 %1895, %1882                    ; <i32> [#uses=1]
  %1897 = sitofp i32 %1896 to double              ; <double> [#uses=1]
  %1898 = fdiv double %1897, 1.000000e+06         ; <double> [#uses=1]
  %.not2852 = icmp ne %struct.one_result* %results.62, null ; <i1> [#uses=1]
  %1899 = icmp sgt i32 %allocated_results.62, 64  ; <i1> [#uses=1]
  %or.cond2853 = and i1 %1899, %.not2852          ; <i1> [#uses=1]
  br i1 %or.cond2853, label %_Z14test_variable4It32custom_divide_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1659

bb1.i.i1659:                                      ; preds = %bb5.i1657
  %1900 = add nsw i32 %allocated_results.62, 10   ; <i32> [#uses=3]
  %1901 = mul i32 %1900, 12                       ; <i32> [#uses=1]
  %1902 = bitcast %struct.one_result* %results.62 to i8* ; <i8*> [#uses=1]
  %1903 = tail call i8* @realloc(i8* %1902, i32 %1901) nounwind ; <i8*> [#uses=2]
  %1904 = bitcast i8* %1903 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1905 = icmp eq i8* %1903, null                 ; <i1> [#uses=1]
  br i1 %1905, label %bb2.i.i1660, label %_Z14test_variable4It32custom_divide_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1660:                                      ; preds = %bb1.i.i1659
  %1906 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1900) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It32custom_divide_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1659, %bb5.i1657
  %results.63 = phi %struct.one_result* [ %1904, %bb1.i.i1659 ], [ %results.62, %bb5.i1657 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.63 = phi i32 [ %1900, %bb1.i.i1659 ], [ %allocated_results.62, %bb5.i1657 ] ; <i32> [#uses=3]
  %1907 = phi %struct.one_result* [ %1904, %bb1.i.i1659 ], [ %results.62, %bb5.i1657 ] ; <%struct.one_result*> [#uses=2]
  %1908 = getelementptr inbounds %struct.one_result* %1907, i32 64, i32 0 ; <double*> [#uses=1]
  store double %1898, double* %1908, align 4
  %1909 = getelementptr inbounds %struct.one_result* %1907, i32 64, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str76, i32 0, i32 0), i8** %1909, align 4
  %1910 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i1631, label %bb5.i1642

bb.nph7.i1631:                                    ; preds = %_Z14test_variable4It32custom_divide_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1911 = zext i16 %1604 to i32                   ; <i32> [#uses=1]
  %1912 = zext i16 %1605 to i32                   ; <i32> [#uses=1]
  %1913 = mul i32 %1912, %1911                    ; <i32> [#uses=1]
  %1914 = zext i16 %1607 to i32                   ; <i32> [#uses=1]
  %1915 = sdiv i32 %1913, %1914                   ; <i32> [#uses=1]
  %1916 = trunc i32 %1915 to i16                  ; <i16> [#uses=2]
  %1917 = add i16 %1601, %1603                    ; <i16> [#uses=1]
  %1918 = sub i16 %1917, %1916                    ; <i16> [#uses=1]
  %1919 = mul i16 %1918, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1634

bb2.preheader.us.i1634:                           ; preds = %_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i1631
  %i.06.us.i1632 = phi i32 [ 0, %bb.nph7.i1631 ], [ %tmp.i1633, %_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1633 = add i32 %i.06.us.i1632, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1640

_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1641, %bb.i1.us.i1635
  %1920 = icmp slt i32 %tmp.i1633, %iterations.0  ; <i1> [#uses=1]
  br i1 %1920, label %bb2.preheader.us.i1634, label %bb5.i1642

bb.i1.us.i1635:                                   ; preds = %bb2.bb3_crit_edge.us.i1641
  %1921 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 65) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1640:                                     ; preds = %bb1.us.i1640, %bb2.preheader.us.i1634
  %result.04.us.i1636 = phi i16 [ 0, %bb2.preheader.us.i1634 ], [ %1925, %bb1.us.i1640 ] ; <i16> [#uses=1]
  %n.03.us.i1637 = phi i32 [ 0, %bb2.preheader.us.i1634 ], [ %1926, %bb1.us.i1640 ] ; <i32> [#uses=2]
  %scevgep.i1638 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.03.us.i1637 ; <i16*> [#uses=1]
  %1922 = load i16* %scevgep.i1638, align 2       ; <i16> [#uses=1]
  %1923 = add i16 %result.04.us.i1636, %1603      ; <i16> [#uses=1]
  %1924 = add i16 %1923, %1922                    ; <i16> [#uses=1]
  %1925 = sub i16 %1924, %1916                    ; <i16> [#uses=2]
  %1926 = add nsw i32 %n.03.us.i1637, 1           ; <i32> [#uses=2]
  %exitcond.i1639 = icmp eq i32 %1926, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1639, label %bb2.bb3_crit_edge.us.i1641, label %bb1.us.i1640

bb2.bb3_crit_edge.us.i1641:                       ; preds = %bb1.us.i1640
  %1927 = icmp eq i16 %1919, %1925                ; <i1> [#uses=1]
  br i1 %1927, label %_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1635

bb5.i1642:                                        ; preds = %_Z26check_shifted_variable_sumIt30custom_mixed_multiple_variableItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4It32custom_divide_multiple_variable2ItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1928 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1929 = sub i32 %1928, %1910                    ; <i32> [#uses=1]
  %1930 = sitofp i32 %1929 to double              ; <double> [#uses=1]
  %1931 = fdiv double %1930, 1.000000e+06         ; <double> [#uses=1]
  %.not2854 = icmp ne %struct.one_result* %results.63, null ; <i1> [#uses=1]
  %1932 = icmp sgt i32 %allocated_results.63, 65  ; <i1> [#uses=1]
  %or.cond2855 = and i1 %1932, %.not2854          ; <i1> [#uses=1]
  br i1 %or.cond2855, label %_Z14test_variable4It30custom_mixed_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1644

bb1.i.i1644:                                      ; preds = %bb5.i1642
  %1933 = add nsw i32 %allocated_results.63, 10   ; <i32> [#uses=3]
  %1934 = mul i32 %1933, 12                       ; <i32> [#uses=1]
  %1935 = bitcast %struct.one_result* %results.63 to i8* ; <i8*> [#uses=1]
  %1936 = tail call i8* @realloc(i8* %1935, i32 %1934) nounwind ; <i8*> [#uses=2]
  %1937 = bitcast i8* %1936 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1938 = icmp eq i8* %1936, null                 ; <i1> [#uses=1]
  br i1 %1938, label %bb2.i.i1645, label %_Z14test_variable4It30custom_mixed_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1645:                                      ; preds = %bb1.i.i1644
  %1939 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1933) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It30custom_mixed_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1644, %bb5.i1642
  %results.64 = phi %struct.one_result* [ %1937, %bb1.i.i1644 ], [ %results.63, %bb5.i1642 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.64 = phi i32 [ %1933, %bb1.i.i1644 ], [ %allocated_results.63, %bb5.i1642 ] ; <i32> [#uses=3]
  %1940 = phi %struct.one_result* [ %1937, %bb1.i.i1644 ], [ %results.63, %bb5.i1642 ] ; <%struct.one_result*> [#uses=2]
  %1941 = getelementptr inbounds %struct.one_result* %1940, i32 65, i32 0 ; <double*> [#uses=1]
  store double %1931, double* %1941, align 4
  %1942 = getelementptr inbounds %struct.one_result* %1940, i32 65, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str77, i32 0, i32 0), i8** %1942, align 4
  %1943 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1616, label %bb5.i1627

bb.nph6.i1616:                                    ; preds = %_Z14test_variable4It30custom_mixed_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1944 = and i16 %1601, %1603                    ; <i16> [#uses=1]
  %1945 = mul i16 %1944, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1619

bb2.preheader.us.i1619:                           ; preds = %_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i, %bb.nph6.i1616
  %i.05.us.i1617 = phi i32 [ 0, %bb.nph6.i1616 ], [ %tmp.i1618, %_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1618 = add i32 %i.05.us.i1617, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1625

_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1626, %bb.i1.us.i1620
  %1946 = icmp slt i32 %tmp.i1618, %iterations.0  ; <i1> [#uses=1]
  br i1 %1946, label %bb2.preheader.us.i1619, label %bb5.i1627

bb.i1.us.i1620:                                   ; preds = %bb2.bb3_crit_edge.us.i1626
  %1947 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 66) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i

bb1.us.i1625:                                     ; preds = %bb1.us.i1625, %bb2.preheader.us.i1619
  %result.03.us.i1621 = phi i16 [ 0, %bb2.preheader.us.i1619 ], [ %1950, %bb1.us.i1625 ] ; <i16> [#uses=1]
  %n.02.us.i1622 = phi i32 [ 0, %bb2.preheader.us.i1619 ], [ %1951, %bb1.us.i1625 ] ; <i32> [#uses=2]
  %scevgep.i1623 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1622 ; <i16*> [#uses=1]
  %1948 = load i16* %scevgep.i1623, align 2       ; <i16> [#uses=1]
  %1949 = and i16 %1948, %1603                    ; <i16> [#uses=1]
  %1950 = add i16 %1949, %result.03.us.i1621      ; <i16> [#uses=2]
  %1951 = add nsw i32 %n.02.us.i1622, 1           ; <i32> [#uses=2]
  %exitcond.i1624 = icmp eq i32 %1951, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1624, label %bb2.bb3_crit_edge.us.i1626, label %bb1.us.i1625

bb2.bb3_crit_edge.us.i1626:                       ; preds = %bb1.us.i1625
  %1952 = icmp eq i16 %1945, %1950                ; <i1> [#uses=1]
  br i1 %1952, label %_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i, label %bb.i1.us.i1620

bb5.i1627:                                        ; preds = %_Z26check_shifted_variable_sumIt19custom_variable_andItEEvT_S2_.exit.us.i, %_Z14test_variable4It30custom_mixed_multiple_variableItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1953 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1954 = sub i32 %1953, %1943                    ; <i32> [#uses=1]
  %1955 = sitofp i32 %1954 to double              ; <double> [#uses=1]
  %1956 = fdiv double %1955, 1.000000e+06         ; <double> [#uses=1]
  %.not2856 = icmp ne %struct.one_result* %results.64, null ; <i1> [#uses=1]
  %1957 = icmp sgt i32 %allocated_results.64, 66  ; <i1> [#uses=1]
  %or.cond2857 = and i1 %1957, %.not2856          ; <i1> [#uses=1]
  br i1 %or.cond2857, label %_Z14test_variable1It19custom_variable_andItEEvPT_iS2_PKc.exit, label %bb1.i.i1629

bb1.i.i1629:                                      ; preds = %bb5.i1627
  %1958 = add nsw i32 %allocated_results.64, 10   ; <i32> [#uses=3]
  %1959 = mul i32 %1958, 12                       ; <i32> [#uses=1]
  %1960 = bitcast %struct.one_result* %results.64 to i8* ; <i8*> [#uses=1]
  %1961 = tail call i8* @realloc(i8* %1960, i32 %1959) nounwind ; <i8*> [#uses=2]
  %1962 = bitcast i8* %1961 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1963 = icmp eq i8* %1961, null                 ; <i1> [#uses=1]
  br i1 %1963, label %bb2.i.i1630, label %_Z14test_variable1It19custom_variable_andItEEvPT_iS2_PKc.exit

bb2.i.i1630:                                      ; preds = %bb1.i.i1629
  %1964 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1958) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It19custom_variable_andItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1629, %bb5.i1627
  %results.65 = phi %struct.one_result* [ %1962, %bb1.i.i1629 ], [ %results.64, %bb5.i1627 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.65 = phi i32 [ %1958, %bb1.i.i1629 ], [ %allocated_results.64, %bb5.i1627 ] ; <i32> [#uses=3]
  %1965 = phi %struct.one_result* [ %1962, %bb1.i.i1629 ], [ %results.64, %bb5.i1627 ] ; <%struct.one_result*> [#uses=2]
  %1966 = getelementptr inbounds %struct.one_result* %1965, i32 66, i32 0 ; <double*> [#uses=1]
  store double %1956, double* %1966, align 4
  %1967 = getelementptr inbounds %struct.one_result* %1965, i32 66, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str78, i32 0, i32 0), i8** %1967, align 4
  %1968 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1601, label %bb5.i1612

bb.nph6.i1601:                                    ; preds = %_Z14test_variable1It19custom_variable_andItEEvPT_iS2_PKc.exit
  %1969 = and i16 %1604, %1603                    ; <i16> [#uses=1]
  %1970 = and i16 %1969, %1605                    ; <i16> [#uses=1]
  %1971 = and i16 %1970, %1607                    ; <i16> [#uses=2]
  %1972 = and i16 %1971, %1601                    ; <i16> [#uses=1]
  %1973 = mul i16 %1972, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1604

bb2.preheader.us.i1604:                           ; preds = %_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1601
  %i.05.us.i1602 = phi i32 [ 0, %bb.nph6.i1601 ], [ %tmp.i1603, %_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1603 = add i32 %i.05.us.i1602, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1610

_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1611, %bb.i1.us.i1605
  %1974 = icmp slt i32 %tmp.i1603, %iterations.0  ; <i1> [#uses=1]
  br i1 %1974, label %bb2.preheader.us.i1604, label %bb5.i1612

bb.i1.us.i1605:                                   ; preds = %bb2.bb3_crit_edge.us.i1611
  %1975 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 67) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1610:                                     ; preds = %bb1.us.i1610, %bb2.preheader.us.i1604
  %result.03.us.i1606 = phi i16 [ 0, %bb2.preheader.us.i1604 ], [ %1978, %bb1.us.i1610 ] ; <i16> [#uses=1]
  %n.02.us.i1607 = phi i32 [ 0, %bb2.preheader.us.i1604 ], [ %1979, %bb1.us.i1610 ] ; <i32> [#uses=2]
  %scevgep.i1608 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1607 ; <i16*> [#uses=1]
  %1976 = load i16* %scevgep.i1608, align 2       ; <i16> [#uses=1]
  %1977 = and i16 %1971, %1976                    ; <i16> [#uses=1]
  %1978 = add i16 %1977, %result.03.us.i1606      ; <i16> [#uses=2]
  %1979 = add nsw i32 %n.02.us.i1607, 1           ; <i32> [#uses=2]
  %exitcond.i1609 = icmp eq i32 %1979, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1609, label %bb2.bb3_crit_edge.us.i1611, label %bb1.us.i1610

bb2.bb3_crit_edge.us.i1611:                       ; preds = %bb1.us.i1610
  %1980 = icmp eq i16 %1973, %1978                ; <i1> [#uses=1]
  br i1 %1980, label %_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1605

bb5.i1612:                                        ; preds = %_Z26check_shifted_variable_sumIt28custom_multiple_variable_andItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It19custom_variable_andItEEvPT_iS2_PKc.exit
  %1981 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %1982 = sub i32 %1981, %1968                    ; <i32> [#uses=1]
  %1983 = sitofp i32 %1982 to double              ; <double> [#uses=1]
  %1984 = fdiv double %1983, 1.000000e+06         ; <double> [#uses=1]
  %.not2858 = icmp ne %struct.one_result* %results.65, null ; <i1> [#uses=1]
  %1985 = icmp sgt i32 %allocated_results.65, 67  ; <i1> [#uses=1]
  %or.cond2859 = and i1 %1985, %.not2858          ; <i1> [#uses=1]
  br i1 %or.cond2859, label %_Z14test_variable4It28custom_multiple_variable_andItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1614

bb1.i.i1614:                                      ; preds = %bb5.i1612
  %1986 = add nsw i32 %allocated_results.65, 10   ; <i32> [#uses=3]
  %1987 = mul i32 %1986, 12                       ; <i32> [#uses=1]
  %1988 = bitcast %struct.one_result* %results.65 to i8* ; <i8*> [#uses=1]
  %1989 = tail call i8* @realloc(i8* %1988, i32 %1987) nounwind ; <i8*> [#uses=2]
  %1990 = bitcast i8* %1989 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %1991 = icmp eq i8* %1989, null                 ; <i1> [#uses=1]
  br i1 %1991, label %bb2.i.i1615, label %_Z14test_variable4It28custom_multiple_variable_andItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1615:                                      ; preds = %bb1.i.i1614
  %1992 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %1986) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It28custom_multiple_variable_andItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1614, %bb5.i1612
  %results.66 = phi %struct.one_result* [ %1990, %bb1.i.i1614 ], [ %results.65, %bb5.i1612 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.66 = phi i32 [ %1986, %bb1.i.i1614 ], [ %allocated_results.65, %bb5.i1612 ] ; <i32> [#uses=3]
  %1993 = phi %struct.one_result* [ %1990, %bb1.i.i1614 ], [ %results.65, %bb5.i1612 ] ; <%struct.one_result*> [#uses=2]
  %1994 = getelementptr inbounds %struct.one_result* %1993, i32 67, i32 0 ; <double*> [#uses=1]
  store double %1984, double* %1994, align 4
  %1995 = getelementptr inbounds %struct.one_result* %1993, i32 67, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str79, i32 0, i32 0), i8** %1995, align 4
  %1996 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1586, label %bb5.i1597

bb.nph6.i1586:                                    ; preds = %_Z14test_variable4It28custom_multiple_variable_andItEEvPT_iS2_S2_S2_S2_PKc.exit
  %1997 = or i16 %1601, %1603                     ; <i16> [#uses=1]
  %1998 = mul i16 %1997, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1589

bb2.preheader.us.i1589:                           ; preds = %_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i, %bb.nph6.i1586
  %i.05.us.i1587 = phi i32 [ 0, %bb.nph6.i1586 ], [ %tmp.i1588, %_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1588 = add i32 %i.05.us.i1587, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1595

_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1596, %bb.i1.us.i1590
  %1999 = icmp slt i32 %tmp.i1588, %iterations.0  ; <i1> [#uses=1]
  br i1 %1999, label %bb2.preheader.us.i1589, label %bb5.i1597

bb.i1.us.i1590:                                   ; preds = %bb2.bb3_crit_edge.us.i1596
  %2000 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 68) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i

bb1.us.i1595:                                     ; preds = %bb1.us.i1595, %bb2.preheader.us.i1589
  %result.03.us.i1591 = phi i16 [ 0, %bb2.preheader.us.i1589 ], [ %2003, %bb1.us.i1595 ] ; <i16> [#uses=1]
  %n.02.us.i1592 = phi i32 [ 0, %bb2.preheader.us.i1589 ], [ %2004, %bb1.us.i1595 ] ; <i32> [#uses=2]
  %scevgep.i1593 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1592 ; <i16*> [#uses=1]
  %2001 = load i16* %scevgep.i1593, align 2       ; <i16> [#uses=1]
  %2002 = or i16 %2001, %1603                     ; <i16> [#uses=1]
  %2003 = add i16 %2002, %result.03.us.i1591      ; <i16> [#uses=2]
  %2004 = add nsw i32 %n.02.us.i1592, 1           ; <i32> [#uses=2]
  %exitcond.i1594 = icmp eq i32 %2004, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1594, label %bb2.bb3_crit_edge.us.i1596, label %bb1.us.i1595

bb2.bb3_crit_edge.us.i1596:                       ; preds = %bb1.us.i1595
  %2005 = icmp eq i16 %1998, %2003                ; <i1> [#uses=1]
  br i1 %2005, label %_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i, label %bb.i1.us.i1590

bb5.i1597:                                        ; preds = %_Z26check_shifted_variable_sumIt18custom_variable_orItEEvT_S2_.exit.us.i, %_Z14test_variable4It28custom_multiple_variable_andItEEvPT_iS2_S2_S2_S2_PKc.exit
  %2006 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2007 = sub i32 %2006, %1996                    ; <i32> [#uses=1]
  %2008 = sitofp i32 %2007 to double              ; <double> [#uses=1]
  %2009 = fdiv double %2008, 1.000000e+06         ; <double> [#uses=1]
  %.not2860 = icmp ne %struct.one_result* %results.66, null ; <i1> [#uses=1]
  %2010 = icmp sgt i32 %allocated_results.66, 68  ; <i1> [#uses=1]
  %or.cond2861 = and i1 %2010, %.not2860          ; <i1> [#uses=1]
  br i1 %or.cond2861, label %_Z14test_variable1It18custom_variable_orItEEvPT_iS2_PKc.exit, label %bb1.i.i1599

bb1.i.i1599:                                      ; preds = %bb5.i1597
  %2011 = add nsw i32 %allocated_results.66, 10   ; <i32> [#uses=3]
  %2012 = mul i32 %2011, 12                       ; <i32> [#uses=1]
  %2013 = bitcast %struct.one_result* %results.66 to i8* ; <i8*> [#uses=1]
  %2014 = tail call i8* @realloc(i8* %2013, i32 %2012) nounwind ; <i8*> [#uses=2]
  %2015 = bitcast i8* %2014 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2016 = icmp eq i8* %2014, null                 ; <i1> [#uses=1]
  br i1 %2016, label %bb2.i.i1600, label %_Z14test_variable1It18custom_variable_orItEEvPT_iS2_PKc.exit

bb2.i.i1600:                                      ; preds = %bb1.i.i1599
  %2017 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2011) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It18custom_variable_orItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1599, %bb5.i1597
  %results.67 = phi %struct.one_result* [ %2015, %bb1.i.i1599 ], [ %results.66, %bb5.i1597 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.67 = phi i32 [ %2011, %bb1.i.i1599 ], [ %allocated_results.66, %bb5.i1597 ] ; <i32> [#uses=3]
  %2018 = phi %struct.one_result* [ %2015, %bb1.i.i1599 ], [ %results.66, %bb5.i1597 ] ; <%struct.one_result*> [#uses=2]
  %2019 = getelementptr inbounds %struct.one_result* %2018, i32 68, i32 0 ; <double*> [#uses=1]
  store double %2009, double* %2019, align 4
  %2020 = getelementptr inbounds %struct.one_result* %2018, i32 68, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str80, i32 0, i32 0), i8** %2020, align 4
  %2021 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1571, label %bb5.i1582

bb.nph6.i1571:                                    ; preds = %_Z14test_variable1It18custom_variable_orItEEvPT_iS2_PKc.exit
  %2022 = or i16 %1604, %1603                     ; <i16> [#uses=1]
  %2023 = or i16 %2022, %1605                     ; <i16> [#uses=1]
  %2024 = or i16 %2023, %1607                     ; <i16> [#uses=2]
  %2025 = or i16 %2024, %1601                     ; <i16> [#uses=1]
  %2026 = mul i16 %2025, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1574

bb2.preheader.us.i1574:                           ; preds = %_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1571
  %i.05.us.i1572 = phi i32 [ 0, %bb.nph6.i1571 ], [ %tmp.i1573, %_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1573 = add i32 %i.05.us.i1572, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1580

_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1581, %bb.i1.us.i1575
  %2027 = icmp slt i32 %tmp.i1573, %iterations.0  ; <i1> [#uses=1]
  br i1 %2027, label %bb2.preheader.us.i1574, label %bb5.i1582

bb.i1.us.i1575:                                   ; preds = %bb2.bb3_crit_edge.us.i1581
  %2028 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 69) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1580:                                     ; preds = %bb1.us.i1580, %bb2.preheader.us.i1574
  %result.03.us.i1576 = phi i16 [ 0, %bb2.preheader.us.i1574 ], [ %2031, %bb1.us.i1580 ] ; <i16> [#uses=1]
  %n.02.us.i1577 = phi i32 [ 0, %bb2.preheader.us.i1574 ], [ %2032, %bb1.us.i1580 ] ; <i32> [#uses=2]
  %scevgep.i1578 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1577 ; <i16*> [#uses=1]
  %2029 = load i16* %scevgep.i1578, align 2       ; <i16> [#uses=1]
  %2030 = or i16 %2024, %2029                     ; <i16> [#uses=1]
  %2031 = add i16 %2030, %result.03.us.i1576      ; <i16> [#uses=2]
  %2032 = add nsw i32 %n.02.us.i1577, 1           ; <i32> [#uses=2]
  %exitcond.i1579 = icmp eq i32 %2032, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1579, label %bb2.bb3_crit_edge.us.i1581, label %bb1.us.i1580

bb2.bb3_crit_edge.us.i1581:                       ; preds = %bb1.us.i1580
  %2033 = icmp eq i16 %2026, %2031                ; <i1> [#uses=1]
  br i1 %2033, label %_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1575

bb5.i1582:                                        ; preds = %_Z26check_shifted_variable_sumIt27custom_multiple_variable_orItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It18custom_variable_orItEEvPT_iS2_PKc.exit
  %2034 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2035 = sub i32 %2034, %2021                    ; <i32> [#uses=1]
  %2036 = sitofp i32 %2035 to double              ; <double> [#uses=1]
  %2037 = fdiv double %2036, 1.000000e+06         ; <double> [#uses=1]
  %.not2862 = icmp ne %struct.one_result* %results.67, null ; <i1> [#uses=1]
  %2038 = icmp sgt i32 %allocated_results.67, 69  ; <i1> [#uses=1]
  %or.cond2863 = and i1 %2038, %.not2862          ; <i1> [#uses=1]
  br i1 %or.cond2863, label %_Z14test_variable4It27custom_multiple_variable_orItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1584

bb1.i.i1584:                                      ; preds = %bb5.i1582
  %2039 = add nsw i32 %allocated_results.67, 10   ; <i32> [#uses=3]
  %2040 = mul i32 %2039, 12                       ; <i32> [#uses=1]
  %2041 = bitcast %struct.one_result* %results.67 to i8* ; <i8*> [#uses=1]
  %2042 = tail call i8* @realloc(i8* %2041, i32 %2040) nounwind ; <i8*> [#uses=2]
  %2043 = bitcast i8* %2042 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2044 = icmp eq i8* %2042, null                 ; <i1> [#uses=1]
  br i1 %2044, label %bb2.i.i1585, label %_Z14test_variable4It27custom_multiple_variable_orItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1585:                                      ; preds = %bb1.i.i1584
  %2045 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2039) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It27custom_multiple_variable_orItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1584, %bb5.i1582
  %results.68 = phi %struct.one_result* [ %2043, %bb1.i.i1584 ], [ %results.67, %bb5.i1582 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.68 = phi i32 [ %2039, %bb1.i.i1584 ], [ %allocated_results.67, %bb5.i1582 ] ; <i32> [#uses=3]
  %2046 = phi %struct.one_result* [ %2043, %bb1.i.i1584 ], [ %results.67, %bb5.i1582 ] ; <%struct.one_result*> [#uses=2]
  %2047 = getelementptr inbounds %struct.one_result* %2046, i32 69, i32 0 ; <double*> [#uses=1]
  store double %2037, double* %2047, align 4
  %2048 = getelementptr inbounds %struct.one_result* %2046, i32 69, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str81, i32 0, i32 0), i8** %2048, align 4
  %2049 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1556, label %bb5.i1567

bb.nph6.i1556:                                    ; preds = %_Z14test_variable4It27custom_multiple_variable_orItEEvPT_iS2_S2_S2_S2_PKc.exit
  %2050 = xor i16 %1601, %1603                    ; <i16> [#uses=1]
  %2051 = mul i16 %2050, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1559

bb2.preheader.us.i1559:                           ; preds = %_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i, %bb.nph6.i1556
  %i.05.us.i1557 = phi i32 [ 0, %bb.nph6.i1556 ], [ %tmp.i1558, %_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1558 = add i32 %i.05.us.i1557, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1565

_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1566, %bb.i1.us.i1560
  %2052 = icmp slt i32 %tmp.i1558, %iterations.0  ; <i1> [#uses=1]
  br i1 %2052, label %bb2.preheader.us.i1559, label %bb5.i1567

bb.i1.us.i1560:                                   ; preds = %bb2.bb3_crit_edge.us.i1566
  %2053 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 70) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i

bb1.us.i1565:                                     ; preds = %bb1.us.i1565, %bb2.preheader.us.i1559
  %result.03.us.i1561 = phi i16 [ 0, %bb2.preheader.us.i1559 ], [ %2056, %bb1.us.i1565 ] ; <i16> [#uses=1]
  %n.02.us.i1562 = phi i32 [ 0, %bb2.preheader.us.i1559 ], [ %2057, %bb1.us.i1565 ] ; <i32> [#uses=2]
  %scevgep.i1563 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1562 ; <i16*> [#uses=1]
  %2054 = load i16* %scevgep.i1563, align 2       ; <i16> [#uses=1]
  %2055 = xor i16 %2054, %1603                    ; <i16> [#uses=1]
  %2056 = add i16 %2055, %result.03.us.i1561      ; <i16> [#uses=2]
  %2057 = add nsw i32 %n.02.us.i1562, 1           ; <i32> [#uses=2]
  %exitcond.i1564 = icmp eq i32 %2057, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1564, label %bb2.bb3_crit_edge.us.i1566, label %bb1.us.i1565

bb2.bb3_crit_edge.us.i1566:                       ; preds = %bb1.us.i1565
  %2058 = icmp eq i16 %2051, %2056                ; <i1> [#uses=1]
  br i1 %2058, label %_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i, label %bb.i1.us.i1560

bb5.i1567:                                        ; preds = %_Z26check_shifted_variable_sumIt19custom_variable_xorItEEvT_S2_.exit.us.i, %_Z14test_variable4It27custom_multiple_variable_orItEEvPT_iS2_S2_S2_S2_PKc.exit
  %2059 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2060 = sub i32 %2059, %2049                    ; <i32> [#uses=1]
  %2061 = sitofp i32 %2060 to double              ; <double> [#uses=1]
  %2062 = fdiv double %2061, 1.000000e+06         ; <double> [#uses=1]
  %.not2864 = icmp ne %struct.one_result* %results.68, null ; <i1> [#uses=1]
  %2063 = icmp sgt i32 %allocated_results.68, 70  ; <i1> [#uses=1]
  %or.cond2865 = and i1 %2063, %.not2864          ; <i1> [#uses=1]
  br i1 %or.cond2865, label %_Z14test_variable1It19custom_variable_xorItEEvPT_iS2_PKc.exit, label %bb1.i.i1569

bb1.i.i1569:                                      ; preds = %bb5.i1567
  %2064 = add nsw i32 %allocated_results.68, 10   ; <i32> [#uses=3]
  %2065 = mul i32 %2064, 12                       ; <i32> [#uses=1]
  %2066 = bitcast %struct.one_result* %results.68 to i8* ; <i8*> [#uses=1]
  %2067 = tail call i8* @realloc(i8* %2066, i32 %2065) nounwind ; <i8*> [#uses=2]
  %2068 = bitcast i8* %2067 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2069 = icmp eq i8* %2067, null                 ; <i1> [#uses=1]
  br i1 %2069, label %bb2.i.i1570, label %_Z14test_variable1It19custom_variable_xorItEEvPT_iS2_PKc.exit

bb2.i.i1570:                                      ; preds = %bb1.i.i1569
  %2070 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2064) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1It19custom_variable_xorItEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1569, %bb5.i1567
  %results.69 = phi %struct.one_result* [ %2068, %bb1.i.i1569 ], [ %results.68, %bb5.i1567 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.69 = phi i32 [ %2064, %bb1.i.i1569 ], [ %allocated_results.68, %bb5.i1567 ] ; <i32> [#uses=3]
  %2071 = phi %struct.one_result* [ %2068, %bb1.i.i1569 ], [ %results.68, %bb5.i1567 ] ; <%struct.one_result*> [#uses=2]
  %2072 = getelementptr inbounds %struct.one_result* %2071, i32 70, i32 0 ; <double*> [#uses=1]
  store double %2062, double* %2072, align 4
  %2073 = getelementptr inbounds %struct.one_result* %2071, i32 70, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str82, i32 0, i32 0), i8** %2073, align 4
  %2074 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1541, label %bb5.i1552

bb.nph6.i1541:                                    ; preds = %_Z14test_variable1It19custom_variable_xorItEEvPT_iS2_PKc.exit
  %2075 = xor i16 %1604, %1603                    ; <i16> [#uses=1]
  %2076 = xor i16 %2075, %1605                    ; <i16> [#uses=1]
  %2077 = xor i16 %2076, %1607                    ; <i16> [#uses=2]
  %2078 = xor i16 %2077, %1601                    ; <i16> [#uses=1]
  %2079 = mul i16 %2078, 8000                     ; <i16> [#uses=1]
  br label %bb2.preheader.us.i1544

bb2.preheader.us.i1544:                           ; preds = %_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1541
  %i.05.us.i1542 = phi i32 [ 0, %bb.nph6.i1541 ], [ %tmp.i1543, %_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1543 = add i32 %i.05.us.i1542, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1550

_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1551, %bb.i1.us.i1545
  %2080 = icmp slt i32 %tmp.i1543, %iterations.0  ; <i1> [#uses=1]
  br i1 %2080, label %bb2.preheader.us.i1544, label %bb5.i1552

bb.i1.us.i1545:                                   ; preds = %bb2.bb3_crit_edge.us.i1551
  %2081 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 71) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1550:                                     ; preds = %bb1.us.i1550, %bb2.preheader.us.i1544
  %result.03.us.i1546 = phi i16 [ 0, %bb2.preheader.us.i1544 ], [ %2084, %bb1.us.i1550 ] ; <i16> [#uses=1]
  %n.02.us.i1547 = phi i32 [ 0, %bb2.preheader.us.i1544 ], [ %2085, %bb1.us.i1550 ] ; <i32> [#uses=2]
  %scevgep.i1548 = getelementptr [8000 x i16]* @data16unsigned, i32 0, i32 %n.02.us.i1547 ; <i16*> [#uses=1]
  %2082 = load i16* %scevgep.i1548, align 2       ; <i16> [#uses=1]
  %2083 = xor i16 %2077, %2082                    ; <i16> [#uses=1]
  %2084 = add i16 %2083, %result.03.us.i1546      ; <i16> [#uses=2]
  %2085 = add nsw i32 %n.02.us.i1547, 1           ; <i32> [#uses=2]
  %exitcond.i1549 = icmp eq i32 %2085, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1549, label %bb2.bb3_crit_edge.us.i1551, label %bb1.us.i1550

bb2.bb3_crit_edge.us.i1551:                       ; preds = %bb1.us.i1550
  %2086 = icmp eq i16 %2079, %2084                ; <i1> [#uses=1]
  br i1 %2086, label %_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1545

bb5.i1552:                                        ; preds = %_Z26check_shifted_variable_sumIt28custom_multiple_variable_xorItEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1It19custom_variable_xorItEEvPT_iS2_PKc.exit
  %2087 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2088 = sub i32 %2087, %2074                    ; <i32> [#uses=1]
  %2089 = sitofp i32 %2088 to double              ; <double> [#uses=1]
  %2090 = fdiv double %2089, 1.000000e+06         ; <double> [#uses=1]
  %.not2866 = icmp ne %struct.one_result* %results.69, null ; <i1> [#uses=1]
  %2091 = icmp sgt i32 %allocated_results.69, 71  ; <i1> [#uses=1]
  %or.cond2867 = and i1 %2091, %.not2866          ; <i1> [#uses=1]
  br i1 %or.cond2867, label %_Z14test_variable4It28custom_multiple_variable_xorItEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1554

bb1.i.i1554:                                      ; preds = %bb5.i1552
  %2092 = add nsw i32 %allocated_results.69, 10   ; <i32> [#uses=3]
  %2093 = mul i32 %2092, 12                       ; <i32> [#uses=1]
  %2094 = bitcast %struct.one_result* %results.69 to i8* ; <i8*> [#uses=1]
  %2095 = tail call i8* @realloc(i8* %2094, i32 %2093) nounwind ; <i8*> [#uses=2]
  %2096 = bitcast i8* %2095 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2097 = icmp eq i8* %2095, null                 ; <i1> [#uses=1]
  br i1 %2097, label %bb2.i.i1555, label %_Z14test_variable4It28custom_multiple_variable_xorItEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1555:                                      ; preds = %bb1.i.i1554
  %2098 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2092) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4It28custom_multiple_variable_xorItEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1554, %bb5.i1552
  %results.70 = phi %struct.one_result* [ %2096, %bb1.i.i1554 ], [ %results.69, %bb5.i1552 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.70 = phi i32 [ %2092, %bb1.i.i1554 ], [ %allocated_results.69, %bb5.i1552 ] ; <i32> [#uses=3]
  %2099 = phi %struct.one_result* [ %2096, %bb1.i.i1554 ], [ %results.69, %bb5.i1552 ] ; <%struct.one_result*> [#uses=2]
  %2100 = getelementptr inbounds %struct.one_result* %2099, i32 71, i32 0 ; <double*> [#uses=1]
  store double %2090, double* %2100, align 4
  %2101 = getelementptr inbounds %struct.one_result* %2099, i32 71, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str83, i32 0, i32 0), i8** %2101, align 4
  %2102 = fptosi double %init_value.0 to i32      ; <i32> [#uses=19]
  br label %bb.i18

bb.i18:                                           ; preds = %bb.i18, %_Z14test_variable4It28custom_multiple_variable_xorItEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i14 = phi i32 [ 0, %_Z14test_variable4It28custom_multiple_variable_xorItEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i16, %bb.i18 ] ; <i32> [#uses=2]
  %tmp.i16 = add i32 %indvar.i14, 1               ; <i32> [#uses=2]
  %first_addr.01.i15 = getelementptr [8000 x i32]* @data32, i32 0, i32 %indvar.i14 ; <i32*> [#uses=1]
  store i32 %2102, i32* %first_addr.01.i15, align 4
  %scevgep.i17.idx.mask = and i32 %tmp.i16, 1073741823 ; <i32> [#uses=1]
  %2103 = icmp eq i32 %scevgep.i17.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %2103, label %_Z4fillIPiiEvT_S1_T0_.exit, label %bb.i18

_Z4fillIPiiEvT_S1_T0_.exit:                       ; preds = %bb.i18
  %2104 = fptosi double %temp.0 to i32            ; <i32> [#uses=32]
  %2105 = shl i32 %2104, 1                        ; <i32> [#uses=13]
  %2106 = add nsw i32 %2104, 2                    ; <i32> [#uses=14]
  %2107 = sdiv i32 %2105, %2106                   ; <i32> [#uses=1]
  %2108 = add nsw i32 %2107, %2104                ; <i32> [#uses=13]
  %2109 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1525, label %bb5.i1537

bb.nph6.i1525:                                    ; preds = %_Z4fillIPiiEvT_S1_T0_.exit
  %2110 = add nsw i32 %2102, %2104                ; <i32> [#uses=1]
  %2111 = mul i32 %2110, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1528

bb2.preheader.us.i1528:                           ; preds = %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529, %bb.nph6.i1525
  %i.05.us.i1526 = phi i32 [ 0, %bb.nph6.i1525 ], [ %tmp.i1527, %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529 ] ; <i32> [#uses=1]
  %tmp.i1527 = add i32 %i.05.us.i1526, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1535

_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529: ; preds = %bb2.bb3_crit_edge.us.i1536, %bb.i1.us.i1530
  %2112 = icmp slt i32 %tmp.i1527, %iterations.0  ; <i1> [#uses=1]
  br i1 %2112, label %bb2.preheader.us.i1528, label %bb5.i1537

bb.i1.us.i1530:                                   ; preds = %bb2.bb3_crit_edge.us.i1536
  %2113 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 72) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529

bb1.us.i1535:                                     ; preds = %bb1.us.i1535, %bb2.preheader.us.i1528
  %result.03.us.i1531 = phi i32 [ 0, %bb2.preheader.us.i1528 ], [ %2116, %bb1.us.i1535 ] ; <i32> [#uses=1]
  %n.02.us.i1532 = phi i32 [ 0, %bb2.preheader.us.i1528 ], [ %2117, %bb1.us.i1535 ] ; <i32> [#uses=2]
  %scevgep.i1533 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1532 ; <i32*> [#uses=1]
  %2114 = load i32* %scevgep.i1533, align 4       ; <i32> [#uses=1]
  %2115 = add nsw i32 %result.03.us.i1531, %2104  ; <i32> [#uses=1]
  %2116 = add nsw i32 %2115, %2114                ; <i32> [#uses=2]
  %2117 = add nsw i32 %n.02.us.i1532, 1           ; <i32> [#uses=2]
  %exitcond.i1534 = icmp eq i32 %2117, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1534, label %bb2.bb3_crit_edge.us.i1536, label %bb1.us.i1535

bb2.bb3_crit_edge.us.i1536:                       ; preds = %bb1.us.i1535
  %2118 = icmp eq i32 %2111, %2116                ; <i1> [#uses=1]
  br i1 %2118, label %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529, label %bb.i1.us.i1530

bb5.i1537:                                        ; preds = %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i1529, %_Z4fillIPiiEvT_S1_T0_.exit
  %2119 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2120 = sub i32 %2119, %2109                    ; <i32> [#uses=1]
  %2121 = sitofp i32 %2120 to double              ; <double> [#uses=1]
  %2122 = fdiv double %2121, 1.000000e+06         ; <double> [#uses=1]
  %.not2868 = icmp ne %struct.one_result* %results.70, null ; <i1> [#uses=1]
  %2123 = icmp sgt i32 %allocated_results.70, 72  ; <i1> [#uses=1]
  %or.cond2869 = and i1 %2123, %.not2868          ; <i1> [#uses=1]
  br i1 %or.cond2869, label %_Z14test_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit, label %bb1.i.i1539

bb1.i.i1539:                                      ; preds = %bb5.i1537
  %2124 = add nsw i32 %allocated_results.70, 10   ; <i32> [#uses=3]
  %2125 = mul i32 %2124, 12                       ; <i32> [#uses=1]
  %2126 = bitcast %struct.one_result* %results.70 to i8* ; <i8*> [#uses=1]
  %2127 = tail call i8* @realloc(i8* %2126, i32 %2125) nounwind ; <i8*> [#uses=2]
  %2128 = bitcast i8* %2127 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2129 = icmp eq i8* %2127, null                 ; <i1> [#uses=1]
  br i1 %2129, label %bb2.i.i1540, label %_Z14test_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit

bb2.i.i1540:                                      ; preds = %bb1.i.i1539
  %2130 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2124) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1539, %bb5.i1537
  %results.71 = phi %struct.one_result* [ %2128, %bb1.i.i1539 ], [ %results.70, %bb5.i1537 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.71 = phi i32 [ %2124, %bb1.i.i1539 ], [ %allocated_results.70, %bb5.i1537 ] ; <i32> [#uses=3]
  %2131 = phi %struct.one_result* [ %2128, %bb1.i.i1539 ], [ %results.70, %bb5.i1537 ] ; <%struct.one_result*> [#uses=2]
  %2132 = getelementptr inbounds %struct.one_result* %2131, i32 72, i32 0 ; <double*> [#uses=1]
  store double %2122, double* %2132, align 4
  %2133 = getelementptr inbounds %struct.one_result* %2131, i32 72, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str84, i32 0, i32 0), i8** %2133, align 4
  %2134 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1510, label %bb5.i1521

bb.nph6.i1510:                                    ; preds = %_Z14test_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit
  %2135 = mul i32 %2104, 8000                     ; <i32> [#uses=1]
  %2136 = add nsw i32 %2102, %2104                ; <i32> [#uses=1]
  %2137 = mul i32 %2136, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1513

bb2.preheader.us.i1513:                           ; preds = %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i, %bb.nph6.i1510
  %i.05.us.i1511 = phi i32 [ 0, %bb.nph6.i1510 ], [ %tmp.i1512, %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1512 = add i32 %i.05.us.i1511, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1519

_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1520, %bb.i1.us.i1514
  %2138 = icmp slt i32 %tmp.i1512, %iterations.0  ; <i1> [#uses=1]
  br i1 %2138, label %bb2.preheader.us.i1513, label %bb5.i1521

bb.i1.us.i1514:                                   ; preds = %bb2.bb3_crit_edge.us.i1520
  %2139 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 73) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i

bb1.us.i1519:                                     ; preds = %bb1.us.i1519, %bb2.preheader.us.i1513
  %result.03.us.i1515 = phi i32 [ 0, %bb2.preheader.us.i1513 ], [ %2141, %bb1.us.i1519 ] ; <i32> [#uses=1]
  %n.02.us.i1516 = phi i32 [ 0, %bb2.preheader.us.i1513 ], [ %2142, %bb1.us.i1519 ] ; <i32> [#uses=2]
  %scevgep.i1517 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1516 ; <i32*> [#uses=1]
  %2140 = load i32* %scevgep.i1517, align 4       ; <i32> [#uses=1]
  %2141 = add nsw i32 %2140, %result.03.us.i1515  ; <i32> [#uses=2]
  %2142 = add nsw i32 %n.02.us.i1516, 1           ; <i32> [#uses=2]
  %exitcond.i1518 = icmp eq i32 %2142, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1518, label %bb2.bb3_crit_edge.us.i1520, label %bb1.us.i1519

bb2.bb3_crit_edge.us.i1520:                       ; preds = %bb1.us.i1519
  %2143 = add nsw i32 %2141, %2135                ; <i32> [#uses=1]
  %2144 = icmp eq i32 %2137, %2143                ; <i1> [#uses=1]
  br i1 %2144, label %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1514

bb5.i1521:                                        ; preds = %_Z26check_shifted_variable_sumIi19custom_add_variableIiEEvT_S2_.exit.us.i, %_Z14test_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit
  %2145 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2146 = sub i32 %2145, %2134                    ; <i32> [#uses=1]
  %2147 = sitofp i32 %2146 to double              ; <double> [#uses=1]
  %2148 = fdiv double %2147, 1.000000e+06         ; <double> [#uses=1]
  %.not2870 = icmp ne %struct.one_result* %results.71, null ; <i1> [#uses=1]
  %2149 = icmp sgt i32 %allocated_results.71, 73  ; <i1> [#uses=1]
  %or.cond2871 = and i1 %2149, %.not2870          ; <i1> [#uses=1]
  br i1 %or.cond2871, label %_Z22test_hoisted_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit, label %bb1.i.i1523

bb1.i.i1523:                                      ; preds = %bb5.i1521
  %2150 = add nsw i32 %allocated_results.71, 10   ; <i32> [#uses=3]
  %2151 = mul i32 %2150, 12                       ; <i32> [#uses=1]
  %2152 = bitcast %struct.one_result* %results.71 to i8* ; <i8*> [#uses=1]
  %2153 = tail call i8* @realloc(i8* %2152, i32 %2151) nounwind ; <i8*> [#uses=2]
  %2154 = bitcast i8* %2153 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2155 = icmp eq i8* %2153, null                 ; <i1> [#uses=1]
  br i1 %2155, label %bb2.i.i1524, label %_Z22test_hoisted_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit

bb2.i.i1524:                                      ; preds = %bb1.i.i1523
  %2156 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2150) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1523, %bb5.i1521
  %results.72 = phi %struct.one_result* [ %2154, %bb1.i.i1523 ], [ %results.71, %bb5.i1521 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.72 = phi i32 [ %2150, %bb1.i.i1523 ], [ %allocated_results.71, %bb5.i1521 ] ; <i32> [#uses=3]
  %2157 = phi %struct.one_result* [ %2154, %bb1.i.i1523 ], [ %results.71, %bb5.i1521 ] ; <%struct.one_result*> [#uses=2]
  %2158 = getelementptr inbounds %struct.one_result* %2157, i32 73, i32 0 ; <double*> [#uses=1]
  store double %2148, double* %2158, align 4
  %2159 = getelementptr inbounds %struct.one_result* %2157, i32 73, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str85, i32 0, i32 0), i8** %2159, align 4
  %2160 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1495, label %bb5.i1506

bb.nph6.i1495:                                    ; preds = %_Z22test_hoisted_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit
  %2161 = add nsw i32 %2105, %2104                ; <i32> [#uses=1]
  %2162 = add nsw i32 %2161, %2106                ; <i32> [#uses=1]
  %2163 = add nsw i32 %2162, %2108                ; <i32> [#uses=2]
  %2164 = add nsw i32 %2163, %2102                ; <i32> [#uses=1]
  %2165 = mul i32 %2164, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1498

bb2.preheader.us.i1498:                           ; preds = %_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1495
  %i.05.us.i1496 = phi i32 [ 0, %bb.nph6.i1495 ], [ %tmp.i1497, %_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1497 = add i32 %i.05.us.i1496, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1504

_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1505, %bb.i1.us.i1499
  %2166 = icmp slt i32 %tmp.i1497, %iterations.0  ; <i1> [#uses=1]
  br i1 %2166, label %bb2.preheader.us.i1498, label %bb5.i1506

bb.i1.us.i1499:                                   ; preds = %bb2.bb3_crit_edge.us.i1505
  %2167 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 74) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1504:                                     ; preds = %bb1.us.i1504, %bb2.preheader.us.i1498
  %result.03.us.i1500 = phi i32 [ 0, %bb2.preheader.us.i1498 ], [ %2170, %bb1.us.i1504 ] ; <i32> [#uses=1]
  %n.02.us.i1501 = phi i32 [ 0, %bb2.preheader.us.i1498 ], [ %2171, %bb1.us.i1504 ] ; <i32> [#uses=2]
  %scevgep.i1502 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1501 ; <i32*> [#uses=1]
  %2168 = load i32* %scevgep.i1502, align 4       ; <i32> [#uses=1]
  %2169 = add nsw i32 %2163, %result.03.us.i1500  ; <i32> [#uses=1]
  %2170 = add nsw i32 %2169, %2168                ; <i32> [#uses=2]
  %2171 = add nsw i32 %n.02.us.i1501, 1           ; <i32> [#uses=2]
  %exitcond.i1503 = icmp eq i32 %2171, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1503, label %bb2.bb3_crit_edge.us.i1505, label %bb1.us.i1504

bb2.bb3_crit_edge.us.i1505:                       ; preds = %bb1.us.i1504
  %2172 = icmp eq i32 %2165, %2170                ; <i1> [#uses=1]
  br i1 %2172, label %_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1499

bb5.i1506:                                        ; preds = %_Z26check_shifted_variable_sumIi28custom_add_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Ii19custom_add_variableIiEEvPT_iS2_PKc.exit
  %2173 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2174 = sub i32 %2173, %2160                    ; <i32> [#uses=1]
  %2175 = sitofp i32 %2174 to double              ; <double> [#uses=1]
  %2176 = fdiv double %2175, 1.000000e+06         ; <double> [#uses=1]
  %.not2872 = icmp ne %struct.one_result* %results.72, null ; <i1> [#uses=1]
  %2177 = icmp sgt i32 %allocated_results.72, 74  ; <i1> [#uses=1]
  %or.cond2873 = and i1 %2177, %.not2872          ; <i1> [#uses=1]
  br i1 %or.cond2873, label %_Z14test_variable4Ii28custom_add_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1508

bb1.i.i1508:                                      ; preds = %bb5.i1506
  %2178 = add nsw i32 %allocated_results.72, 10   ; <i32> [#uses=3]
  %2179 = mul i32 %2178, 12                       ; <i32> [#uses=1]
  %2180 = bitcast %struct.one_result* %results.72 to i8* ; <i8*> [#uses=1]
  %2181 = tail call i8* @realloc(i8* %2180, i32 %2179) nounwind ; <i8*> [#uses=2]
  %2182 = bitcast i8* %2181 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2183 = icmp eq i8* %2181, null                 ; <i1> [#uses=1]
  br i1 %2183, label %bb2.i.i1509, label %_Z14test_variable4Ii28custom_add_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1509:                                      ; preds = %bb1.i.i1508
  %2184 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2178) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii28custom_add_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1508, %bb5.i1506
  %results.73 = phi %struct.one_result* [ %2182, %bb1.i.i1508 ], [ %results.72, %bb5.i1506 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.73 = phi i32 [ %2178, %bb1.i.i1508 ], [ %allocated_results.72, %bb5.i1506 ] ; <i32> [#uses=3]
  %2185 = phi %struct.one_result* [ %2182, %bb1.i.i1508 ], [ %results.72, %bb5.i1506 ] ; <%struct.one_result*> [#uses=2]
  %2186 = getelementptr inbounds %struct.one_result* %2185, i32 74, i32 0 ; <double*> [#uses=1]
  store double %2176, double* %2186, align 4
  %2187 = getelementptr inbounds %struct.one_result* %2185, i32 74, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str86, i32 0, i32 0), i8** %2187, align 4
  %2188 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1480, label %bb5.i1491

bb.nph6.i1480:                                    ; preds = %_Z14test_variable4Ii28custom_add_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2189 = sub i32 %2102, %2104                    ; <i32> [#uses=1]
  %2190 = mul i32 %2189, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1483

bb2.preheader.us.i1483:                           ; preds = %_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i, %bb.nph6.i1480
  %i.05.us.i1481 = phi i32 [ 0, %bb.nph6.i1480 ], [ %tmp.i1482, %_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1482 = add i32 %i.05.us.i1481, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1489

_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1490, %bb.i1.us.i1484
  %2191 = icmp slt i32 %tmp.i1482, %iterations.0  ; <i1> [#uses=1]
  br i1 %2191, label %bb2.preheader.us.i1483, label %bb5.i1491

bb.i1.us.i1484:                                   ; preds = %bb2.bb3_crit_edge.us.i1490
  %2192 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 75) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i

bb1.us.i1489:                                     ; preds = %bb1.us.i1489, %bb2.preheader.us.i1483
  %result.03.us.i1485 = phi i32 [ 0, %bb2.preheader.us.i1483 ], [ %2195, %bb1.us.i1489 ] ; <i32> [#uses=1]
  %n.02.us.i1486 = phi i32 [ 0, %bb2.preheader.us.i1483 ], [ %2196, %bb1.us.i1489 ] ; <i32> [#uses=2]
  %scevgep.i1487 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1486 ; <i32*> [#uses=1]
  %2193 = load i32* %scevgep.i1487, align 4       ; <i32> [#uses=1]
  %2194 = sub i32 %result.03.us.i1485, %2104      ; <i32> [#uses=1]
  %2195 = add nsw i32 %2194, %2193                ; <i32> [#uses=2]
  %2196 = add nsw i32 %n.02.us.i1486, 1           ; <i32> [#uses=2]
  %exitcond.i1488 = icmp eq i32 %2196, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1488, label %bb2.bb3_crit_edge.us.i1490, label %bb1.us.i1489

bb2.bb3_crit_edge.us.i1490:                       ; preds = %bb1.us.i1489
  %2197 = icmp eq i32 %2190, %2195                ; <i1> [#uses=1]
  br i1 %2197, label %_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1484

bb5.i1491:                                        ; preds = %_Z26check_shifted_variable_sumIi19custom_sub_variableIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii28custom_add_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2198 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2199 = sub i32 %2198, %2188                    ; <i32> [#uses=1]
  %2200 = sitofp i32 %2199 to double              ; <double> [#uses=1]
  %2201 = fdiv double %2200, 1.000000e+06         ; <double> [#uses=1]
  %.not2874 = icmp ne %struct.one_result* %results.73, null ; <i1> [#uses=1]
  %2202 = icmp sgt i32 %allocated_results.73, 75  ; <i1> [#uses=1]
  %or.cond2875 = and i1 %2202, %.not2874          ; <i1> [#uses=1]
  br i1 %or.cond2875, label %_Z14test_variable1Ii19custom_sub_variableIiEEvPT_iS2_PKc.exit, label %bb1.i.i1493

bb1.i.i1493:                                      ; preds = %bb5.i1491
  %2203 = add nsw i32 %allocated_results.73, 10   ; <i32> [#uses=3]
  %2204 = mul i32 %2203, 12                       ; <i32> [#uses=1]
  %2205 = bitcast %struct.one_result* %results.73 to i8* ; <i8*> [#uses=1]
  %2206 = tail call i8* @realloc(i8* %2205, i32 %2204) nounwind ; <i8*> [#uses=2]
  %2207 = bitcast i8* %2206 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2208 = icmp eq i8* %2206, null                 ; <i1> [#uses=1]
  br i1 %2208, label %bb2.i.i1494, label %_Z14test_variable1Ii19custom_sub_variableIiEEvPT_iS2_PKc.exit

bb2.i.i1494:                                      ; preds = %bb1.i.i1493
  %2209 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2203) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii19custom_sub_variableIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1493, %bb5.i1491
  %results.74 = phi %struct.one_result* [ %2207, %bb1.i.i1493 ], [ %results.73, %bb5.i1491 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.74 = phi i32 [ %2203, %bb1.i.i1493 ], [ %allocated_results.73, %bb5.i1491 ] ; <i32> [#uses=3]
  %2210 = phi %struct.one_result* [ %2207, %bb1.i.i1493 ], [ %results.73, %bb5.i1491 ] ; <%struct.one_result*> [#uses=2]
  %2211 = getelementptr inbounds %struct.one_result* %2210, i32 75, i32 0 ; <double*> [#uses=1]
  store double %2201, double* %2211, align 4
  %2212 = getelementptr inbounds %struct.one_result* %2210, i32 75, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str87, i32 0, i32 0), i8** %2212, align 4
  %2213 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i1465, label %bb5.i1476

bb.nph8.i1465:                                    ; preds = %_Z14test_variable1Ii19custom_sub_variableIiEEvPT_iS2_PKc.exit
  %sum9.i1463 = add i32 %2105, %2104              ; <i32> [#uses=2]
  %2214 = sub i32 0, %sum9.i1463                  ; <i32> [#uses=1]
  %2215 = sub i32 %2214, %2106                    ; <i32> [#uses=1]
  %2216 = sub i32 %2215, %2108                    ; <i32> [#uses=1]
  %sum.i1464 = add i32 %sum9.i1463, %2106         ; <i32> [#uses=1]
  %2217 = sub i32 0, %sum.i1464                   ; <i32> [#uses=1]
  %2218 = sub i32 %2217, %2108                    ; <i32> [#uses=1]
  %2219 = add i32 %2218, %2102                    ; <i32> [#uses=1]
  %2220 = mul i32 %2219, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1468

bb2.preheader.us.i1468:                           ; preds = %_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i1465
  %i.07.us.i1466 = phi i32 [ 0, %bb.nph8.i1465 ], [ %tmp.i1467, %_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1467 = add i32 %i.07.us.i1466, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1474

_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1475, %bb.i1.us.i1469
  %2221 = icmp slt i32 %tmp.i1467, %iterations.0  ; <i1> [#uses=1]
  br i1 %2221, label %bb2.preheader.us.i1468, label %bb5.i1476

bb.i1.us.i1469:                                   ; preds = %bb2.bb3_crit_edge.us.i1475
  %2222 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 76) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1474:                                     ; preds = %bb1.us.i1474, %bb2.preheader.us.i1468
  %result.05.us.i1470 = phi i32 [ 0, %bb2.preheader.us.i1468 ], [ %2225, %bb1.us.i1474 ] ; <i32> [#uses=1]
  %n.04.us.i1471 = phi i32 [ 0, %bb2.preheader.us.i1468 ], [ %2226, %bb1.us.i1474 ] ; <i32> [#uses=2]
  %scevgep.i1472 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.04.us.i1471 ; <i32*> [#uses=1]
  %2223 = load i32* %scevgep.i1472, align 4       ; <i32> [#uses=1]
  %2224 = add i32 %2216, %result.05.us.i1470      ; <i32> [#uses=1]
  %2225 = add nsw i32 %2224, %2223                ; <i32> [#uses=2]
  %2226 = add nsw i32 %n.04.us.i1471, 1           ; <i32> [#uses=2]
  %exitcond.i1473 = icmp eq i32 %2226, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1473, label %bb2.bb3_crit_edge.us.i1475, label %bb1.us.i1474

bb2.bb3_crit_edge.us.i1475:                       ; preds = %bb1.us.i1474
  %2227 = icmp eq i32 %2220, %2225                ; <i1> [#uses=1]
  br i1 %2227, label %_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1469

bb5.i1476:                                        ; preds = %_Z26check_shifted_variable_sumIi28custom_sub_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii19custom_sub_variableIiEEvPT_iS2_PKc.exit
  %2228 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2229 = sub i32 %2228, %2213                    ; <i32> [#uses=1]
  %2230 = sitofp i32 %2229 to double              ; <double> [#uses=1]
  %2231 = fdiv double %2230, 1.000000e+06         ; <double> [#uses=1]
  %.not2876 = icmp ne %struct.one_result* %results.74, null ; <i1> [#uses=1]
  %2232 = icmp sgt i32 %allocated_results.74, 76  ; <i1> [#uses=1]
  %or.cond2877 = and i1 %2232, %.not2876          ; <i1> [#uses=1]
  br i1 %or.cond2877, label %_Z14test_variable4Ii28custom_sub_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1478

bb1.i.i1478:                                      ; preds = %bb5.i1476
  %2233 = add nsw i32 %allocated_results.74, 10   ; <i32> [#uses=3]
  %2234 = mul i32 %2233, 12                       ; <i32> [#uses=1]
  %2235 = bitcast %struct.one_result* %results.74 to i8* ; <i8*> [#uses=1]
  %2236 = tail call i8* @realloc(i8* %2235, i32 %2234) nounwind ; <i8*> [#uses=2]
  %2237 = bitcast i8* %2236 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2238 = icmp eq i8* %2236, null                 ; <i1> [#uses=1]
  br i1 %2238, label %bb2.i.i1479, label %_Z14test_variable4Ii28custom_sub_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1479:                                      ; preds = %bb1.i.i1478
  %2239 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2233) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii28custom_sub_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1478, %bb5.i1476
  %results.75 = phi %struct.one_result* [ %2237, %bb1.i.i1478 ], [ %results.74, %bb5.i1476 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.75 = phi i32 [ %2233, %bb1.i.i1478 ], [ %allocated_results.74, %bb5.i1476 ] ; <i32> [#uses=3]
  %2240 = phi %struct.one_result* [ %2237, %bb1.i.i1478 ], [ %results.74, %bb5.i1476 ] ; <%struct.one_result*> [#uses=2]
  %2241 = getelementptr inbounds %struct.one_result* %2240, i32 76, i32 0 ; <double*> [#uses=1]
  store double %2231, double* %2241, align 4
  %2242 = getelementptr inbounds %struct.one_result* %2240, i32 76, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str88, i32 0, i32 0), i8** %2242, align 4
  %2243 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1448, label %bb5.i1459

bb.nph6.i1448:                                    ; preds = %_Z14test_variable4Ii28custom_sub_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2244 = mul i32 %2104, 8000                     ; <i32> [#uses=1]
  %2245 = mul i32 %2244, %2102                    ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1451

bb2.preheader.us.i1451:                           ; preds = %_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i, %bb.nph6.i1448
  %i.05.us.i1449 = phi i32 [ 0, %bb.nph6.i1448 ], [ %tmp.i1450, %_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1450 = add i32 %i.05.us.i1449, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1457

_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1458, %bb.i1.us.i1452
  %2246 = icmp slt i32 %tmp.i1450, %iterations.0  ; <i1> [#uses=1]
  br i1 %2246, label %bb2.preheader.us.i1451, label %bb5.i1459

bb.i1.us.i1452:                                   ; preds = %bb2.bb3_crit_edge.us.i1458
  %2247 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 77) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i

bb1.us.i1457:                                     ; preds = %bb1.us.i1457, %bb2.preheader.us.i1451
  %result.03.us.i1453 = phi i32 [ 0, %bb2.preheader.us.i1451 ], [ %2250, %bb1.us.i1457 ] ; <i32> [#uses=1]
  %n.02.us.i1454 = phi i32 [ 0, %bb2.preheader.us.i1451 ], [ %2251, %bb1.us.i1457 ] ; <i32> [#uses=2]
  %scevgep.i1455 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1454 ; <i32*> [#uses=1]
  %2248 = load i32* %scevgep.i1455, align 4       ; <i32> [#uses=1]
  %2249 = mul i32 %2248, %2104                    ; <i32> [#uses=1]
  %2250 = add nsw i32 %2249, %result.03.us.i1453  ; <i32> [#uses=2]
  %2251 = add nsw i32 %n.02.us.i1454, 1           ; <i32> [#uses=2]
  %exitcond.i1456 = icmp eq i32 %2251, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1456, label %bb2.bb3_crit_edge.us.i1458, label %bb1.us.i1457

bb2.bb3_crit_edge.us.i1458:                       ; preds = %bb1.us.i1457
  %2252 = icmp eq i32 %2245, %2250                ; <i1> [#uses=1]
  br i1 %2252, label %_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1452

bb5.i1459:                                        ; preds = %_Z26check_shifted_variable_sumIi24custom_multiply_variableIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii28custom_sub_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2253 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2254 = sub i32 %2253, %2243                    ; <i32> [#uses=1]
  %2255 = sitofp i32 %2254 to double              ; <double> [#uses=1]
  %2256 = fdiv double %2255, 1.000000e+06         ; <double> [#uses=1]
  %.not2878 = icmp ne %struct.one_result* %results.75, null ; <i1> [#uses=1]
  %2257 = icmp sgt i32 %allocated_results.75, 77  ; <i1> [#uses=1]
  %or.cond2879 = and i1 %2257, %.not2878          ; <i1> [#uses=1]
  br i1 %or.cond2879, label %_Z14test_variable1Ii24custom_multiply_variableIiEEvPT_iS2_PKc.exit, label %bb1.i.i1461

bb1.i.i1461:                                      ; preds = %bb5.i1459
  %2258 = add nsw i32 %allocated_results.75, 10   ; <i32> [#uses=3]
  %2259 = mul i32 %2258, 12                       ; <i32> [#uses=1]
  %2260 = bitcast %struct.one_result* %results.75 to i8* ; <i8*> [#uses=1]
  %2261 = tail call i8* @realloc(i8* %2260, i32 %2259) nounwind ; <i8*> [#uses=2]
  %2262 = bitcast i8* %2261 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2263 = icmp eq i8* %2261, null                 ; <i1> [#uses=1]
  br i1 %2263, label %bb2.i.i1462, label %_Z14test_variable1Ii24custom_multiply_variableIiEEvPT_iS2_PKc.exit

bb2.i.i1462:                                      ; preds = %bb1.i.i1461
  %2264 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2258) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii24custom_multiply_variableIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1461, %bb5.i1459
  %results.76 = phi %struct.one_result* [ %2262, %bb1.i.i1461 ], [ %results.75, %bb5.i1459 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.76 = phi i32 [ %2258, %bb1.i.i1461 ], [ %allocated_results.75, %bb5.i1459 ] ; <i32> [#uses=3]
  %2265 = phi %struct.one_result* [ %2262, %bb1.i.i1461 ], [ %results.75, %bb5.i1459 ] ; <%struct.one_result*> [#uses=2]
  %2266 = getelementptr inbounds %struct.one_result* %2265, i32 77, i32 0 ; <double*> [#uses=1]
  store double %2256, double* %2266, align 4
  %2267 = getelementptr inbounds %struct.one_result* %2265, i32 77, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str89, i32 0, i32 0), i8** %2267, align 4
  %2268 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1433, label %bb5.i1444

bb.nph6.i1433:                                    ; preds = %_Z14test_variable1Ii24custom_multiply_variableIiEEvPT_iS2_PKc.exit
  %2269 = mul i32 %2105, %2104                    ; <i32> [#uses=1]
  %2270 = mul i32 %2269, %2106                    ; <i32> [#uses=1]
  %2271 = mul i32 %2270, %2108                    ; <i32> [#uses=1]
  %2272 = mul i32 %2104, 8000                     ; <i32> [#uses=1]
  %2273 = mul i32 %2272, %2105                    ; <i32> [#uses=1]
  %2274 = mul i32 %2273, %2106                    ; <i32> [#uses=1]
  %2275 = mul i32 %2274, %2108                    ; <i32> [#uses=1]
  %2276 = mul i32 %2275, %2102                    ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1436

bb2.preheader.us.i1436:                           ; preds = %_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1433
  %i.05.us.i1434 = phi i32 [ 0, %bb.nph6.i1433 ], [ %tmp.i1435, %_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1435 = add i32 %i.05.us.i1434, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1442

_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1443, %bb.i1.us.i1437
  %2277 = icmp slt i32 %tmp.i1435, %iterations.0  ; <i1> [#uses=1]
  br i1 %2277, label %bb2.preheader.us.i1436, label %bb5.i1444

bb.i1.us.i1437:                                   ; preds = %bb2.bb3_crit_edge.us.i1443
  %2278 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 78) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1442:                                     ; preds = %bb1.us.i1442, %bb2.preheader.us.i1436
  %result.03.us.i1438 = phi i32 [ 0, %bb2.preheader.us.i1436 ], [ %2281, %bb1.us.i1442 ] ; <i32> [#uses=1]
  %n.02.us.i1439 = phi i32 [ 0, %bb2.preheader.us.i1436 ], [ %2282, %bb1.us.i1442 ] ; <i32> [#uses=2]
  %scevgep.i1440 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1439 ; <i32*> [#uses=1]
  %2279 = load i32* %scevgep.i1440, align 4       ; <i32> [#uses=1]
  %2280 = mul i32 %2271, %2279                    ; <i32> [#uses=1]
  %2281 = add nsw i32 %2280, %result.03.us.i1438  ; <i32> [#uses=2]
  %2282 = add nsw i32 %n.02.us.i1439, 1           ; <i32> [#uses=2]
  %exitcond.i1441 = icmp eq i32 %2282, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1441, label %bb2.bb3_crit_edge.us.i1443, label %bb1.us.i1442

bb2.bb3_crit_edge.us.i1443:                       ; preds = %bb1.us.i1442
  %2283 = icmp eq i32 %2276, %2281                ; <i1> [#uses=1]
  br i1 %2283, label %_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1437

bb5.i1444:                                        ; preds = %_Z26check_shifted_variable_sumIi33custom_multiply_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii24custom_multiply_variableIiEEvPT_iS2_PKc.exit
  %2284 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2285 = sub i32 %2284, %2268                    ; <i32> [#uses=1]
  %2286 = sitofp i32 %2285 to double              ; <double> [#uses=1]
  %2287 = fdiv double %2286, 1.000000e+06         ; <double> [#uses=1]
  %.not2880 = icmp ne %struct.one_result* %results.76, null ; <i1> [#uses=1]
  %2288 = icmp sgt i32 %allocated_results.76, 78  ; <i1> [#uses=1]
  %or.cond2881 = and i1 %2288, %.not2880          ; <i1> [#uses=1]
  br i1 %or.cond2881, label %_Z14test_variable4Ii33custom_multiply_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1446

bb1.i.i1446:                                      ; preds = %bb5.i1444
  %2289 = add nsw i32 %allocated_results.76, 10   ; <i32> [#uses=3]
  %2290 = mul i32 %2289, 12                       ; <i32> [#uses=1]
  %2291 = bitcast %struct.one_result* %results.76 to i8* ; <i8*> [#uses=1]
  %2292 = tail call i8* @realloc(i8* %2291, i32 %2290) nounwind ; <i8*> [#uses=2]
  %2293 = bitcast i8* %2292 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2294 = icmp eq i8* %2292, null                 ; <i1> [#uses=1]
  br i1 %2294, label %bb2.i.i1447, label %_Z14test_variable4Ii33custom_multiply_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1447:                                      ; preds = %bb1.i.i1446
  %2295 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2289) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii33custom_multiply_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1446, %bb5.i1444
  %results.77 = phi %struct.one_result* [ %2293, %bb1.i.i1446 ], [ %results.76, %bb5.i1444 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.77 = phi i32 [ %2289, %bb1.i.i1446 ], [ %allocated_results.76, %bb5.i1444 ] ; <i32> [#uses=3]
  %2296 = phi %struct.one_result* [ %2293, %bb1.i.i1446 ], [ %results.76, %bb5.i1444 ] ; <%struct.one_result*> [#uses=2]
  %2297 = getelementptr inbounds %struct.one_result* %2296, i32 78, i32 0 ; <double*> [#uses=1]
  store double %2287, double* %2297, align 4
  %2298 = getelementptr inbounds %struct.one_result* %2296, i32 78, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str90, i32 0, i32 0), i8** %2298, align 4
  %2299 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1418, label %bb5.i1429

bb.nph6.i1418:                                    ; preds = %_Z14test_variable4Ii33custom_multiply_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2300 = mul i32 %2105, %2104                    ; <i32> [#uses=1]
  %2301 = mul i32 %2300, %2106                    ; <i32> [#uses=1]
  %2302 = mul i32 %2301, %2108                    ; <i32> [#uses=2]
  %2303 = add nsw i32 %2102, %2302                ; <i32> [#uses=1]
  %2304 = mul i32 %2303, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1421

bb2.preheader.us.i1421:                           ; preds = %_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1418
  %i.05.us.i1419 = phi i32 [ 0, %bb.nph6.i1418 ], [ %tmp.i1420, %_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1420 = add i32 %i.05.us.i1419, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1427

_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1428, %bb.i1.us.i1422
  %2305 = icmp slt i32 %tmp.i1420, %iterations.0  ; <i1> [#uses=1]
  br i1 %2305, label %bb2.preheader.us.i1421, label %bb5.i1429

bb.i1.us.i1422:                                   ; preds = %bb2.bb3_crit_edge.us.i1428
  %2306 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 79) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1427:                                     ; preds = %bb1.us.i1427, %bb2.preheader.us.i1421
  %result.03.us.i1423 = phi i32 [ 0, %bb2.preheader.us.i1421 ], [ %2309, %bb1.us.i1427 ] ; <i32> [#uses=1]
  %n.02.us.i1424 = phi i32 [ 0, %bb2.preheader.us.i1421 ], [ %2310, %bb1.us.i1427 ] ; <i32> [#uses=2]
  %scevgep.i1425 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1424 ; <i32*> [#uses=1]
  %2307 = load i32* %scevgep.i1425, align 4       ; <i32> [#uses=1]
  %2308 = add nsw i32 %result.03.us.i1423, %2302  ; <i32> [#uses=1]
  %2309 = add nsw i32 %2308, %2307                ; <i32> [#uses=2]
  %2310 = add nsw i32 %n.02.us.i1424, 1           ; <i32> [#uses=2]
  %exitcond.i1426 = icmp eq i32 %2310, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1426, label %bb2.bb3_crit_edge.us.i1428, label %bb1.us.i1427

bb2.bb3_crit_edge.us.i1428:                       ; preds = %bb1.us.i1427
  %2311 = icmp eq i32 %2304, %2309                ; <i1> [#uses=1]
  br i1 %2311, label %_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1422

bb5.i1429:                                        ; preds = %_Z26check_shifted_variable_sumIi34custom_multiply_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ii33custom_multiply_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2312 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2313 = sub i32 %2312, %2299                    ; <i32> [#uses=1]
  %2314 = sitofp i32 %2313 to double              ; <double> [#uses=1]
  %2315 = fdiv double %2314, 1.000000e+06         ; <double> [#uses=1]
  %.not2882 = icmp ne %struct.one_result* %results.77, null ; <i1> [#uses=1]
  %2316 = icmp sgt i32 %allocated_results.77, 79  ; <i1> [#uses=1]
  %or.cond2883 = and i1 %2316, %.not2882          ; <i1> [#uses=1]
  br i1 %or.cond2883, label %_Z14test_variable4Ii34custom_multiply_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1431

bb1.i.i1431:                                      ; preds = %bb5.i1429
  %2317 = add nsw i32 %allocated_results.77, 10   ; <i32> [#uses=3]
  %2318 = mul i32 %2317, 12                       ; <i32> [#uses=1]
  %2319 = bitcast %struct.one_result* %results.77 to i8* ; <i8*> [#uses=1]
  %2320 = tail call i8* @realloc(i8* %2319, i32 %2318) nounwind ; <i8*> [#uses=2]
  %2321 = bitcast i8* %2320 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2322 = icmp eq i8* %2320, null                 ; <i1> [#uses=1]
  br i1 %2322, label %bb2.i.i1432, label %_Z14test_variable4Ii34custom_multiply_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1432:                                      ; preds = %bb1.i.i1431
  %2323 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2317) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii34custom_multiply_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1431, %bb5.i1429
  %results.78 = phi %struct.one_result* [ %2321, %bb1.i.i1431 ], [ %results.77, %bb5.i1429 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.78 = phi i32 [ %2317, %bb1.i.i1431 ], [ %allocated_results.77, %bb5.i1429 ] ; <i32> [#uses=3]
  %2324 = phi %struct.one_result* [ %2321, %bb1.i.i1431 ], [ %results.77, %bb5.i1429 ] ; <%struct.one_result*> [#uses=2]
  %2325 = getelementptr inbounds %struct.one_result* %2324, i32 79, i32 0 ; <double*> [#uses=1]
  store double %2315, double* %2325, align 4
  %2326 = getelementptr inbounds %struct.one_result* %2324, i32 79, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str91, i32 0, i32 0), i8** %2326, align 4
  %2327 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1403, label %bb5.i1414

bb.nph6.i1403:                                    ; preds = %_Z14test_variable4Ii34custom_multiply_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2328 = sdiv i32 %2102, %2104                   ; <i32> [#uses=1]
  %2329 = mul i32 %2328, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1406

bb2.preheader.us.i1406:                           ; preds = %_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i, %bb.nph6.i1403
  %i.05.us.i1404 = phi i32 [ 0, %bb.nph6.i1403 ], [ %tmp.i1405, %_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1405 = add i32 %i.05.us.i1404, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1412

_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1413, %bb.i1.us.i1407
  %2330 = icmp slt i32 %tmp.i1405, %iterations.0  ; <i1> [#uses=1]
  br i1 %2330, label %bb2.preheader.us.i1406, label %bb5.i1414

bb.i1.us.i1407:                                   ; preds = %bb2.bb3_crit_edge.us.i1413
  %2331 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 80) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i

bb1.us.i1412:                                     ; preds = %bb1.us.i1412, %bb2.preheader.us.i1406
  %result.03.us.i1408 = phi i32 [ 0, %bb2.preheader.us.i1406 ], [ %2334, %bb1.us.i1412 ] ; <i32> [#uses=1]
  %n.02.us.i1409 = phi i32 [ 0, %bb2.preheader.us.i1406 ], [ %2335, %bb1.us.i1412 ] ; <i32> [#uses=2]
  %scevgep.i1410 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1409 ; <i32*> [#uses=1]
  %2332 = load i32* %scevgep.i1410, align 4       ; <i32> [#uses=1]
  %2333 = sdiv i32 %2332, %2104                   ; <i32> [#uses=1]
  %2334 = add nsw i32 %2333, %result.03.us.i1408  ; <i32> [#uses=2]
  %2335 = add nsw i32 %n.02.us.i1409, 1           ; <i32> [#uses=2]
  %exitcond.i1411 = icmp eq i32 %2335, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1411, label %bb2.bb3_crit_edge.us.i1413, label %bb1.us.i1412

bb2.bb3_crit_edge.us.i1413:                       ; preds = %bb1.us.i1412
  %2336 = icmp eq i32 %2329, %2334                ; <i1> [#uses=1]
  br i1 %2336, label %_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1407

bb5.i1414:                                        ; preds = %_Z26check_shifted_variable_sumIi22custom_divide_variableIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii34custom_multiply_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2337 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2338 = sub i32 %2337, %2327                    ; <i32> [#uses=1]
  %2339 = sitofp i32 %2338 to double              ; <double> [#uses=1]
  %2340 = fdiv double %2339, 1.000000e+06         ; <double> [#uses=1]
  %.not2884 = icmp ne %struct.one_result* %results.78, null ; <i1> [#uses=1]
  %2341 = icmp sgt i32 %allocated_results.78, 80  ; <i1> [#uses=1]
  %or.cond2885 = and i1 %2341, %.not2884          ; <i1> [#uses=1]
  br i1 %or.cond2885, label %_Z14test_variable1Ii22custom_divide_variableIiEEvPT_iS2_PKc.exit, label %bb1.i.i1416

bb1.i.i1416:                                      ; preds = %bb5.i1414
  %2342 = add nsw i32 %allocated_results.78, 10   ; <i32> [#uses=3]
  %2343 = mul i32 %2342, 12                       ; <i32> [#uses=1]
  %2344 = bitcast %struct.one_result* %results.78 to i8* ; <i8*> [#uses=1]
  %2345 = tail call i8* @realloc(i8* %2344, i32 %2343) nounwind ; <i8*> [#uses=2]
  %2346 = bitcast i8* %2345 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2347 = icmp eq i8* %2345, null                 ; <i1> [#uses=1]
  br i1 %2347, label %bb2.i.i1417, label %_Z14test_variable1Ii22custom_divide_variableIiEEvPT_iS2_PKc.exit

bb2.i.i1417:                                      ; preds = %bb1.i.i1416
  %2348 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2342) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii22custom_divide_variableIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1416, %bb5.i1414
  %results.79 = phi %struct.one_result* [ %2346, %bb1.i.i1416 ], [ %results.78, %bb5.i1414 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.79 = phi i32 [ %2342, %bb1.i.i1416 ], [ %allocated_results.78, %bb5.i1414 ] ; <i32> [#uses=3]
  %2349 = phi %struct.one_result* [ %2346, %bb1.i.i1416 ], [ %results.78, %bb5.i1414 ] ; <%struct.one_result*> [#uses=2]
  %2350 = getelementptr inbounds %struct.one_result* %2349, i32 80, i32 0 ; <double*> [#uses=1]
  store double %2340, double* %2350, align 4
  %2351 = getelementptr inbounds %struct.one_result* %2349, i32 80, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str92, i32 0, i32 0), i8** %2351, align 4
  %2352 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1388, label %bb5.i1399

bb.nph6.i1388:                                    ; preds = %_Z14test_variable1Ii22custom_divide_variableIiEEvPT_iS2_PKc.exit
  %2353 = sdiv i32 %2102, %2104                   ; <i32> [#uses=1]
  %2354 = sdiv i32 %2353, %2105                   ; <i32> [#uses=1]
  %2355 = sdiv i32 %2354, %2106                   ; <i32> [#uses=1]
  %2356 = sdiv i32 %2355, %2108                   ; <i32> [#uses=1]
  %2357 = mul i32 %2356, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1391

bb2.preheader.us.i1391:                           ; preds = %_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1388
  %i.05.us.i1389 = phi i32 [ 0, %bb.nph6.i1388 ], [ %tmp.i1390, %_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1390 = add i32 %i.05.us.i1389, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1397

_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1398, %bb.i1.us.i1392
  %2358 = icmp slt i32 %tmp.i1390, %iterations.0  ; <i1> [#uses=1]
  br i1 %2358, label %bb2.preheader.us.i1391, label %bb5.i1399

bb.i1.us.i1392:                                   ; preds = %bb2.bb3_crit_edge.us.i1398
  %2359 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 81) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1397:                                     ; preds = %bb1.us.i1397, %bb2.preheader.us.i1391
  %result.03.us.i1393 = phi i32 [ 0, %bb2.preheader.us.i1391 ], [ %2365, %bb1.us.i1397 ] ; <i32> [#uses=1]
  %n.02.us.i1394 = phi i32 [ 0, %bb2.preheader.us.i1391 ], [ %2366, %bb1.us.i1397 ] ; <i32> [#uses=2]
  %scevgep.i1395 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1394 ; <i32*> [#uses=1]
  %2360 = load i32* %scevgep.i1395, align 4       ; <i32> [#uses=1]
  %2361 = sdiv i32 %2360, %2104                   ; <i32> [#uses=1]
  %2362 = sdiv i32 %2361, %2105                   ; <i32> [#uses=1]
  %2363 = sdiv i32 %2362, %2106                   ; <i32> [#uses=1]
  %2364 = sdiv i32 %2363, %2108                   ; <i32> [#uses=1]
  %2365 = add nsw i32 %2364, %result.03.us.i1393  ; <i32> [#uses=2]
  %2366 = add nsw i32 %n.02.us.i1394, 1           ; <i32> [#uses=2]
  %exitcond.i1396 = icmp eq i32 %2366, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1396, label %bb2.bb3_crit_edge.us.i1398, label %bb1.us.i1397

bb2.bb3_crit_edge.us.i1398:                       ; preds = %bb1.us.i1397
  %2367 = icmp eq i32 %2357, %2365                ; <i1> [#uses=1]
  br i1 %2367, label %_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1392

bb5.i1399:                                        ; preds = %_Z26check_shifted_variable_sumIi31custom_divide_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii22custom_divide_variableIiEEvPT_iS2_PKc.exit
  %2368 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2369 = sub i32 %2368, %2352                    ; <i32> [#uses=1]
  %2370 = sitofp i32 %2369 to double              ; <double> [#uses=1]
  %2371 = fdiv double %2370, 1.000000e+06         ; <double> [#uses=1]
  %.not2886 = icmp ne %struct.one_result* %results.79, null ; <i1> [#uses=1]
  %2372 = icmp sgt i32 %allocated_results.79, 81  ; <i1> [#uses=1]
  %or.cond2887 = and i1 %2372, %.not2886          ; <i1> [#uses=1]
  br i1 %or.cond2887, label %_Z14test_variable4Ii31custom_divide_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1401

bb1.i.i1401:                                      ; preds = %bb5.i1399
  %2373 = add nsw i32 %allocated_results.79, 10   ; <i32> [#uses=3]
  %2374 = mul i32 %2373, 12                       ; <i32> [#uses=1]
  %2375 = bitcast %struct.one_result* %results.79 to i8* ; <i8*> [#uses=1]
  %2376 = tail call i8* @realloc(i8* %2375, i32 %2374) nounwind ; <i8*> [#uses=2]
  %2377 = bitcast i8* %2376 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2378 = icmp eq i8* %2376, null                 ; <i1> [#uses=1]
  br i1 %2378, label %bb2.i.i1402, label %_Z14test_variable4Ii31custom_divide_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1402:                                      ; preds = %bb1.i.i1401
  %2379 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2373) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii31custom_divide_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1401, %bb5.i1399
  %results.80 = phi %struct.one_result* [ %2377, %bb1.i.i1401 ], [ %results.79, %bb5.i1399 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.80 = phi i32 [ %2373, %bb1.i.i1401 ], [ %allocated_results.79, %bb5.i1399 ] ; <i32> [#uses=3]
  %2380 = phi %struct.one_result* [ %2377, %bb1.i.i1401 ], [ %results.79, %bb5.i1399 ] ; <%struct.one_result*> [#uses=2]
  %2381 = getelementptr inbounds %struct.one_result* %2380, i32 81, i32 0 ; <double*> [#uses=1]
  store double %2371, double* %2381, align 4
  %2382 = getelementptr inbounds %struct.one_result* %2380, i32 81, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str93, i32 0, i32 0), i8** %2382, align 4
  %2383 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1373, label %bb5.i1384

bb.nph6.i1373:                                    ; preds = %_Z14test_variable4Ii31custom_divide_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2384 = sdiv i32 %2104, %2105                   ; <i32> [#uses=1]
  %2385 = sdiv i32 %2384, %2106                   ; <i32> [#uses=1]
  %2386 = sdiv i32 %2385, %2108                   ; <i32> [#uses=2]
  %2387 = add nsw i32 %2386, %2102                ; <i32> [#uses=1]
  %2388 = mul i32 %2387, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1376

bb2.preheader.us.i1376:                           ; preds = %_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1373
  %i.05.us.i1374 = phi i32 [ 0, %bb.nph6.i1373 ], [ %tmp.i1375, %_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1375 = add i32 %i.05.us.i1374, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1382

_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1383, %bb.i1.us.i1377
  %2389 = icmp slt i32 %tmp.i1375, %iterations.0  ; <i1> [#uses=1]
  br i1 %2389, label %bb2.preheader.us.i1376, label %bb5.i1384

bb.i1.us.i1377:                                   ; preds = %bb2.bb3_crit_edge.us.i1383
  %2390 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 82) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1382:                                     ; preds = %bb1.us.i1382, %bb2.preheader.us.i1376
  %result.03.us.i1378 = phi i32 [ 0, %bb2.preheader.us.i1376 ], [ %2393, %bb1.us.i1382 ] ; <i32> [#uses=1]
  %n.02.us.i1379 = phi i32 [ 0, %bb2.preheader.us.i1376 ], [ %2394, %bb1.us.i1382 ] ; <i32> [#uses=2]
  %scevgep.i1380 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1379 ; <i32*> [#uses=1]
  %2391 = load i32* %scevgep.i1380, align 4       ; <i32> [#uses=1]
  %2392 = add nsw i32 %2391, %result.03.us.i1378  ; <i32> [#uses=1]
  %2393 = add nsw i32 %2392, %2386                ; <i32> [#uses=2]
  %2394 = add nsw i32 %n.02.us.i1379, 1           ; <i32> [#uses=2]
  %exitcond.i1381 = icmp eq i32 %2394, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1381, label %bb2.bb3_crit_edge.us.i1383, label %bb1.us.i1382

bb2.bb3_crit_edge.us.i1383:                       ; preds = %bb1.us.i1382
  %2395 = icmp eq i32 %2388, %2393                ; <i1> [#uses=1]
  br i1 %2395, label %_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1377

bb5.i1384:                                        ; preds = %_Z26check_shifted_variable_sumIi32custom_divide_multiple_variable2IiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ii31custom_divide_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2396 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2397 = sub i32 %2396, %2383                    ; <i32> [#uses=1]
  %2398 = sitofp i32 %2397 to double              ; <double> [#uses=1]
  %2399 = fdiv double %2398, 1.000000e+06         ; <double> [#uses=1]
  %.not2888 = icmp ne %struct.one_result* %results.80, null ; <i1> [#uses=1]
  %2400 = icmp sgt i32 %allocated_results.80, 82  ; <i1> [#uses=1]
  %or.cond2889 = and i1 %2400, %.not2888          ; <i1> [#uses=1]
  br i1 %or.cond2889, label %_Z14test_variable4Ii32custom_divide_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1386

bb1.i.i1386:                                      ; preds = %bb5.i1384
  %2401 = add nsw i32 %allocated_results.80, 10   ; <i32> [#uses=3]
  %2402 = mul i32 %2401, 12                       ; <i32> [#uses=1]
  %2403 = bitcast %struct.one_result* %results.80 to i8* ; <i8*> [#uses=1]
  %2404 = tail call i8* @realloc(i8* %2403, i32 %2402) nounwind ; <i8*> [#uses=2]
  %2405 = bitcast i8* %2404 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2406 = icmp eq i8* %2404, null                 ; <i1> [#uses=1]
  br i1 %2406, label %bb2.i.i1387, label %_Z14test_variable4Ii32custom_divide_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1387:                                      ; preds = %bb1.i.i1386
  %2407 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2401) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii32custom_divide_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1386, %bb5.i1384
  %results.81 = phi %struct.one_result* [ %2405, %bb1.i.i1386 ], [ %results.80, %bb5.i1384 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.81 = phi i32 [ %2401, %bb1.i.i1386 ], [ %allocated_results.80, %bb5.i1384 ] ; <i32> [#uses=3]
  %2408 = phi %struct.one_result* [ %2405, %bb1.i.i1386 ], [ %results.80, %bb5.i1384 ] ; <%struct.one_result*> [#uses=2]
  %2409 = getelementptr inbounds %struct.one_result* %2408, i32 82, i32 0 ; <double*> [#uses=1]
  store double %2399, double* %2409, align 4
  %2410 = getelementptr inbounds %struct.one_result* %2408, i32 82, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str94, i32 0, i32 0), i8** %2410, align 4
  %2411 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i1358, label %bb5.i1369

bb.nph7.i1358:                                    ; preds = %_Z14test_variable4Ii32custom_divide_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2412 = mul i32 %2106, %2105                    ; <i32> [#uses=1]
  %2413 = sdiv i32 %2412, %2108                   ; <i32> [#uses=2]
  %2414 = add i32 %2102, %2104                    ; <i32> [#uses=1]
  %2415 = sub i32 %2414, %2413                    ; <i32> [#uses=1]
  %2416 = mul i32 %2415, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1361

bb2.preheader.us.i1361:                           ; preds = %_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i1358
  %i.06.us.i1359 = phi i32 [ 0, %bb.nph7.i1358 ], [ %tmp.i1360, %_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1360 = add i32 %i.06.us.i1359, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1367

_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1368, %bb.i1.us.i1362
  %2417 = icmp slt i32 %tmp.i1360, %iterations.0  ; <i1> [#uses=1]
  br i1 %2417, label %bb2.preheader.us.i1361, label %bb5.i1369

bb.i1.us.i1362:                                   ; preds = %bb2.bb3_crit_edge.us.i1368
  %2418 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 83) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1367:                                     ; preds = %bb1.us.i1367, %bb2.preheader.us.i1361
  %result.04.us.i1363 = phi i32 [ 0, %bb2.preheader.us.i1361 ], [ %2422, %bb1.us.i1367 ] ; <i32> [#uses=1]
  %n.03.us.i1364 = phi i32 [ 0, %bb2.preheader.us.i1361 ], [ %2423, %bb1.us.i1367 ] ; <i32> [#uses=2]
  %scevgep.i1365 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.03.us.i1364 ; <i32*> [#uses=1]
  %2419 = load i32* %scevgep.i1365, align 4       ; <i32> [#uses=1]
  %2420 = add nsw i32 %result.04.us.i1363, %2104  ; <i32> [#uses=1]
  %2421 = add i32 %2420, %2419                    ; <i32> [#uses=1]
  %2422 = sub i32 %2421, %2413                    ; <i32> [#uses=2]
  %2423 = add nsw i32 %n.03.us.i1364, 1           ; <i32> [#uses=2]
  %exitcond.i1366 = icmp eq i32 %2423, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1366, label %bb2.bb3_crit_edge.us.i1368, label %bb1.us.i1367

bb2.bb3_crit_edge.us.i1368:                       ; preds = %bb1.us.i1367
  %2424 = icmp eq i32 %2416, %2422                ; <i1> [#uses=1]
  br i1 %2424, label %_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1362

bb5.i1369:                                        ; preds = %_Z26check_shifted_variable_sumIi30custom_mixed_multiple_variableIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ii32custom_divide_multiple_variable2IiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2425 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2426 = sub i32 %2425, %2411                    ; <i32> [#uses=1]
  %2427 = sitofp i32 %2426 to double              ; <double> [#uses=1]
  %2428 = fdiv double %2427, 1.000000e+06         ; <double> [#uses=1]
  %.not2890 = icmp ne %struct.one_result* %results.81, null ; <i1> [#uses=1]
  %2429 = icmp sgt i32 %allocated_results.81, 83  ; <i1> [#uses=1]
  %or.cond2891 = and i1 %2429, %.not2890          ; <i1> [#uses=1]
  br i1 %or.cond2891, label %_Z14test_variable4Ii30custom_mixed_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1371

bb1.i.i1371:                                      ; preds = %bb5.i1369
  %2430 = add nsw i32 %allocated_results.81, 10   ; <i32> [#uses=3]
  %2431 = mul i32 %2430, 12                       ; <i32> [#uses=1]
  %2432 = bitcast %struct.one_result* %results.81 to i8* ; <i8*> [#uses=1]
  %2433 = tail call i8* @realloc(i8* %2432, i32 %2431) nounwind ; <i8*> [#uses=2]
  %2434 = bitcast i8* %2433 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2435 = icmp eq i8* %2433, null                 ; <i1> [#uses=1]
  br i1 %2435, label %bb2.i.i1372, label %_Z14test_variable4Ii30custom_mixed_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1372:                                      ; preds = %bb1.i.i1371
  %2436 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2430) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii30custom_mixed_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1371, %bb5.i1369
  %results.82 = phi %struct.one_result* [ %2434, %bb1.i.i1371 ], [ %results.81, %bb5.i1369 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.82 = phi i32 [ %2430, %bb1.i.i1371 ], [ %allocated_results.81, %bb5.i1369 ] ; <i32> [#uses=3]
  %2437 = phi %struct.one_result* [ %2434, %bb1.i.i1371 ], [ %results.81, %bb5.i1369 ] ; <%struct.one_result*> [#uses=2]
  %2438 = getelementptr inbounds %struct.one_result* %2437, i32 83, i32 0 ; <double*> [#uses=1]
  store double %2428, double* %2438, align 4
  %2439 = getelementptr inbounds %struct.one_result* %2437, i32 83, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str95, i32 0, i32 0), i8** %2439, align 4
  %2440 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1343, label %bb5.i1354

bb.nph6.i1343:                                    ; preds = %_Z14test_variable4Ii30custom_mixed_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2441 = and i32 %2102, %2104                    ; <i32> [#uses=1]
  %2442 = mul i32 %2441, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1346

bb2.preheader.us.i1346:                           ; preds = %_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i, %bb.nph6.i1343
  %i.05.us.i1344 = phi i32 [ 0, %bb.nph6.i1343 ], [ %tmp.i1345, %_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1345 = add i32 %i.05.us.i1344, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1352

_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1353, %bb.i1.us.i1347
  %2443 = icmp slt i32 %tmp.i1345, %iterations.0  ; <i1> [#uses=1]
  br i1 %2443, label %bb2.preheader.us.i1346, label %bb5.i1354

bb.i1.us.i1347:                                   ; preds = %bb2.bb3_crit_edge.us.i1353
  %2444 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 84) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i

bb1.us.i1352:                                     ; preds = %bb1.us.i1352, %bb2.preheader.us.i1346
  %result.03.us.i1348 = phi i32 [ 0, %bb2.preheader.us.i1346 ], [ %2447, %bb1.us.i1352 ] ; <i32> [#uses=1]
  %n.02.us.i1349 = phi i32 [ 0, %bb2.preheader.us.i1346 ], [ %2448, %bb1.us.i1352 ] ; <i32> [#uses=2]
  %scevgep.i1350 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1349 ; <i32*> [#uses=1]
  %2445 = load i32* %scevgep.i1350, align 4       ; <i32> [#uses=1]
  %2446 = and i32 %2445, %2104                    ; <i32> [#uses=1]
  %2447 = add nsw i32 %2446, %result.03.us.i1348  ; <i32> [#uses=2]
  %2448 = add nsw i32 %n.02.us.i1349, 1           ; <i32> [#uses=2]
  %exitcond.i1351 = icmp eq i32 %2448, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1351, label %bb2.bb3_crit_edge.us.i1353, label %bb1.us.i1352

bb2.bb3_crit_edge.us.i1353:                       ; preds = %bb1.us.i1352
  %2449 = icmp eq i32 %2442, %2447                ; <i1> [#uses=1]
  br i1 %2449, label %_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1347

bb5.i1354:                                        ; preds = %_Z26check_shifted_variable_sumIi19custom_variable_andIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii30custom_mixed_multiple_variableIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2450 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2451 = sub i32 %2450, %2440                    ; <i32> [#uses=1]
  %2452 = sitofp i32 %2451 to double              ; <double> [#uses=1]
  %2453 = fdiv double %2452, 1.000000e+06         ; <double> [#uses=1]
  %.not2892 = icmp ne %struct.one_result* %results.82, null ; <i1> [#uses=1]
  %2454 = icmp sgt i32 %allocated_results.82, 84  ; <i1> [#uses=1]
  %or.cond2893 = and i1 %2454, %.not2892          ; <i1> [#uses=1]
  br i1 %or.cond2893, label %_Z14test_variable1Ii19custom_variable_andIiEEvPT_iS2_PKc.exit, label %bb1.i.i1356

bb1.i.i1356:                                      ; preds = %bb5.i1354
  %2455 = add nsw i32 %allocated_results.82, 10   ; <i32> [#uses=3]
  %2456 = mul i32 %2455, 12                       ; <i32> [#uses=1]
  %2457 = bitcast %struct.one_result* %results.82 to i8* ; <i8*> [#uses=1]
  %2458 = tail call i8* @realloc(i8* %2457, i32 %2456) nounwind ; <i8*> [#uses=2]
  %2459 = bitcast i8* %2458 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2460 = icmp eq i8* %2458, null                 ; <i1> [#uses=1]
  br i1 %2460, label %bb2.i.i1357, label %_Z14test_variable1Ii19custom_variable_andIiEEvPT_iS2_PKc.exit

bb2.i.i1357:                                      ; preds = %bb1.i.i1356
  %2461 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2455) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii19custom_variable_andIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1356, %bb5.i1354
  %results.83 = phi %struct.one_result* [ %2459, %bb1.i.i1356 ], [ %results.82, %bb5.i1354 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.83 = phi i32 [ %2455, %bb1.i.i1356 ], [ %allocated_results.82, %bb5.i1354 ] ; <i32> [#uses=3]
  %2462 = phi %struct.one_result* [ %2459, %bb1.i.i1356 ], [ %results.82, %bb5.i1354 ] ; <%struct.one_result*> [#uses=2]
  %2463 = getelementptr inbounds %struct.one_result* %2462, i32 84, i32 0 ; <double*> [#uses=1]
  store double %2453, double* %2463, align 4
  %2464 = getelementptr inbounds %struct.one_result* %2462, i32 84, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str96, i32 0, i32 0), i8** %2464, align 4
  %2465 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1328, label %bb5.i1339

bb.nph6.i1328:                                    ; preds = %_Z14test_variable1Ii19custom_variable_andIiEEvPT_iS2_PKc.exit
  %2466 = and i32 %2105, %2104                    ; <i32> [#uses=1]
  %2467 = and i32 %2466, %2106                    ; <i32> [#uses=1]
  %2468 = and i32 %2467, %2108                    ; <i32> [#uses=2]
  %2469 = and i32 %2468, %2102                    ; <i32> [#uses=1]
  %2470 = mul i32 %2469, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1331

bb2.preheader.us.i1331:                           ; preds = %_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1328
  %i.05.us.i1329 = phi i32 [ 0, %bb.nph6.i1328 ], [ %tmp.i1330, %_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1330 = add i32 %i.05.us.i1329, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1337

_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1338, %bb.i1.us.i1332
  %2471 = icmp slt i32 %tmp.i1330, %iterations.0  ; <i1> [#uses=1]
  br i1 %2471, label %bb2.preheader.us.i1331, label %bb5.i1339

bb.i1.us.i1332:                                   ; preds = %bb2.bb3_crit_edge.us.i1338
  %2472 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 85) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1337:                                     ; preds = %bb1.us.i1337, %bb2.preheader.us.i1331
  %result.03.us.i1333 = phi i32 [ 0, %bb2.preheader.us.i1331 ], [ %2475, %bb1.us.i1337 ] ; <i32> [#uses=1]
  %n.02.us.i1334 = phi i32 [ 0, %bb2.preheader.us.i1331 ], [ %2476, %bb1.us.i1337 ] ; <i32> [#uses=2]
  %scevgep.i1335 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1334 ; <i32*> [#uses=1]
  %2473 = load i32* %scevgep.i1335, align 4       ; <i32> [#uses=1]
  %2474 = and i32 %2468, %2473                    ; <i32> [#uses=1]
  %2475 = add nsw i32 %2474, %result.03.us.i1333  ; <i32> [#uses=2]
  %2476 = add nsw i32 %n.02.us.i1334, 1           ; <i32> [#uses=2]
  %exitcond.i1336 = icmp eq i32 %2476, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1336, label %bb2.bb3_crit_edge.us.i1338, label %bb1.us.i1337

bb2.bb3_crit_edge.us.i1338:                       ; preds = %bb1.us.i1337
  %2477 = icmp eq i32 %2470, %2475                ; <i1> [#uses=1]
  br i1 %2477, label %_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1332

bb5.i1339:                                        ; preds = %_Z26check_shifted_variable_sumIi28custom_multiple_variable_andIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii19custom_variable_andIiEEvPT_iS2_PKc.exit
  %2478 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2479 = sub i32 %2478, %2465                    ; <i32> [#uses=1]
  %2480 = sitofp i32 %2479 to double              ; <double> [#uses=1]
  %2481 = fdiv double %2480, 1.000000e+06         ; <double> [#uses=1]
  %.not2894 = icmp ne %struct.one_result* %results.83, null ; <i1> [#uses=1]
  %2482 = icmp sgt i32 %allocated_results.83, 85  ; <i1> [#uses=1]
  %or.cond2895 = and i1 %2482, %.not2894          ; <i1> [#uses=1]
  br i1 %or.cond2895, label %_Z14test_variable4Ii28custom_multiple_variable_andIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1341

bb1.i.i1341:                                      ; preds = %bb5.i1339
  %2483 = add nsw i32 %allocated_results.83, 10   ; <i32> [#uses=3]
  %2484 = mul i32 %2483, 12                       ; <i32> [#uses=1]
  %2485 = bitcast %struct.one_result* %results.83 to i8* ; <i8*> [#uses=1]
  %2486 = tail call i8* @realloc(i8* %2485, i32 %2484) nounwind ; <i8*> [#uses=2]
  %2487 = bitcast i8* %2486 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2488 = icmp eq i8* %2486, null                 ; <i1> [#uses=1]
  br i1 %2488, label %bb2.i.i1342, label %_Z14test_variable4Ii28custom_multiple_variable_andIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1342:                                      ; preds = %bb1.i.i1341
  %2489 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2483) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii28custom_multiple_variable_andIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1341, %bb5.i1339
  %results.84 = phi %struct.one_result* [ %2487, %bb1.i.i1341 ], [ %results.83, %bb5.i1339 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.84 = phi i32 [ %2483, %bb1.i.i1341 ], [ %allocated_results.83, %bb5.i1339 ] ; <i32> [#uses=3]
  %2490 = phi %struct.one_result* [ %2487, %bb1.i.i1341 ], [ %results.83, %bb5.i1339 ] ; <%struct.one_result*> [#uses=2]
  %2491 = getelementptr inbounds %struct.one_result* %2490, i32 85, i32 0 ; <double*> [#uses=1]
  store double %2481, double* %2491, align 4
  %2492 = getelementptr inbounds %struct.one_result* %2490, i32 85, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str97, i32 0, i32 0), i8** %2492, align 4
  %2493 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1313, label %bb5.i1324

bb.nph6.i1313:                                    ; preds = %_Z14test_variable4Ii28custom_multiple_variable_andIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2494 = or i32 %2102, %2104                     ; <i32> [#uses=1]
  %2495 = mul i32 %2494, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1316

bb2.preheader.us.i1316:                           ; preds = %_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i, %bb.nph6.i1313
  %i.05.us.i1314 = phi i32 [ 0, %bb.nph6.i1313 ], [ %tmp.i1315, %_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1315 = add i32 %i.05.us.i1314, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1322

_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1323, %bb.i1.us.i1317
  %2496 = icmp slt i32 %tmp.i1315, %iterations.0  ; <i1> [#uses=1]
  br i1 %2496, label %bb2.preheader.us.i1316, label %bb5.i1324

bb.i1.us.i1317:                                   ; preds = %bb2.bb3_crit_edge.us.i1323
  %2497 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 86) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i

bb1.us.i1322:                                     ; preds = %bb1.us.i1322, %bb2.preheader.us.i1316
  %result.03.us.i1318 = phi i32 [ 0, %bb2.preheader.us.i1316 ], [ %2500, %bb1.us.i1322 ] ; <i32> [#uses=1]
  %n.02.us.i1319 = phi i32 [ 0, %bb2.preheader.us.i1316 ], [ %2501, %bb1.us.i1322 ] ; <i32> [#uses=2]
  %scevgep.i1320 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1319 ; <i32*> [#uses=1]
  %2498 = load i32* %scevgep.i1320, align 4       ; <i32> [#uses=1]
  %2499 = or i32 %2498, %2104                     ; <i32> [#uses=1]
  %2500 = add nsw i32 %2499, %result.03.us.i1318  ; <i32> [#uses=2]
  %2501 = add nsw i32 %n.02.us.i1319, 1           ; <i32> [#uses=2]
  %exitcond.i1321 = icmp eq i32 %2501, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1321, label %bb2.bb3_crit_edge.us.i1323, label %bb1.us.i1322

bb2.bb3_crit_edge.us.i1323:                       ; preds = %bb1.us.i1322
  %2502 = icmp eq i32 %2495, %2500                ; <i1> [#uses=1]
  br i1 %2502, label %_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1317

bb5.i1324:                                        ; preds = %_Z26check_shifted_variable_sumIi18custom_variable_orIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii28custom_multiple_variable_andIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2503 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2504 = sub i32 %2503, %2493                    ; <i32> [#uses=1]
  %2505 = sitofp i32 %2504 to double              ; <double> [#uses=1]
  %2506 = fdiv double %2505, 1.000000e+06         ; <double> [#uses=1]
  %.not2896 = icmp ne %struct.one_result* %results.84, null ; <i1> [#uses=1]
  %2507 = icmp sgt i32 %allocated_results.84, 86  ; <i1> [#uses=1]
  %or.cond2897 = and i1 %2507, %.not2896          ; <i1> [#uses=1]
  br i1 %or.cond2897, label %_Z14test_variable1Ii18custom_variable_orIiEEvPT_iS2_PKc.exit, label %bb1.i.i1326

bb1.i.i1326:                                      ; preds = %bb5.i1324
  %2508 = add nsw i32 %allocated_results.84, 10   ; <i32> [#uses=3]
  %2509 = mul i32 %2508, 12                       ; <i32> [#uses=1]
  %2510 = bitcast %struct.one_result* %results.84 to i8* ; <i8*> [#uses=1]
  %2511 = tail call i8* @realloc(i8* %2510, i32 %2509) nounwind ; <i8*> [#uses=2]
  %2512 = bitcast i8* %2511 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2513 = icmp eq i8* %2511, null                 ; <i1> [#uses=1]
  br i1 %2513, label %bb2.i.i1327, label %_Z14test_variable1Ii18custom_variable_orIiEEvPT_iS2_PKc.exit

bb2.i.i1327:                                      ; preds = %bb1.i.i1326
  %2514 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2508) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii18custom_variable_orIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1326, %bb5.i1324
  %results.85 = phi %struct.one_result* [ %2512, %bb1.i.i1326 ], [ %results.84, %bb5.i1324 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.85 = phi i32 [ %2508, %bb1.i.i1326 ], [ %allocated_results.84, %bb5.i1324 ] ; <i32> [#uses=3]
  %2515 = phi %struct.one_result* [ %2512, %bb1.i.i1326 ], [ %results.84, %bb5.i1324 ] ; <%struct.one_result*> [#uses=2]
  %2516 = getelementptr inbounds %struct.one_result* %2515, i32 86, i32 0 ; <double*> [#uses=1]
  store double %2506, double* %2516, align 4
  %2517 = getelementptr inbounds %struct.one_result* %2515, i32 86, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str98, i32 0, i32 0), i8** %2517, align 4
  %2518 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1298, label %bb5.i1309

bb.nph6.i1298:                                    ; preds = %_Z14test_variable1Ii18custom_variable_orIiEEvPT_iS2_PKc.exit
  %2519 = or i32 %2105, %2104                     ; <i32> [#uses=1]
  %2520 = or i32 %2519, %2106                     ; <i32> [#uses=1]
  %2521 = or i32 %2520, %2108                     ; <i32> [#uses=2]
  %2522 = or i32 %2521, %2102                     ; <i32> [#uses=1]
  %2523 = mul i32 %2522, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1301

bb2.preheader.us.i1301:                           ; preds = %_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1298
  %i.05.us.i1299 = phi i32 [ 0, %bb.nph6.i1298 ], [ %tmp.i1300, %_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1300 = add i32 %i.05.us.i1299, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1307

_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1308, %bb.i1.us.i1302
  %2524 = icmp slt i32 %tmp.i1300, %iterations.0  ; <i1> [#uses=1]
  br i1 %2524, label %bb2.preheader.us.i1301, label %bb5.i1309

bb.i1.us.i1302:                                   ; preds = %bb2.bb3_crit_edge.us.i1308
  %2525 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 87) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1307:                                     ; preds = %bb1.us.i1307, %bb2.preheader.us.i1301
  %result.03.us.i1303 = phi i32 [ 0, %bb2.preheader.us.i1301 ], [ %2528, %bb1.us.i1307 ] ; <i32> [#uses=1]
  %n.02.us.i1304 = phi i32 [ 0, %bb2.preheader.us.i1301 ], [ %2529, %bb1.us.i1307 ] ; <i32> [#uses=2]
  %scevgep.i1305 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1304 ; <i32*> [#uses=1]
  %2526 = load i32* %scevgep.i1305, align 4       ; <i32> [#uses=1]
  %2527 = or i32 %2521, %2526                     ; <i32> [#uses=1]
  %2528 = add nsw i32 %2527, %result.03.us.i1303  ; <i32> [#uses=2]
  %2529 = add nsw i32 %n.02.us.i1304, 1           ; <i32> [#uses=2]
  %exitcond.i1306 = icmp eq i32 %2529, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1306, label %bb2.bb3_crit_edge.us.i1308, label %bb1.us.i1307

bb2.bb3_crit_edge.us.i1308:                       ; preds = %bb1.us.i1307
  %2530 = icmp eq i32 %2523, %2528                ; <i1> [#uses=1]
  br i1 %2530, label %_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1302

bb5.i1309:                                        ; preds = %_Z26check_shifted_variable_sumIi27custom_multiple_variable_orIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii18custom_variable_orIiEEvPT_iS2_PKc.exit
  %2531 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2532 = sub i32 %2531, %2518                    ; <i32> [#uses=1]
  %2533 = sitofp i32 %2532 to double              ; <double> [#uses=1]
  %2534 = fdiv double %2533, 1.000000e+06         ; <double> [#uses=1]
  %.not2898 = icmp ne %struct.one_result* %results.85, null ; <i1> [#uses=1]
  %2535 = icmp sgt i32 %allocated_results.85, 87  ; <i1> [#uses=1]
  %or.cond2899 = and i1 %2535, %.not2898          ; <i1> [#uses=1]
  br i1 %or.cond2899, label %_Z14test_variable4Ii27custom_multiple_variable_orIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1311

bb1.i.i1311:                                      ; preds = %bb5.i1309
  %2536 = add nsw i32 %allocated_results.85, 10   ; <i32> [#uses=3]
  %2537 = mul i32 %2536, 12                       ; <i32> [#uses=1]
  %2538 = bitcast %struct.one_result* %results.85 to i8* ; <i8*> [#uses=1]
  %2539 = tail call i8* @realloc(i8* %2538, i32 %2537) nounwind ; <i8*> [#uses=2]
  %2540 = bitcast i8* %2539 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2541 = icmp eq i8* %2539, null                 ; <i1> [#uses=1]
  br i1 %2541, label %bb2.i.i1312, label %_Z14test_variable4Ii27custom_multiple_variable_orIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1312:                                      ; preds = %bb1.i.i1311
  %2542 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2536) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii27custom_multiple_variable_orIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1311, %bb5.i1309
  %results.86 = phi %struct.one_result* [ %2540, %bb1.i.i1311 ], [ %results.85, %bb5.i1309 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.86 = phi i32 [ %2536, %bb1.i.i1311 ], [ %allocated_results.85, %bb5.i1309 ] ; <i32> [#uses=3]
  %2543 = phi %struct.one_result* [ %2540, %bb1.i.i1311 ], [ %results.85, %bb5.i1309 ] ; <%struct.one_result*> [#uses=2]
  %2544 = getelementptr inbounds %struct.one_result* %2543, i32 87, i32 0 ; <double*> [#uses=1]
  store double %2534, double* %2544, align 4
  %2545 = getelementptr inbounds %struct.one_result* %2543, i32 87, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str99, i32 0, i32 0), i8** %2545, align 4
  %2546 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1283, label %bb5.i1294

bb.nph6.i1283:                                    ; preds = %_Z14test_variable4Ii27custom_multiple_variable_orIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2547 = xor i32 %2102, %2104                    ; <i32> [#uses=1]
  %2548 = mul i32 %2547, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1286

bb2.preheader.us.i1286:                           ; preds = %_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i, %bb.nph6.i1283
  %i.05.us.i1284 = phi i32 [ 0, %bb.nph6.i1283 ], [ %tmp.i1285, %_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1285 = add i32 %i.05.us.i1284, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1292

_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1293, %bb.i1.us.i1287
  %2549 = icmp slt i32 %tmp.i1285, %iterations.0  ; <i1> [#uses=1]
  br i1 %2549, label %bb2.preheader.us.i1286, label %bb5.i1294

bb.i1.us.i1287:                                   ; preds = %bb2.bb3_crit_edge.us.i1293
  %2550 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 88) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i

bb1.us.i1292:                                     ; preds = %bb1.us.i1292, %bb2.preheader.us.i1286
  %result.03.us.i1288 = phi i32 [ 0, %bb2.preheader.us.i1286 ], [ %2553, %bb1.us.i1292 ] ; <i32> [#uses=1]
  %n.02.us.i1289 = phi i32 [ 0, %bb2.preheader.us.i1286 ], [ %2554, %bb1.us.i1292 ] ; <i32> [#uses=2]
  %scevgep.i1290 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1289 ; <i32*> [#uses=1]
  %2551 = load i32* %scevgep.i1290, align 4       ; <i32> [#uses=1]
  %2552 = xor i32 %2551, %2104                    ; <i32> [#uses=1]
  %2553 = add nsw i32 %2552, %result.03.us.i1288  ; <i32> [#uses=2]
  %2554 = add nsw i32 %n.02.us.i1289, 1           ; <i32> [#uses=2]
  %exitcond.i1291 = icmp eq i32 %2554, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1291, label %bb2.bb3_crit_edge.us.i1293, label %bb1.us.i1292

bb2.bb3_crit_edge.us.i1293:                       ; preds = %bb1.us.i1292
  %2555 = icmp eq i32 %2548, %2553                ; <i1> [#uses=1]
  br i1 %2555, label %_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i, label %bb.i1.us.i1287

bb5.i1294:                                        ; preds = %_Z26check_shifted_variable_sumIi19custom_variable_xorIiEEvT_S2_.exit.us.i, %_Z14test_variable4Ii27custom_multiple_variable_orIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %2556 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2557 = sub i32 %2556, %2546                    ; <i32> [#uses=1]
  %2558 = sitofp i32 %2557 to double              ; <double> [#uses=1]
  %2559 = fdiv double %2558, 1.000000e+06         ; <double> [#uses=1]
  %.not2900 = icmp ne %struct.one_result* %results.86, null ; <i1> [#uses=1]
  %2560 = icmp sgt i32 %allocated_results.86, 88  ; <i1> [#uses=1]
  %or.cond2901 = and i1 %2560, %.not2900          ; <i1> [#uses=1]
  br i1 %or.cond2901, label %_Z14test_variable1Ii19custom_variable_xorIiEEvPT_iS2_PKc.exit, label %bb1.i.i1296

bb1.i.i1296:                                      ; preds = %bb5.i1294
  %2561 = add nsw i32 %allocated_results.86, 10   ; <i32> [#uses=3]
  %2562 = mul i32 %2561, 12                       ; <i32> [#uses=1]
  %2563 = bitcast %struct.one_result* %results.86 to i8* ; <i8*> [#uses=1]
  %2564 = tail call i8* @realloc(i8* %2563, i32 %2562) nounwind ; <i8*> [#uses=2]
  %2565 = bitcast i8* %2564 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2566 = icmp eq i8* %2564, null                 ; <i1> [#uses=1]
  br i1 %2566, label %bb2.i.i1297, label %_Z14test_variable1Ii19custom_variable_xorIiEEvPT_iS2_PKc.exit

bb2.i.i1297:                                      ; preds = %bb1.i.i1296
  %2567 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2561) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ii19custom_variable_xorIiEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1296, %bb5.i1294
  %results.87 = phi %struct.one_result* [ %2565, %bb1.i.i1296 ], [ %results.86, %bb5.i1294 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.87 = phi i32 [ %2561, %bb1.i.i1296 ], [ %allocated_results.86, %bb5.i1294 ] ; <i32> [#uses=3]
  %2568 = phi %struct.one_result* [ %2565, %bb1.i.i1296 ], [ %results.86, %bb5.i1294 ] ; <%struct.one_result*> [#uses=2]
  %2569 = getelementptr inbounds %struct.one_result* %2568, i32 88, i32 0 ; <double*> [#uses=1]
  store double %2559, double* %2569, align 4
  %2570 = getelementptr inbounds %struct.one_result* %2568, i32 88, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str100, i32 0, i32 0), i8** %2570, align 4
  %2571 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1268, label %bb5.i1279

bb.nph6.i1268:                                    ; preds = %_Z14test_variable1Ii19custom_variable_xorIiEEvPT_iS2_PKc.exit
  %2572 = xor i32 %2105, %2104                    ; <i32> [#uses=1]
  %2573 = xor i32 %2572, %2106                    ; <i32> [#uses=1]
  %2574 = xor i32 %2573, %2108                    ; <i32> [#uses=2]
  %2575 = xor i32 %2574, %2102                    ; <i32> [#uses=1]
  %2576 = mul i32 %2575, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1271

bb2.preheader.us.i1271:                           ; preds = %_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1268
  %i.05.us.i1269 = phi i32 [ 0, %bb.nph6.i1268 ], [ %tmp.i1270, %_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1270 = add i32 %i.05.us.i1269, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1277

_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1278, %bb.i1.us.i1272
  %2577 = icmp slt i32 %tmp.i1270, %iterations.0  ; <i1> [#uses=1]
  br i1 %2577, label %bb2.preheader.us.i1271, label %bb5.i1279

bb.i1.us.i1272:                                   ; preds = %bb2.bb3_crit_edge.us.i1278
  %2578 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 89) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1277:                                     ; preds = %bb1.us.i1277, %bb2.preheader.us.i1271
  %result.03.us.i1273 = phi i32 [ 0, %bb2.preheader.us.i1271 ], [ %2581, %bb1.us.i1277 ] ; <i32> [#uses=1]
  %n.02.us.i1274 = phi i32 [ 0, %bb2.preheader.us.i1271 ], [ %2582, %bb1.us.i1277 ] ; <i32> [#uses=2]
  %scevgep.i1275 = getelementptr [8000 x i32]* @data32, i32 0, i32 %n.02.us.i1274 ; <i32*> [#uses=1]
  %2579 = load i32* %scevgep.i1275, align 4       ; <i32> [#uses=1]
  %2580 = xor i32 %2574, %2579                    ; <i32> [#uses=1]
  %2581 = add nsw i32 %2580, %result.03.us.i1273  ; <i32> [#uses=2]
  %2582 = add nsw i32 %n.02.us.i1274, 1           ; <i32> [#uses=2]
  %exitcond.i1276 = icmp eq i32 %2582, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1276, label %bb2.bb3_crit_edge.us.i1278, label %bb1.us.i1277

bb2.bb3_crit_edge.us.i1278:                       ; preds = %bb1.us.i1277
  %2583 = icmp eq i32 %2576, %2581                ; <i1> [#uses=1]
  br i1 %2583, label %_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1272

bb5.i1279:                                        ; preds = %_Z26check_shifted_variable_sumIi28custom_multiple_variable_xorIiEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ii19custom_variable_xorIiEEvPT_iS2_PKc.exit
  %2584 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2585 = sub i32 %2584, %2571                    ; <i32> [#uses=1]
  %2586 = sitofp i32 %2585 to double              ; <double> [#uses=1]
  %2587 = fdiv double %2586, 1.000000e+06         ; <double> [#uses=1]
  %.not2902 = icmp ne %struct.one_result* %results.87, null ; <i1> [#uses=1]
  %2588 = icmp sgt i32 %allocated_results.87, 89  ; <i1> [#uses=1]
  %or.cond2903 = and i1 %2588, %.not2902          ; <i1> [#uses=1]
  br i1 %or.cond2903, label %_Z14test_variable4Ii28custom_multiple_variable_xorIiEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1281

bb1.i.i1281:                                      ; preds = %bb5.i1279
  %2589 = add nsw i32 %allocated_results.87, 10   ; <i32> [#uses=3]
  %2590 = mul i32 %2589, 12                       ; <i32> [#uses=1]
  %2591 = bitcast %struct.one_result* %results.87 to i8* ; <i8*> [#uses=1]
  %2592 = tail call i8* @realloc(i8* %2591, i32 %2590) nounwind ; <i8*> [#uses=2]
  %2593 = bitcast i8* %2592 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2594 = icmp eq i8* %2592, null                 ; <i1> [#uses=1]
  br i1 %2594, label %bb2.i.i1282, label %_Z14test_variable4Ii28custom_multiple_variable_xorIiEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1282:                                      ; preds = %bb1.i.i1281
  %2595 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2589) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ii28custom_multiple_variable_xorIiEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1281, %bb5.i1279
  %results.88 = phi %struct.one_result* [ %2593, %bb1.i.i1281 ], [ %results.87, %bb5.i1279 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.88 = phi i32 [ %2589, %bb1.i.i1281 ], [ %allocated_results.87, %bb5.i1279 ] ; <i32> [#uses=3]
  %2596 = phi %struct.one_result* [ %2593, %bb1.i.i1281 ], [ %results.87, %bb5.i1279 ] ; <%struct.one_result*> [#uses=2]
  %2597 = getelementptr inbounds %struct.one_result* %2596, i32 89, i32 0 ; <double*> [#uses=1]
  store double %2587, double* %2597, align 4
  %2598 = getelementptr inbounds %struct.one_result* %2596, i32 89, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str101, i32 0, i32 0), i8** %2598, align 4
  %2599 = fptoui double %init_value.0 to i32      ; <i32> [#uses=19]
  br label %bb.i23

bb.i23:                                           ; preds = %bb.i23, %_Z14test_variable4Ii28custom_multiple_variable_xorIiEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i19 = phi i32 [ 0, %_Z14test_variable4Ii28custom_multiple_variable_xorIiEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i21, %bb.i23 ] ; <i32> [#uses=2]
  %tmp.i21 = add i32 %indvar.i19, 1               ; <i32> [#uses=2]
  %first_addr.01.i20 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %indvar.i19 ; <i32*> [#uses=1]
  store i32 %2599, i32* %first_addr.01.i20, align 4
  %scevgep.i22.idx.mask = and i32 %tmp.i21, 1073741823 ; <i32> [#uses=1]
  %2600 = icmp eq i32 %scevgep.i22.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %2600, label %_Z4fillIPjjEvT_S1_T0_.exit, label %bb.i23

_Z4fillIPjjEvT_S1_T0_.exit:                       ; preds = %bb.i23
  %2601 = fptoui double %temp.0 to i32            ; <i32> [#uses=32]
  %2602 = shl i32 %2601, 1                        ; <i32> [#uses=13]
  %2603 = add i32 %2601, 2                        ; <i32> [#uses=14]
  %2604 = udiv i32 %2602, %2603                   ; <i32> [#uses=1]
  %2605 = add i32 %2604, %2601                    ; <i32> [#uses=13]
  %2606 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1252, label %bb5.i1264

bb.nph6.i1252:                                    ; preds = %_Z4fillIPjjEvT_S1_T0_.exit
  %2607 = add i32 %2599, %2601                    ; <i32> [#uses=1]
  %2608 = mul i32 %2607, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1255

bb2.preheader.us.i1255:                           ; preds = %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256, %bb.nph6.i1252
  %i.05.us.i1253 = phi i32 [ 0, %bb.nph6.i1252 ], [ %tmp.i1254, %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256 ] ; <i32> [#uses=1]
  %tmp.i1254 = add i32 %i.05.us.i1253, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1262

_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256: ; preds = %bb2.bb3_crit_edge.us.i1263, %bb.i1.us.i1257
  %2609 = icmp slt i32 %tmp.i1254, %iterations.0  ; <i1> [#uses=1]
  br i1 %2609, label %bb2.preheader.us.i1255, label %bb5.i1264

bb.i1.us.i1257:                                   ; preds = %bb2.bb3_crit_edge.us.i1263
  %2610 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 90) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256

bb1.us.i1262:                                     ; preds = %bb1.us.i1262, %bb2.preheader.us.i1255
  %result.03.us.i1258 = phi i32 [ 0, %bb2.preheader.us.i1255 ], [ %2613, %bb1.us.i1262 ] ; <i32> [#uses=1]
  %n.02.us.i1259 = phi i32 [ 0, %bb2.preheader.us.i1255 ], [ %2614, %bb1.us.i1262 ] ; <i32> [#uses=2]
  %scevgep.i1260 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1259 ; <i32*> [#uses=1]
  %2611 = load i32* %scevgep.i1260, align 4       ; <i32> [#uses=1]
  %2612 = add i32 %result.03.us.i1258, %2601      ; <i32> [#uses=1]
  %2613 = add i32 %2612, %2611                    ; <i32> [#uses=2]
  %2614 = add nsw i32 %n.02.us.i1259, 1           ; <i32> [#uses=2]
  %exitcond.i1261 = icmp eq i32 %2614, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1261, label %bb2.bb3_crit_edge.us.i1263, label %bb1.us.i1262

bb2.bb3_crit_edge.us.i1263:                       ; preds = %bb1.us.i1262
  %2615 = icmp eq i32 %2608, %2613                ; <i1> [#uses=1]
  br i1 %2615, label %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256, label %bb.i1.us.i1257

bb5.i1264:                                        ; preds = %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i1256, %_Z4fillIPjjEvT_S1_T0_.exit
  %2616 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2617 = sub i32 %2616, %2606                    ; <i32> [#uses=1]
  %2618 = sitofp i32 %2617 to double              ; <double> [#uses=1]
  %2619 = fdiv double %2618, 1.000000e+06         ; <double> [#uses=1]
  %.not2904 = icmp ne %struct.one_result* %results.88, null ; <i1> [#uses=1]
  %2620 = icmp sgt i32 %allocated_results.88, 90  ; <i1> [#uses=1]
  %or.cond2905 = and i1 %2620, %.not2904          ; <i1> [#uses=1]
  br i1 %or.cond2905, label %_Z14test_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit, label %bb1.i.i1266

bb1.i.i1266:                                      ; preds = %bb5.i1264
  %2621 = add nsw i32 %allocated_results.88, 10   ; <i32> [#uses=3]
  %2622 = mul i32 %2621, 12                       ; <i32> [#uses=1]
  %2623 = bitcast %struct.one_result* %results.88 to i8* ; <i8*> [#uses=1]
  %2624 = tail call i8* @realloc(i8* %2623, i32 %2622) nounwind ; <i8*> [#uses=2]
  %2625 = bitcast i8* %2624 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2626 = icmp eq i8* %2624, null                 ; <i1> [#uses=1]
  br i1 %2626, label %bb2.i.i1267, label %_Z14test_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit

bb2.i.i1267:                                      ; preds = %bb1.i.i1266
  %2627 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2621) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1266, %bb5.i1264
  %results.89 = phi %struct.one_result* [ %2625, %bb1.i.i1266 ], [ %results.88, %bb5.i1264 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.89 = phi i32 [ %2621, %bb1.i.i1266 ], [ %allocated_results.88, %bb5.i1264 ] ; <i32> [#uses=3]
  %2628 = phi %struct.one_result* [ %2625, %bb1.i.i1266 ], [ %results.88, %bb5.i1264 ] ; <%struct.one_result*> [#uses=2]
  %2629 = getelementptr inbounds %struct.one_result* %2628, i32 90, i32 0 ; <double*> [#uses=1]
  store double %2619, double* %2629, align 4
  %2630 = getelementptr inbounds %struct.one_result* %2628, i32 90, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str102, i32 0, i32 0), i8** %2630, align 4
  %2631 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1237, label %bb5.i1248

bb.nph6.i1237:                                    ; preds = %_Z14test_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit
  %2632 = mul i32 %2601, 8000                     ; <i32> [#uses=1]
  %2633 = add i32 %2599, %2601                    ; <i32> [#uses=1]
  %2634 = mul i32 %2633, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1240

bb2.preheader.us.i1240:                           ; preds = %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i, %bb.nph6.i1237
  %i.05.us.i1238 = phi i32 [ 0, %bb.nph6.i1237 ], [ %tmp.i1239, %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1239 = add i32 %i.05.us.i1238, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1246

_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1247, %bb.i1.us.i1241
  %2635 = icmp slt i32 %tmp.i1239, %iterations.0  ; <i1> [#uses=1]
  br i1 %2635, label %bb2.preheader.us.i1240, label %bb5.i1248

bb.i1.us.i1241:                                   ; preds = %bb2.bb3_crit_edge.us.i1247
  %2636 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 91) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i

bb1.us.i1246:                                     ; preds = %bb1.us.i1246, %bb2.preheader.us.i1240
  %result.03.us.i1242 = phi i32 [ 0, %bb2.preheader.us.i1240 ], [ %2638, %bb1.us.i1246 ] ; <i32> [#uses=1]
  %n.02.us.i1243 = phi i32 [ 0, %bb2.preheader.us.i1240 ], [ %2639, %bb1.us.i1246 ] ; <i32> [#uses=2]
  %scevgep.i1244 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1243 ; <i32*> [#uses=1]
  %2637 = load i32* %scevgep.i1244, align 4       ; <i32> [#uses=1]
  %2638 = add i32 %2637, %result.03.us.i1242      ; <i32> [#uses=2]
  %2639 = add nsw i32 %n.02.us.i1243, 1           ; <i32> [#uses=2]
  %exitcond.i1245 = icmp eq i32 %2639, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1245, label %bb2.bb3_crit_edge.us.i1247, label %bb1.us.i1246

bb2.bb3_crit_edge.us.i1247:                       ; preds = %bb1.us.i1246
  %2640 = add i32 %2638, %2632                    ; <i32> [#uses=1]
  %2641 = icmp eq i32 %2634, %2640                ; <i1> [#uses=1]
  br i1 %2641, label %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1241

bb5.i1248:                                        ; preds = %_Z26check_shifted_variable_sumIj19custom_add_variableIjEEvT_S2_.exit.us.i, %_Z14test_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit
  %2642 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2643 = sub i32 %2642, %2631                    ; <i32> [#uses=1]
  %2644 = sitofp i32 %2643 to double              ; <double> [#uses=1]
  %2645 = fdiv double %2644, 1.000000e+06         ; <double> [#uses=1]
  %.not2906 = icmp ne %struct.one_result* %results.89, null ; <i1> [#uses=1]
  %2646 = icmp sgt i32 %allocated_results.89, 91  ; <i1> [#uses=1]
  %or.cond2907 = and i1 %2646, %.not2906          ; <i1> [#uses=1]
  br i1 %or.cond2907, label %_Z22test_hoisted_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit, label %bb1.i.i1250

bb1.i.i1250:                                      ; preds = %bb5.i1248
  %2647 = add nsw i32 %allocated_results.89, 10   ; <i32> [#uses=3]
  %2648 = mul i32 %2647, 12                       ; <i32> [#uses=1]
  %2649 = bitcast %struct.one_result* %results.89 to i8* ; <i8*> [#uses=1]
  %2650 = tail call i8* @realloc(i8* %2649, i32 %2648) nounwind ; <i8*> [#uses=2]
  %2651 = bitcast i8* %2650 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2652 = icmp eq i8* %2650, null                 ; <i1> [#uses=1]
  br i1 %2652, label %bb2.i.i1251, label %_Z22test_hoisted_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit

bb2.i.i1251:                                      ; preds = %bb1.i.i1250
  %2653 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2647) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1250, %bb5.i1248
  %results.90 = phi %struct.one_result* [ %2651, %bb1.i.i1250 ], [ %results.89, %bb5.i1248 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.90 = phi i32 [ %2647, %bb1.i.i1250 ], [ %allocated_results.89, %bb5.i1248 ] ; <i32> [#uses=3]
  %2654 = phi %struct.one_result* [ %2651, %bb1.i.i1250 ], [ %results.89, %bb5.i1248 ] ; <%struct.one_result*> [#uses=2]
  %2655 = getelementptr inbounds %struct.one_result* %2654, i32 91, i32 0 ; <double*> [#uses=1]
  store double %2645, double* %2655, align 4
  %2656 = getelementptr inbounds %struct.one_result* %2654, i32 91, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str103, i32 0, i32 0), i8** %2656, align 4
  %2657 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1222, label %bb5.i1233

bb.nph6.i1222:                                    ; preds = %_Z22test_hoisted_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit
  %2658 = add i32 %2602, %2601                    ; <i32> [#uses=1]
  %2659 = add i32 %2658, %2603                    ; <i32> [#uses=1]
  %2660 = add i32 %2659, %2605                    ; <i32> [#uses=2]
  %2661 = add i32 %2660, %2599                    ; <i32> [#uses=1]
  %2662 = mul i32 %2661, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1225

bb2.preheader.us.i1225:                           ; preds = %_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1222
  %i.05.us.i1223 = phi i32 [ 0, %bb.nph6.i1222 ], [ %tmp.i1224, %_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1224 = add i32 %i.05.us.i1223, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1231

_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1232, %bb.i1.us.i1226
  %2663 = icmp slt i32 %tmp.i1224, %iterations.0  ; <i1> [#uses=1]
  br i1 %2663, label %bb2.preheader.us.i1225, label %bb5.i1233

bb.i1.us.i1226:                                   ; preds = %bb2.bb3_crit_edge.us.i1232
  %2664 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 92) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1231:                                     ; preds = %bb1.us.i1231, %bb2.preheader.us.i1225
  %result.03.us.i1227 = phi i32 [ 0, %bb2.preheader.us.i1225 ], [ %2667, %bb1.us.i1231 ] ; <i32> [#uses=1]
  %n.02.us.i1228 = phi i32 [ 0, %bb2.preheader.us.i1225 ], [ %2668, %bb1.us.i1231 ] ; <i32> [#uses=2]
  %scevgep.i1229 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1228 ; <i32*> [#uses=1]
  %2665 = load i32* %scevgep.i1229, align 4       ; <i32> [#uses=1]
  %2666 = add i32 %2660, %result.03.us.i1227      ; <i32> [#uses=1]
  %2667 = add i32 %2666, %2665                    ; <i32> [#uses=2]
  %2668 = add nsw i32 %n.02.us.i1228, 1           ; <i32> [#uses=2]
  %exitcond.i1230 = icmp eq i32 %2668, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1230, label %bb2.bb3_crit_edge.us.i1232, label %bb1.us.i1231

bb2.bb3_crit_edge.us.i1232:                       ; preds = %bb1.us.i1231
  %2669 = icmp eq i32 %2662, %2667                ; <i1> [#uses=1]
  br i1 %2669, label %_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1226

bb5.i1233:                                        ; preds = %_Z26check_shifted_variable_sumIj28custom_add_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Ij19custom_add_variableIjEEvPT_iS2_PKc.exit
  %2670 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2671 = sub i32 %2670, %2657                    ; <i32> [#uses=1]
  %2672 = sitofp i32 %2671 to double              ; <double> [#uses=1]
  %2673 = fdiv double %2672, 1.000000e+06         ; <double> [#uses=1]
  %.not2908 = icmp ne %struct.one_result* %results.90, null ; <i1> [#uses=1]
  %2674 = icmp sgt i32 %allocated_results.90, 92  ; <i1> [#uses=1]
  %or.cond2909 = and i1 %2674, %.not2908          ; <i1> [#uses=1]
  br i1 %or.cond2909, label %_Z14test_variable4Ij28custom_add_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1235

bb1.i.i1235:                                      ; preds = %bb5.i1233
  %2675 = add nsw i32 %allocated_results.90, 10   ; <i32> [#uses=3]
  %2676 = mul i32 %2675, 12                       ; <i32> [#uses=1]
  %2677 = bitcast %struct.one_result* %results.90 to i8* ; <i8*> [#uses=1]
  %2678 = tail call i8* @realloc(i8* %2677, i32 %2676) nounwind ; <i8*> [#uses=2]
  %2679 = bitcast i8* %2678 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2680 = icmp eq i8* %2678, null                 ; <i1> [#uses=1]
  br i1 %2680, label %bb2.i.i1236, label %_Z14test_variable4Ij28custom_add_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1236:                                      ; preds = %bb1.i.i1235
  %2681 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2675) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij28custom_add_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1235, %bb5.i1233
  %results.91 = phi %struct.one_result* [ %2679, %bb1.i.i1235 ], [ %results.90, %bb5.i1233 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.91 = phi i32 [ %2675, %bb1.i.i1235 ], [ %allocated_results.90, %bb5.i1233 ] ; <i32> [#uses=3]
  %2682 = phi %struct.one_result* [ %2679, %bb1.i.i1235 ], [ %results.90, %bb5.i1233 ] ; <%struct.one_result*> [#uses=2]
  %2683 = getelementptr inbounds %struct.one_result* %2682, i32 92, i32 0 ; <double*> [#uses=1]
  store double %2673, double* %2683, align 4
  %2684 = getelementptr inbounds %struct.one_result* %2682, i32 92, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str104, i32 0, i32 0), i8** %2684, align 4
  %2685 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1207, label %bb5.i1218

bb.nph6.i1207:                                    ; preds = %_Z14test_variable4Ij28custom_add_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2686 = sub i32 %2599, %2601                    ; <i32> [#uses=1]
  %2687 = mul i32 %2686, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1210

bb2.preheader.us.i1210:                           ; preds = %_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i, %bb.nph6.i1207
  %i.05.us.i1208 = phi i32 [ 0, %bb.nph6.i1207 ], [ %tmp.i1209, %_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1209 = add i32 %i.05.us.i1208, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1216

_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1217, %bb.i1.us.i1211
  %2688 = icmp slt i32 %tmp.i1209, %iterations.0  ; <i1> [#uses=1]
  br i1 %2688, label %bb2.preheader.us.i1210, label %bb5.i1218

bb.i1.us.i1211:                                   ; preds = %bb2.bb3_crit_edge.us.i1217
  %2689 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 93) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i

bb1.us.i1216:                                     ; preds = %bb1.us.i1216, %bb2.preheader.us.i1210
  %result.03.us.i1212 = phi i32 [ 0, %bb2.preheader.us.i1210 ], [ %2692, %bb1.us.i1216 ] ; <i32> [#uses=1]
  %n.02.us.i1213 = phi i32 [ 0, %bb2.preheader.us.i1210 ], [ %2693, %bb1.us.i1216 ] ; <i32> [#uses=2]
  %scevgep.i1214 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1213 ; <i32*> [#uses=1]
  %2690 = load i32* %scevgep.i1214, align 4       ; <i32> [#uses=1]
  %2691 = sub i32 %result.03.us.i1212, %2601      ; <i32> [#uses=1]
  %2692 = add i32 %2691, %2690                    ; <i32> [#uses=2]
  %2693 = add nsw i32 %n.02.us.i1213, 1           ; <i32> [#uses=2]
  %exitcond.i1215 = icmp eq i32 %2693, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1215, label %bb2.bb3_crit_edge.us.i1217, label %bb1.us.i1216

bb2.bb3_crit_edge.us.i1217:                       ; preds = %bb1.us.i1216
  %2694 = icmp eq i32 %2687, %2692                ; <i1> [#uses=1]
  br i1 %2694, label %_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1211

bb5.i1218:                                        ; preds = %_Z26check_shifted_variable_sumIj19custom_sub_variableIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij28custom_add_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2695 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2696 = sub i32 %2695, %2685                    ; <i32> [#uses=1]
  %2697 = sitofp i32 %2696 to double              ; <double> [#uses=1]
  %2698 = fdiv double %2697, 1.000000e+06         ; <double> [#uses=1]
  %.not2910 = icmp ne %struct.one_result* %results.91, null ; <i1> [#uses=1]
  %2699 = icmp sgt i32 %allocated_results.91, 93  ; <i1> [#uses=1]
  %or.cond2911 = and i1 %2699, %.not2910          ; <i1> [#uses=1]
  br i1 %or.cond2911, label %_Z14test_variable1Ij19custom_sub_variableIjEEvPT_iS2_PKc.exit, label %bb1.i.i1220

bb1.i.i1220:                                      ; preds = %bb5.i1218
  %2700 = add nsw i32 %allocated_results.91, 10   ; <i32> [#uses=3]
  %2701 = mul i32 %2700, 12                       ; <i32> [#uses=1]
  %2702 = bitcast %struct.one_result* %results.91 to i8* ; <i8*> [#uses=1]
  %2703 = tail call i8* @realloc(i8* %2702, i32 %2701) nounwind ; <i8*> [#uses=2]
  %2704 = bitcast i8* %2703 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2705 = icmp eq i8* %2703, null                 ; <i1> [#uses=1]
  br i1 %2705, label %bb2.i.i1221, label %_Z14test_variable1Ij19custom_sub_variableIjEEvPT_iS2_PKc.exit

bb2.i.i1221:                                      ; preds = %bb1.i.i1220
  %2706 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2700) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij19custom_sub_variableIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1220, %bb5.i1218
  %results.92 = phi %struct.one_result* [ %2704, %bb1.i.i1220 ], [ %results.91, %bb5.i1218 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.92 = phi i32 [ %2700, %bb1.i.i1220 ], [ %allocated_results.91, %bb5.i1218 ] ; <i32> [#uses=3]
  %2707 = phi %struct.one_result* [ %2704, %bb1.i.i1220 ], [ %results.91, %bb5.i1218 ] ; <%struct.one_result*> [#uses=2]
  %2708 = getelementptr inbounds %struct.one_result* %2707, i32 93, i32 0 ; <double*> [#uses=1]
  store double %2698, double* %2708, align 4
  %2709 = getelementptr inbounds %struct.one_result* %2707, i32 93, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str105, i32 0, i32 0), i8** %2709, align 4
  %2710 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i1192, label %bb5.i1203

bb.nph8.i1192:                                    ; preds = %_Z14test_variable1Ij19custom_sub_variableIjEEvPT_iS2_PKc.exit
  %sum9.i1190 = add i32 %2602, %2601              ; <i32> [#uses=2]
  %2711 = sub i32 0, %sum9.i1190                  ; <i32> [#uses=1]
  %2712 = sub i32 %2711, %2603                    ; <i32> [#uses=1]
  %2713 = sub i32 %2712, %2605                    ; <i32> [#uses=1]
  %sum.i1191 = add i32 %sum9.i1190, %2603         ; <i32> [#uses=1]
  %2714 = sub i32 0, %sum.i1191                   ; <i32> [#uses=1]
  %2715 = sub i32 %2714, %2605                    ; <i32> [#uses=1]
  %2716 = add i32 %2715, %2599                    ; <i32> [#uses=1]
  %2717 = mul i32 %2716, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1195

bb2.preheader.us.i1195:                           ; preds = %_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i1192
  %i.07.us.i1193 = phi i32 [ 0, %bb.nph8.i1192 ], [ %tmp.i1194, %_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1194 = add i32 %i.07.us.i1193, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1201

_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1202, %bb.i1.us.i1196
  %2718 = icmp slt i32 %tmp.i1194, %iterations.0  ; <i1> [#uses=1]
  br i1 %2718, label %bb2.preheader.us.i1195, label %bb5.i1203

bb.i1.us.i1196:                                   ; preds = %bb2.bb3_crit_edge.us.i1202
  %2719 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 94) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1201:                                     ; preds = %bb1.us.i1201, %bb2.preheader.us.i1195
  %result.05.us.i1197 = phi i32 [ 0, %bb2.preheader.us.i1195 ], [ %2722, %bb1.us.i1201 ] ; <i32> [#uses=1]
  %n.04.us.i1198 = phi i32 [ 0, %bb2.preheader.us.i1195 ], [ %2723, %bb1.us.i1201 ] ; <i32> [#uses=2]
  %scevgep.i1199 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.04.us.i1198 ; <i32*> [#uses=1]
  %2720 = load i32* %scevgep.i1199, align 4       ; <i32> [#uses=1]
  %2721 = add i32 %2713, %result.05.us.i1197      ; <i32> [#uses=1]
  %2722 = add i32 %2721, %2720                    ; <i32> [#uses=2]
  %2723 = add nsw i32 %n.04.us.i1198, 1           ; <i32> [#uses=2]
  %exitcond.i1200 = icmp eq i32 %2723, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1200, label %bb2.bb3_crit_edge.us.i1202, label %bb1.us.i1201

bb2.bb3_crit_edge.us.i1202:                       ; preds = %bb1.us.i1201
  %2724 = icmp eq i32 %2717, %2722                ; <i1> [#uses=1]
  br i1 %2724, label %_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1196

bb5.i1203:                                        ; preds = %_Z26check_shifted_variable_sumIj28custom_sub_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij19custom_sub_variableIjEEvPT_iS2_PKc.exit
  %2725 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2726 = sub i32 %2725, %2710                    ; <i32> [#uses=1]
  %2727 = sitofp i32 %2726 to double              ; <double> [#uses=1]
  %2728 = fdiv double %2727, 1.000000e+06         ; <double> [#uses=1]
  %.not2912 = icmp ne %struct.one_result* %results.92, null ; <i1> [#uses=1]
  %2729 = icmp sgt i32 %allocated_results.92, 94  ; <i1> [#uses=1]
  %or.cond2913 = and i1 %2729, %.not2912          ; <i1> [#uses=1]
  br i1 %or.cond2913, label %_Z14test_variable4Ij28custom_sub_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1205

bb1.i.i1205:                                      ; preds = %bb5.i1203
  %2730 = add nsw i32 %allocated_results.92, 10   ; <i32> [#uses=3]
  %2731 = mul i32 %2730, 12                       ; <i32> [#uses=1]
  %2732 = bitcast %struct.one_result* %results.92 to i8* ; <i8*> [#uses=1]
  %2733 = tail call i8* @realloc(i8* %2732, i32 %2731) nounwind ; <i8*> [#uses=2]
  %2734 = bitcast i8* %2733 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2735 = icmp eq i8* %2733, null                 ; <i1> [#uses=1]
  br i1 %2735, label %bb2.i.i1206, label %_Z14test_variable4Ij28custom_sub_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1206:                                      ; preds = %bb1.i.i1205
  %2736 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2730) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij28custom_sub_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1205, %bb5.i1203
  %results.93 = phi %struct.one_result* [ %2734, %bb1.i.i1205 ], [ %results.92, %bb5.i1203 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.93 = phi i32 [ %2730, %bb1.i.i1205 ], [ %allocated_results.92, %bb5.i1203 ] ; <i32> [#uses=3]
  %2737 = phi %struct.one_result* [ %2734, %bb1.i.i1205 ], [ %results.92, %bb5.i1203 ] ; <%struct.one_result*> [#uses=2]
  %2738 = getelementptr inbounds %struct.one_result* %2737, i32 94, i32 0 ; <double*> [#uses=1]
  store double %2728, double* %2738, align 4
  %2739 = getelementptr inbounds %struct.one_result* %2737, i32 94, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str106, i32 0, i32 0), i8** %2739, align 4
  %2740 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1175, label %bb5.i1186

bb.nph6.i1175:                                    ; preds = %_Z14test_variable4Ij28custom_sub_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2741 = mul i32 %2601, 8000                     ; <i32> [#uses=1]
  %2742 = mul i32 %2741, %2599                    ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1178

bb2.preheader.us.i1178:                           ; preds = %_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i, %bb.nph6.i1175
  %i.05.us.i1176 = phi i32 [ 0, %bb.nph6.i1175 ], [ %tmp.i1177, %_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1177 = add i32 %i.05.us.i1176, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1184

_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1185, %bb.i1.us.i1179
  %2743 = icmp slt i32 %tmp.i1177, %iterations.0  ; <i1> [#uses=1]
  br i1 %2743, label %bb2.preheader.us.i1178, label %bb5.i1186

bb.i1.us.i1179:                                   ; preds = %bb2.bb3_crit_edge.us.i1185
  %2744 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 95) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i

bb1.us.i1184:                                     ; preds = %bb1.us.i1184, %bb2.preheader.us.i1178
  %result.03.us.i1180 = phi i32 [ 0, %bb2.preheader.us.i1178 ], [ %2747, %bb1.us.i1184 ] ; <i32> [#uses=1]
  %n.02.us.i1181 = phi i32 [ 0, %bb2.preheader.us.i1178 ], [ %2748, %bb1.us.i1184 ] ; <i32> [#uses=2]
  %scevgep.i1182 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1181 ; <i32*> [#uses=1]
  %2745 = load i32* %scevgep.i1182, align 4       ; <i32> [#uses=1]
  %2746 = mul i32 %2745, %2601                    ; <i32> [#uses=1]
  %2747 = add i32 %2746, %result.03.us.i1180      ; <i32> [#uses=2]
  %2748 = add nsw i32 %n.02.us.i1181, 1           ; <i32> [#uses=2]
  %exitcond.i1183 = icmp eq i32 %2748, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1183, label %bb2.bb3_crit_edge.us.i1185, label %bb1.us.i1184

bb2.bb3_crit_edge.us.i1185:                       ; preds = %bb1.us.i1184
  %2749 = icmp eq i32 %2742, %2747                ; <i1> [#uses=1]
  br i1 %2749, label %_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1179

bb5.i1186:                                        ; preds = %_Z26check_shifted_variable_sumIj24custom_multiply_variableIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij28custom_sub_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2750 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2751 = sub i32 %2750, %2740                    ; <i32> [#uses=1]
  %2752 = sitofp i32 %2751 to double              ; <double> [#uses=1]
  %2753 = fdiv double %2752, 1.000000e+06         ; <double> [#uses=1]
  %.not2914 = icmp ne %struct.one_result* %results.93, null ; <i1> [#uses=1]
  %2754 = icmp sgt i32 %allocated_results.93, 95  ; <i1> [#uses=1]
  %or.cond2915 = and i1 %2754, %.not2914          ; <i1> [#uses=1]
  br i1 %or.cond2915, label %_Z14test_variable1Ij24custom_multiply_variableIjEEvPT_iS2_PKc.exit, label %bb1.i.i1188

bb1.i.i1188:                                      ; preds = %bb5.i1186
  %2755 = add nsw i32 %allocated_results.93, 10   ; <i32> [#uses=3]
  %2756 = mul i32 %2755, 12                       ; <i32> [#uses=1]
  %2757 = bitcast %struct.one_result* %results.93 to i8* ; <i8*> [#uses=1]
  %2758 = tail call i8* @realloc(i8* %2757, i32 %2756) nounwind ; <i8*> [#uses=2]
  %2759 = bitcast i8* %2758 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2760 = icmp eq i8* %2758, null                 ; <i1> [#uses=1]
  br i1 %2760, label %bb2.i.i1189, label %_Z14test_variable1Ij24custom_multiply_variableIjEEvPT_iS2_PKc.exit

bb2.i.i1189:                                      ; preds = %bb1.i.i1188
  %2761 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2755) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij24custom_multiply_variableIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1188, %bb5.i1186
  %results.94 = phi %struct.one_result* [ %2759, %bb1.i.i1188 ], [ %results.93, %bb5.i1186 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.94 = phi i32 [ %2755, %bb1.i.i1188 ], [ %allocated_results.93, %bb5.i1186 ] ; <i32> [#uses=3]
  %2762 = phi %struct.one_result* [ %2759, %bb1.i.i1188 ], [ %results.93, %bb5.i1186 ] ; <%struct.one_result*> [#uses=2]
  %2763 = getelementptr inbounds %struct.one_result* %2762, i32 95, i32 0 ; <double*> [#uses=1]
  store double %2753, double* %2763, align 4
  %2764 = getelementptr inbounds %struct.one_result* %2762, i32 95, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str107, i32 0, i32 0), i8** %2764, align 4
  %2765 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1160, label %bb5.i1171

bb.nph6.i1160:                                    ; preds = %_Z14test_variable1Ij24custom_multiply_variableIjEEvPT_iS2_PKc.exit
  %2766 = mul i32 %2602, %2601                    ; <i32> [#uses=1]
  %2767 = mul i32 %2766, %2603                    ; <i32> [#uses=1]
  %2768 = mul i32 %2767, %2605                    ; <i32> [#uses=1]
  %2769 = mul i32 %2601, 8000                     ; <i32> [#uses=1]
  %2770 = mul i32 %2769, %2602                    ; <i32> [#uses=1]
  %2771 = mul i32 %2770, %2603                    ; <i32> [#uses=1]
  %2772 = mul i32 %2771, %2605                    ; <i32> [#uses=1]
  %2773 = mul i32 %2772, %2599                    ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1163

bb2.preheader.us.i1163:                           ; preds = %_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1160
  %i.05.us.i1161 = phi i32 [ 0, %bb.nph6.i1160 ], [ %tmp.i1162, %_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1162 = add i32 %i.05.us.i1161, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1169

_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1170, %bb.i1.us.i1164
  %2774 = icmp slt i32 %tmp.i1162, %iterations.0  ; <i1> [#uses=1]
  br i1 %2774, label %bb2.preheader.us.i1163, label %bb5.i1171

bb.i1.us.i1164:                                   ; preds = %bb2.bb3_crit_edge.us.i1170
  %2775 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 96) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1169:                                     ; preds = %bb1.us.i1169, %bb2.preheader.us.i1163
  %result.03.us.i1165 = phi i32 [ 0, %bb2.preheader.us.i1163 ], [ %2778, %bb1.us.i1169 ] ; <i32> [#uses=1]
  %n.02.us.i1166 = phi i32 [ 0, %bb2.preheader.us.i1163 ], [ %2779, %bb1.us.i1169 ] ; <i32> [#uses=2]
  %scevgep.i1167 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1166 ; <i32*> [#uses=1]
  %2776 = load i32* %scevgep.i1167, align 4       ; <i32> [#uses=1]
  %2777 = mul i32 %2768, %2776                    ; <i32> [#uses=1]
  %2778 = add i32 %2777, %result.03.us.i1165      ; <i32> [#uses=2]
  %2779 = add nsw i32 %n.02.us.i1166, 1           ; <i32> [#uses=2]
  %exitcond.i1168 = icmp eq i32 %2779, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1168, label %bb2.bb3_crit_edge.us.i1170, label %bb1.us.i1169

bb2.bb3_crit_edge.us.i1170:                       ; preds = %bb1.us.i1169
  %2780 = icmp eq i32 %2773, %2778                ; <i1> [#uses=1]
  br i1 %2780, label %_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1164

bb5.i1171:                                        ; preds = %_Z26check_shifted_variable_sumIj33custom_multiply_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij24custom_multiply_variableIjEEvPT_iS2_PKc.exit
  %2781 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2782 = sub i32 %2781, %2765                    ; <i32> [#uses=1]
  %2783 = sitofp i32 %2782 to double              ; <double> [#uses=1]
  %2784 = fdiv double %2783, 1.000000e+06         ; <double> [#uses=1]
  %.not2916 = icmp ne %struct.one_result* %results.94, null ; <i1> [#uses=1]
  %2785 = icmp sgt i32 %allocated_results.94, 96  ; <i1> [#uses=1]
  %or.cond2917 = and i1 %2785, %.not2916          ; <i1> [#uses=1]
  br i1 %or.cond2917, label %_Z14test_variable4Ij33custom_multiply_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1173

bb1.i.i1173:                                      ; preds = %bb5.i1171
  %2786 = add nsw i32 %allocated_results.94, 10   ; <i32> [#uses=3]
  %2787 = mul i32 %2786, 12                       ; <i32> [#uses=1]
  %2788 = bitcast %struct.one_result* %results.94 to i8* ; <i8*> [#uses=1]
  %2789 = tail call i8* @realloc(i8* %2788, i32 %2787) nounwind ; <i8*> [#uses=2]
  %2790 = bitcast i8* %2789 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2791 = icmp eq i8* %2789, null                 ; <i1> [#uses=1]
  br i1 %2791, label %bb2.i.i1174, label %_Z14test_variable4Ij33custom_multiply_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1174:                                      ; preds = %bb1.i.i1173
  %2792 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2786) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij33custom_multiply_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1173, %bb5.i1171
  %results.95 = phi %struct.one_result* [ %2790, %bb1.i.i1173 ], [ %results.94, %bb5.i1171 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.95 = phi i32 [ %2786, %bb1.i.i1173 ], [ %allocated_results.94, %bb5.i1171 ] ; <i32> [#uses=3]
  %2793 = phi %struct.one_result* [ %2790, %bb1.i.i1173 ], [ %results.94, %bb5.i1171 ] ; <%struct.one_result*> [#uses=2]
  %2794 = getelementptr inbounds %struct.one_result* %2793, i32 96, i32 0 ; <double*> [#uses=1]
  store double %2784, double* %2794, align 4
  %2795 = getelementptr inbounds %struct.one_result* %2793, i32 96, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str108, i32 0, i32 0), i8** %2795, align 4
  %2796 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1145, label %bb5.i1156

bb.nph6.i1145:                                    ; preds = %_Z14test_variable4Ij33custom_multiply_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2797 = mul i32 %2602, %2601                    ; <i32> [#uses=1]
  %2798 = mul i32 %2797, %2603                    ; <i32> [#uses=1]
  %2799 = mul i32 %2798, %2605                    ; <i32> [#uses=2]
  %2800 = add i32 %2599, %2799                    ; <i32> [#uses=1]
  %2801 = mul i32 %2800, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1148

bb2.preheader.us.i1148:                           ; preds = %_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1145
  %i.05.us.i1146 = phi i32 [ 0, %bb.nph6.i1145 ], [ %tmp.i1147, %_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1147 = add i32 %i.05.us.i1146, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1154

_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1155, %bb.i1.us.i1149
  %2802 = icmp slt i32 %tmp.i1147, %iterations.0  ; <i1> [#uses=1]
  br i1 %2802, label %bb2.preheader.us.i1148, label %bb5.i1156

bb.i1.us.i1149:                                   ; preds = %bb2.bb3_crit_edge.us.i1155
  %2803 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 97) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1154:                                     ; preds = %bb1.us.i1154, %bb2.preheader.us.i1148
  %result.03.us.i1150 = phi i32 [ 0, %bb2.preheader.us.i1148 ], [ %2806, %bb1.us.i1154 ] ; <i32> [#uses=1]
  %n.02.us.i1151 = phi i32 [ 0, %bb2.preheader.us.i1148 ], [ %2807, %bb1.us.i1154 ] ; <i32> [#uses=2]
  %scevgep.i1152 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1151 ; <i32*> [#uses=1]
  %2804 = load i32* %scevgep.i1152, align 4       ; <i32> [#uses=1]
  %2805 = add i32 %result.03.us.i1150, %2799      ; <i32> [#uses=1]
  %2806 = add i32 %2805, %2804                    ; <i32> [#uses=2]
  %2807 = add nsw i32 %n.02.us.i1151, 1           ; <i32> [#uses=2]
  %exitcond.i1153 = icmp eq i32 %2807, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1153, label %bb2.bb3_crit_edge.us.i1155, label %bb1.us.i1154

bb2.bb3_crit_edge.us.i1155:                       ; preds = %bb1.us.i1154
  %2808 = icmp eq i32 %2801, %2806                ; <i1> [#uses=1]
  br i1 %2808, label %_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1149

bb5.i1156:                                        ; preds = %_Z26check_shifted_variable_sumIj34custom_multiply_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ij33custom_multiply_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2809 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2810 = sub i32 %2809, %2796                    ; <i32> [#uses=1]
  %2811 = sitofp i32 %2810 to double              ; <double> [#uses=1]
  %2812 = fdiv double %2811, 1.000000e+06         ; <double> [#uses=1]
  %.not2918 = icmp ne %struct.one_result* %results.95, null ; <i1> [#uses=1]
  %2813 = icmp sgt i32 %allocated_results.95, 97  ; <i1> [#uses=1]
  %or.cond2919 = and i1 %2813, %.not2918          ; <i1> [#uses=1]
  br i1 %or.cond2919, label %_Z14test_variable4Ij34custom_multiply_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1158

bb1.i.i1158:                                      ; preds = %bb5.i1156
  %2814 = add nsw i32 %allocated_results.95, 10   ; <i32> [#uses=3]
  %2815 = mul i32 %2814, 12                       ; <i32> [#uses=1]
  %2816 = bitcast %struct.one_result* %results.95 to i8* ; <i8*> [#uses=1]
  %2817 = tail call i8* @realloc(i8* %2816, i32 %2815) nounwind ; <i8*> [#uses=2]
  %2818 = bitcast i8* %2817 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2819 = icmp eq i8* %2817, null                 ; <i1> [#uses=1]
  br i1 %2819, label %bb2.i.i1159, label %_Z14test_variable4Ij34custom_multiply_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1159:                                      ; preds = %bb1.i.i1158
  %2820 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2814) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij34custom_multiply_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1158, %bb5.i1156
  %results.96 = phi %struct.one_result* [ %2818, %bb1.i.i1158 ], [ %results.95, %bb5.i1156 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.96 = phi i32 [ %2814, %bb1.i.i1158 ], [ %allocated_results.95, %bb5.i1156 ] ; <i32> [#uses=3]
  %2821 = phi %struct.one_result* [ %2818, %bb1.i.i1158 ], [ %results.95, %bb5.i1156 ] ; <%struct.one_result*> [#uses=2]
  %2822 = getelementptr inbounds %struct.one_result* %2821, i32 97, i32 0 ; <double*> [#uses=1]
  store double %2812, double* %2822, align 4
  %2823 = getelementptr inbounds %struct.one_result* %2821, i32 97, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([39 x i8]* @.str109, i32 0, i32 0), i8** %2823, align 4
  %2824 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1130, label %bb5.i1141

bb.nph6.i1130:                                    ; preds = %_Z14test_variable4Ij34custom_multiply_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2825 = udiv i32 %2599, %2601                   ; <i32> [#uses=1]
  %2826 = mul i32 %2825, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1133

bb2.preheader.us.i1133:                           ; preds = %_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i, %bb.nph6.i1130
  %i.05.us.i1131 = phi i32 [ 0, %bb.nph6.i1130 ], [ %tmp.i1132, %_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1132 = add i32 %i.05.us.i1131, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1139

_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1140, %bb.i1.us.i1134
  %2827 = icmp slt i32 %tmp.i1132, %iterations.0  ; <i1> [#uses=1]
  br i1 %2827, label %bb2.preheader.us.i1133, label %bb5.i1141

bb.i1.us.i1134:                                   ; preds = %bb2.bb3_crit_edge.us.i1140
  %2828 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 98) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i

bb1.us.i1139:                                     ; preds = %bb1.us.i1139, %bb2.preheader.us.i1133
  %result.03.us.i1135 = phi i32 [ 0, %bb2.preheader.us.i1133 ], [ %2831, %bb1.us.i1139 ] ; <i32> [#uses=1]
  %n.02.us.i1136 = phi i32 [ 0, %bb2.preheader.us.i1133 ], [ %2832, %bb1.us.i1139 ] ; <i32> [#uses=2]
  %scevgep.i1137 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1136 ; <i32*> [#uses=1]
  %2829 = load i32* %scevgep.i1137, align 4       ; <i32> [#uses=1]
  %2830 = udiv i32 %2829, %2601                   ; <i32> [#uses=1]
  %2831 = add i32 %2830, %result.03.us.i1135      ; <i32> [#uses=2]
  %2832 = add nsw i32 %n.02.us.i1136, 1           ; <i32> [#uses=2]
  %exitcond.i1138 = icmp eq i32 %2832, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1138, label %bb2.bb3_crit_edge.us.i1140, label %bb1.us.i1139

bb2.bb3_crit_edge.us.i1140:                       ; preds = %bb1.us.i1139
  %2833 = icmp eq i32 %2826, %2831                ; <i1> [#uses=1]
  br i1 %2833, label %_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1134

bb5.i1141:                                        ; preds = %_Z26check_shifted_variable_sumIj22custom_divide_variableIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij34custom_multiply_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2834 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2835 = sub i32 %2834, %2824                    ; <i32> [#uses=1]
  %2836 = sitofp i32 %2835 to double              ; <double> [#uses=1]
  %2837 = fdiv double %2836, 1.000000e+06         ; <double> [#uses=1]
  %.not2920 = icmp ne %struct.one_result* %results.96, null ; <i1> [#uses=1]
  %2838 = icmp sgt i32 %allocated_results.96, 98  ; <i1> [#uses=1]
  %or.cond2921 = and i1 %2838, %.not2920          ; <i1> [#uses=1]
  br i1 %or.cond2921, label %_Z14test_variable1Ij22custom_divide_variableIjEEvPT_iS2_PKc.exit, label %bb1.i.i1143

bb1.i.i1143:                                      ; preds = %bb5.i1141
  %2839 = add nsw i32 %allocated_results.96, 10   ; <i32> [#uses=3]
  %2840 = mul i32 %2839, 12                       ; <i32> [#uses=1]
  %2841 = bitcast %struct.one_result* %results.96 to i8* ; <i8*> [#uses=1]
  %2842 = tail call i8* @realloc(i8* %2841, i32 %2840) nounwind ; <i8*> [#uses=2]
  %2843 = bitcast i8* %2842 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2844 = icmp eq i8* %2842, null                 ; <i1> [#uses=1]
  br i1 %2844, label %bb2.i.i1144, label %_Z14test_variable1Ij22custom_divide_variableIjEEvPT_iS2_PKc.exit

bb2.i.i1144:                                      ; preds = %bb1.i.i1143
  %2845 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2839) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij22custom_divide_variableIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1143, %bb5.i1141
  %results.97 = phi %struct.one_result* [ %2843, %bb1.i.i1143 ], [ %results.96, %bb5.i1141 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.97 = phi i32 [ %2839, %bb1.i.i1143 ], [ %allocated_results.96, %bb5.i1141 ] ; <i32> [#uses=3]
  %2846 = phi %struct.one_result* [ %2843, %bb1.i.i1143 ], [ %results.96, %bb5.i1141 ] ; <%struct.one_result*> [#uses=2]
  %2847 = getelementptr inbounds %struct.one_result* %2846, i32 98, i32 0 ; <double*> [#uses=1]
  store double %2837, double* %2847, align 4
  %2848 = getelementptr inbounds %struct.one_result* %2846, i32 98, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str110, i32 0, i32 0), i8** %2848, align 4
  %2849 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1115, label %bb5.i1126

bb.nph6.i1115:                                    ; preds = %_Z14test_variable1Ij22custom_divide_variableIjEEvPT_iS2_PKc.exit
  %2850 = udiv i32 %2599, %2601                   ; <i32> [#uses=1]
  %2851 = udiv i32 %2850, %2602                   ; <i32> [#uses=1]
  %2852 = udiv i32 %2851, %2603                   ; <i32> [#uses=1]
  %2853 = udiv i32 %2852, %2605                   ; <i32> [#uses=1]
  %2854 = mul i32 %2853, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1118

bb2.preheader.us.i1118:                           ; preds = %_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1115
  %i.05.us.i1116 = phi i32 [ 0, %bb.nph6.i1115 ], [ %tmp.i1117, %_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1117 = add i32 %i.05.us.i1116, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1124

_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1125, %bb.i1.us.i1119
  %2855 = icmp slt i32 %tmp.i1117, %iterations.0  ; <i1> [#uses=1]
  br i1 %2855, label %bb2.preheader.us.i1118, label %bb5.i1126

bb.i1.us.i1119:                                   ; preds = %bb2.bb3_crit_edge.us.i1125
  %2856 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 99) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1124:                                     ; preds = %bb1.us.i1124, %bb2.preheader.us.i1118
  %result.03.us.i1120 = phi i32 [ 0, %bb2.preheader.us.i1118 ], [ %2862, %bb1.us.i1124 ] ; <i32> [#uses=1]
  %n.02.us.i1121 = phi i32 [ 0, %bb2.preheader.us.i1118 ], [ %2863, %bb1.us.i1124 ] ; <i32> [#uses=2]
  %scevgep.i1122 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1121 ; <i32*> [#uses=1]
  %2857 = load i32* %scevgep.i1122, align 4       ; <i32> [#uses=1]
  %2858 = udiv i32 %2857, %2601                   ; <i32> [#uses=1]
  %2859 = udiv i32 %2858, %2602                   ; <i32> [#uses=1]
  %2860 = udiv i32 %2859, %2603                   ; <i32> [#uses=1]
  %2861 = udiv i32 %2860, %2605                   ; <i32> [#uses=1]
  %2862 = add i32 %2861, %result.03.us.i1120      ; <i32> [#uses=2]
  %2863 = add nsw i32 %n.02.us.i1121, 1           ; <i32> [#uses=2]
  %exitcond.i1123 = icmp eq i32 %2863, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1123, label %bb2.bb3_crit_edge.us.i1125, label %bb1.us.i1124

bb2.bb3_crit_edge.us.i1125:                       ; preds = %bb1.us.i1124
  %2864 = icmp eq i32 %2854, %2862                ; <i1> [#uses=1]
  br i1 %2864, label %_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1119

bb5.i1126:                                        ; preds = %_Z26check_shifted_variable_sumIj31custom_divide_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij22custom_divide_variableIjEEvPT_iS2_PKc.exit
  %2865 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2866 = sub i32 %2865, %2849                    ; <i32> [#uses=1]
  %2867 = sitofp i32 %2866 to double              ; <double> [#uses=1]
  %2868 = fdiv double %2867, 1.000000e+06         ; <double> [#uses=1]
  %.not2922 = icmp ne %struct.one_result* %results.97, null ; <i1> [#uses=1]
  %2869 = icmp sgt i32 %allocated_results.97, 99  ; <i1> [#uses=1]
  %or.cond2923 = and i1 %2869, %.not2922          ; <i1> [#uses=1]
  br i1 %or.cond2923, label %_Z14test_variable4Ij31custom_divide_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1128

bb1.i.i1128:                                      ; preds = %bb5.i1126
  %2870 = add nsw i32 %allocated_results.97, 10   ; <i32> [#uses=3]
  %2871 = mul i32 %2870, 12                       ; <i32> [#uses=1]
  %2872 = bitcast %struct.one_result* %results.97 to i8* ; <i8*> [#uses=1]
  %2873 = tail call i8* @realloc(i8* %2872, i32 %2871) nounwind ; <i8*> [#uses=2]
  %2874 = bitcast i8* %2873 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2875 = icmp eq i8* %2873, null                 ; <i1> [#uses=1]
  br i1 %2875, label %bb2.i.i1129, label %_Z14test_variable4Ij31custom_divide_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1129:                                      ; preds = %bb1.i.i1128
  %2876 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2870) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij31custom_divide_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1128, %bb5.i1126
  %results.98 = phi %struct.one_result* [ %2874, %bb1.i.i1128 ], [ %results.97, %bb5.i1126 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.98 = phi i32 [ %2870, %bb1.i.i1128 ], [ %allocated_results.97, %bb5.i1126 ] ; <i32> [#uses=3]
  %2877 = phi %struct.one_result* [ %2874, %bb1.i.i1128 ], [ %results.97, %bb5.i1126 ] ; <%struct.one_result*> [#uses=2]
  %2878 = getelementptr inbounds %struct.one_result* %2877, i32 99, i32 0 ; <double*> [#uses=1]
  store double %2868, double* %2878, align 4
  %2879 = getelementptr inbounds %struct.one_result* %2877, i32 99, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str111, i32 0, i32 0), i8** %2879, align 4
  %2880 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1100, label %bb5.i1111

bb.nph6.i1100:                                    ; preds = %_Z14test_variable4Ij31custom_divide_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2881 = udiv i32 %2601, %2602                   ; <i32> [#uses=1]
  %2882 = udiv i32 %2881, %2603                   ; <i32> [#uses=1]
  %2883 = udiv i32 %2882, %2605                   ; <i32> [#uses=2]
  %2884 = add i32 %2883, %2599                    ; <i32> [#uses=1]
  %2885 = mul i32 %2884, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1103

bb2.preheader.us.i1103:                           ; preds = %_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1100
  %i.05.us.i1101 = phi i32 [ 0, %bb.nph6.i1100 ], [ %tmp.i1102, %_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1102 = add i32 %i.05.us.i1101, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1109

_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1110, %bb.i1.us.i1104
  %2886 = icmp slt i32 %tmp.i1102, %iterations.0  ; <i1> [#uses=1]
  br i1 %2886, label %bb2.preheader.us.i1103, label %bb5.i1111

bb.i1.us.i1104:                                   ; preds = %bb2.bb3_crit_edge.us.i1110
  %2887 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 100) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1109:                                     ; preds = %bb1.us.i1109, %bb2.preheader.us.i1103
  %result.03.us.i1105 = phi i32 [ 0, %bb2.preheader.us.i1103 ], [ %2890, %bb1.us.i1109 ] ; <i32> [#uses=1]
  %n.02.us.i1106 = phi i32 [ 0, %bb2.preheader.us.i1103 ], [ %2891, %bb1.us.i1109 ] ; <i32> [#uses=2]
  %scevgep.i1107 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1106 ; <i32*> [#uses=1]
  %2888 = load i32* %scevgep.i1107, align 4       ; <i32> [#uses=1]
  %2889 = add i32 %2888, %result.03.us.i1105      ; <i32> [#uses=1]
  %2890 = add i32 %2889, %2883                    ; <i32> [#uses=2]
  %2891 = add nsw i32 %n.02.us.i1106, 1           ; <i32> [#uses=2]
  %exitcond.i1108 = icmp eq i32 %2891, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1108, label %bb2.bb3_crit_edge.us.i1110, label %bb1.us.i1109

bb2.bb3_crit_edge.us.i1110:                       ; preds = %bb1.us.i1109
  %2892 = icmp eq i32 %2885, %2890                ; <i1> [#uses=1]
  br i1 %2892, label %_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1104

bb5.i1111:                                        ; preds = %_Z26check_shifted_variable_sumIj32custom_divide_multiple_variable2IjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ij31custom_divide_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2893 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2894 = sub i32 %2893, %2880                    ; <i32> [#uses=1]
  %2895 = sitofp i32 %2894 to double              ; <double> [#uses=1]
  %2896 = fdiv double %2895, 1.000000e+06         ; <double> [#uses=1]
  %.not2924 = icmp ne %struct.one_result* %results.98, null ; <i1> [#uses=1]
  %2897 = icmp sgt i32 %allocated_results.98, 100 ; <i1> [#uses=1]
  %or.cond2925 = and i1 %2897, %.not2924          ; <i1> [#uses=1]
  br i1 %or.cond2925, label %_Z14test_variable4Ij32custom_divide_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1113

bb1.i.i1113:                                      ; preds = %bb5.i1111
  %2898 = add nsw i32 %allocated_results.98, 10   ; <i32> [#uses=3]
  %2899 = mul i32 %2898, 12                       ; <i32> [#uses=1]
  %2900 = bitcast %struct.one_result* %results.98 to i8* ; <i8*> [#uses=1]
  %2901 = tail call i8* @realloc(i8* %2900, i32 %2899) nounwind ; <i8*> [#uses=2]
  %2902 = bitcast i8* %2901 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2903 = icmp eq i8* %2901, null                 ; <i1> [#uses=1]
  br i1 %2903, label %bb2.i.i1114, label %_Z14test_variable4Ij32custom_divide_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1114:                                      ; preds = %bb1.i.i1113
  %2904 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2898) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij32custom_divide_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1113, %bb5.i1111
  %results.99 = phi %struct.one_result* [ %2902, %bb1.i.i1113 ], [ %results.98, %bb5.i1111 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.99 = phi i32 [ %2898, %bb1.i.i1113 ], [ %allocated_results.98, %bb5.i1111 ] ; <i32> [#uses=3]
  %2905 = phi %struct.one_result* [ %2902, %bb1.i.i1113 ], [ %results.98, %bb5.i1111 ] ; <%struct.one_result*> [#uses=2]
  %2906 = getelementptr inbounds %struct.one_result* %2905, i32 100, i32 0 ; <double*> [#uses=1]
  store double %2896, double* %2906, align 4
  %2907 = getelementptr inbounds %struct.one_result* %2905, i32 100, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str112, i32 0, i32 0), i8** %2907, align 4
  %2908 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i1085, label %bb5.i1096

bb.nph7.i1085:                                    ; preds = %_Z14test_variable4Ij32custom_divide_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2909 = mul i32 %2603, %2602                    ; <i32> [#uses=1]
  %2910 = udiv i32 %2909, %2605                   ; <i32> [#uses=2]
  %2911 = add i32 %2599, %2601                    ; <i32> [#uses=1]
  %2912 = sub i32 %2911, %2910                    ; <i32> [#uses=1]
  %2913 = mul i32 %2912, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1088

bb2.preheader.us.i1088:                           ; preds = %_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i1085
  %i.06.us.i1086 = phi i32 [ 0, %bb.nph7.i1085 ], [ %tmp.i1087, %_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1087 = add i32 %i.06.us.i1086, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1094

_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1095, %bb.i1.us.i1089
  %2914 = icmp slt i32 %tmp.i1087, %iterations.0  ; <i1> [#uses=1]
  br i1 %2914, label %bb2.preheader.us.i1088, label %bb5.i1096

bb.i1.us.i1089:                                   ; preds = %bb2.bb3_crit_edge.us.i1095
  %2915 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 101) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1094:                                     ; preds = %bb1.us.i1094, %bb2.preheader.us.i1088
  %result.04.us.i1090 = phi i32 [ 0, %bb2.preheader.us.i1088 ], [ %2919, %bb1.us.i1094 ] ; <i32> [#uses=1]
  %n.03.us.i1091 = phi i32 [ 0, %bb2.preheader.us.i1088 ], [ %2920, %bb1.us.i1094 ] ; <i32> [#uses=2]
  %scevgep.i1092 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.03.us.i1091 ; <i32*> [#uses=1]
  %2916 = load i32* %scevgep.i1092, align 4       ; <i32> [#uses=1]
  %2917 = add i32 %result.04.us.i1090, %2601      ; <i32> [#uses=1]
  %2918 = add i32 %2917, %2916                    ; <i32> [#uses=1]
  %2919 = sub i32 %2918, %2910                    ; <i32> [#uses=2]
  %2920 = add nsw i32 %n.03.us.i1091, 1           ; <i32> [#uses=2]
  %exitcond.i1093 = icmp eq i32 %2920, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1093, label %bb2.bb3_crit_edge.us.i1095, label %bb1.us.i1094

bb2.bb3_crit_edge.us.i1095:                       ; preds = %bb1.us.i1094
  %2921 = icmp eq i32 %2913, %2919                ; <i1> [#uses=1]
  br i1 %2921, label %_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1089

bb5.i1096:                                        ; preds = %_Z26check_shifted_variable_sumIj30custom_mixed_multiple_variableIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ij32custom_divide_multiple_variable2IjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2922 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2923 = sub i32 %2922, %2908                    ; <i32> [#uses=1]
  %2924 = sitofp i32 %2923 to double              ; <double> [#uses=1]
  %2925 = fdiv double %2924, 1.000000e+06         ; <double> [#uses=1]
  %.not2926 = icmp ne %struct.one_result* %results.99, null ; <i1> [#uses=1]
  %2926 = icmp sgt i32 %allocated_results.99, 101 ; <i1> [#uses=1]
  %or.cond2927 = and i1 %2926, %.not2926          ; <i1> [#uses=1]
  br i1 %or.cond2927, label %_Z14test_variable4Ij30custom_mixed_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1098

bb1.i.i1098:                                      ; preds = %bb5.i1096
  %2927 = add nsw i32 %allocated_results.99, 10   ; <i32> [#uses=3]
  %2928 = mul i32 %2927, 12                       ; <i32> [#uses=1]
  %2929 = bitcast %struct.one_result* %results.99 to i8* ; <i8*> [#uses=1]
  %2930 = tail call i8* @realloc(i8* %2929, i32 %2928) nounwind ; <i8*> [#uses=2]
  %2931 = bitcast i8* %2930 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2932 = icmp eq i8* %2930, null                 ; <i1> [#uses=1]
  br i1 %2932, label %bb2.i.i1099, label %_Z14test_variable4Ij30custom_mixed_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1099:                                      ; preds = %bb1.i.i1098
  %2933 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2927) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij30custom_mixed_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1098, %bb5.i1096
  %results.100 = phi %struct.one_result* [ %2931, %bb1.i.i1098 ], [ %results.99, %bb5.i1096 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.100 = phi i32 [ %2927, %bb1.i.i1098 ], [ %allocated_results.99, %bb5.i1096 ] ; <i32> [#uses=3]
  %2934 = phi %struct.one_result* [ %2931, %bb1.i.i1098 ], [ %results.99, %bb5.i1096 ] ; <%struct.one_result*> [#uses=2]
  %2935 = getelementptr inbounds %struct.one_result* %2934, i32 101, i32 0 ; <double*> [#uses=1]
  store double %2925, double* %2935, align 4
  %2936 = getelementptr inbounds %struct.one_result* %2934, i32 101, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str113, i32 0, i32 0), i8** %2936, align 4
  %2937 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1070, label %bb5.i1081

bb.nph6.i1070:                                    ; preds = %_Z14test_variable4Ij30custom_mixed_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2938 = and i32 %2599, %2601                    ; <i32> [#uses=1]
  %2939 = mul i32 %2938, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1073

bb2.preheader.us.i1073:                           ; preds = %_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i, %bb.nph6.i1070
  %i.05.us.i1071 = phi i32 [ 0, %bb.nph6.i1070 ], [ %tmp.i1072, %_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1072 = add i32 %i.05.us.i1071, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1079

_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1080, %bb.i1.us.i1074
  %2940 = icmp slt i32 %tmp.i1072, %iterations.0  ; <i1> [#uses=1]
  br i1 %2940, label %bb2.preheader.us.i1073, label %bb5.i1081

bb.i1.us.i1074:                                   ; preds = %bb2.bb3_crit_edge.us.i1080
  %2941 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 102) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i

bb1.us.i1079:                                     ; preds = %bb1.us.i1079, %bb2.preheader.us.i1073
  %result.03.us.i1075 = phi i32 [ 0, %bb2.preheader.us.i1073 ], [ %2944, %bb1.us.i1079 ] ; <i32> [#uses=1]
  %n.02.us.i1076 = phi i32 [ 0, %bb2.preheader.us.i1073 ], [ %2945, %bb1.us.i1079 ] ; <i32> [#uses=2]
  %scevgep.i1077 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1076 ; <i32*> [#uses=1]
  %2942 = load i32* %scevgep.i1077, align 4       ; <i32> [#uses=1]
  %2943 = and i32 %2942, %2601                    ; <i32> [#uses=1]
  %2944 = add i32 %2943, %result.03.us.i1075      ; <i32> [#uses=2]
  %2945 = add nsw i32 %n.02.us.i1076, 1           ; <i32> [#uses=2]
  %exitcond.i1078 = icmp eq i32 %2945, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1078, label %bb2.bb3_crit_edge.us.i1080, label %bb1.us.i1079

bb2.bb3_crit_edge.us.i1080:                       ; preds = %bb1.us.i1079
  %2946 = icmp eq i32 %2939, %2944                ; <i1> [#uses=1]
  br i1 %2946, label %_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1074

bb5.i1081:                                        ; preds = %_Z26check_shifted_variable_sumIj19custom_variable_andIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij30custom_mixed_multiple_variableIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2947 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2948 = sub i32 %2947, %2937                    ; <i32> [#uses=1]
  %2949 = sitofp i32 %2948 to double              ; <double> [#uses=1]
  %2950 = fdiv double %2949, 1.000000e+06         ; <double> [#uses=1]
  %.not2928 = icmp ne %struct.one_result* %results.100, null ; <i1> [#uses=1]
  %2951 = icmp sgt i32 %allocated_results.100, 102 ; <i1> [#uses=1]
  %or.cond2929 = and i1 %2951, %.not2928          ; <i1> [#uses=1]
  br i1 %or.cond2929, label %_Z14test_variable1Ij19custom_variable_andIjEEvPT_iS2_PKc.exit, label %bb1.i.i1083

bb1.i.i1083:                                      ; preds = %bb5.i1081
  %2952 = add nsw i32 %allocated_results.100, 10  ; <i32> [#uses=3]
  %2953 = mul i32 %2952, 12                       ; <i32> [#uses=1]
  %2954 = bitcast %struct.one_result* %results.100 to i8* ; <i8*> [#uses=1]
  %2955 = tail call i8* @realloc(i8* %2954, i32 %2953) nounwind ; <i8*> [#uses=2]
  %2956 = bitcast i8* %2955 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2957 = icmp eq i8* %2955, null                 ; <i1> [#uses=1]
  br i1 %2957, label %bb2.i.i1084, label %_Z14test_variable1Ij19custom_variable_andIjEEvPT_iS2_PKc.exit

bb2.i.i1084:                                      ; preds = %bb1.i.i1083
  %2958 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2952) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij19custom_variable_andIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1083, %bb5.i1081
  %results.101 = phi %struct.one_result* [ %2956, %bb1.i.i1083 ], [ %results.100, %bb5.i1081 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.101 = phi i32 [ %2952, %bb1.i.i1083 ], [ %allocated_results.100, %bb5.i1081 ] ; <i32> [#uses=3]
  %2959 = phi %struct.one_result* [ %2956, %bb1.i.i1083 ], [ %results.100, %bb5.i1081 ] ; <%struct.one_result*> [#uses=2]
  %2960 = getelementptr inbounds %struct.one_result* %2959, i32 102, i32 0 ; <double*> [#uses=1]
  store double %2950, double* %2960, align 4
  %2961 = getelementptr inbounds %struct.one_result* %2959, i32 102, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str114, i32 0, i32 0), i8** %2961, align 4
  %2962 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1055, label %bb5.i1066

bb.nph6.i1055:                                    ; preds = %_Z14test_variable1Ij19custom_variable_andIjEEvPT_iS2_PKc.exit
  %2963 = and i32 %2602, %2601                    ; <i32> [#uses=1]
  %2964 = and i32 %2963, %2603                    ; <i32> [#uses=1]
  %2965 = and i32 %2964, %2605                    ; <i32> [#uses=2]
  %2966 = and i32 %2965, %2599                    ; <i32> [#uses=1]
  %2967 = mul i32 %2966, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1058

bb2.preheader.us.i1058:                           ; preds = %_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1055
  %i.05.us.i1056 = phi i32 [ 0, %bb.nph6.i1055 ], [ %tmp.i1057, %_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1057 = add i32 %i.05.us.i1056, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1064

_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1065, %bb.i1.us.i1059
  %2968 = icmp slt i32 %tmp.i1057, %iterations.0  ; <i1> [#uses=1]
  br i1 %2968, label %bb2.preheader.us.i1058, label %bb5.i1066

bb.i1.us.i1059:                                   ; preds = %bb2.bb3_crit_edge.us.i1065
  %2969 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 103) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1064:                                     ; preds = %bb1.us.i1064, %bb2.preheader.us.i1058
  %result.03.us.i1060 = phi i32 [ 0, %bb2.preheader.us.i1058 ], [ %2972, %bb1.us.i1064 ] ; <i32> [#uses=1]
  %n.02.us.i1061 = phi i32 [ 0, %bb2.preheader.us.i1058 ], [ %2973, %bb1.us.i1064 ] ; <i32> [#uses=2]
  %scevgep.i1062 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1061 ; <i32*> [#uses=1]
  %2970 = load i32* %scevgep.i1062, align 4       ; <i32> [#uses=1]
  %2971 = and i32 %2965, %2970                    ; <i32> [#uses=1]
  %2972 = add i32 %2971, %result.03.us.i1060      ; <i32> [#uses=2]
  %2973 = add nsw i32 %n.02.us.i1061, 1           ; <i32> [#uses=2]
  %exitcond.i1063 = icmp eq i32 %2973, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1063, label %bb2.bb3_crit_edge.us.i1065, label %bb1.us.i1064

bb2.bb3_crit_edge.us.i1065:                       ; preds = %bb1.us.i1064
  %2974 = icmp eq i32 %2967, %2972                ; <i1> [#uses=1]
  br i1 %2974, label %_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1059

bb5.i1066:                                        ; preds = %_Z26check_shifted_variable_sumIj28custom_multiple_variable_andIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij19custom_variable_andIjEEvPT_iS2_PKc.exit
  %2975 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %2976 = sub i32 %2975, %2962                    ; <i32> [#uses=1]
  %2977 = sitofp i32 %2976 to double              ; <double> [#uses=1]
  %2978 = fdiv double %2977, 1.000000e+06         ; <double> [#uses=1]
  %.not2930 = icmp ne %struct.one_result* %results.101, null ; <i1> [#uses=1]
  %2979 = icmp sgt i32 %allocated_results.101, 103 ; <i1> [#uses=1]
  %or.cond2931 = and i1 %2979, %.not2930          ; <i1> [#uses=1]
  br i1 %or.cond2931, label %_Z14test_variable4Ij28custom_multiple_variable_andIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1068

bb1.i.i1068:                                      ; preds = %bb5.i1066
  %2980 = add nsw i32 %allocated_results.101, 10  ; <i32> [#uses=3]
  %2981 = mul i32 %2980, 12                       ; <i32> [#uses=1]
  %2982 = bitcast %struct.one_result* %results.101 to i8* ; <i8*> [#uses=1]
  %2983 = tail call i8* @realloc(i8* %2982, i32 %2981) nounwind ; <i8*> [#uses=2]
  %2984 = bitcast i8* %2983 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %2985 = icmp eq i8* %2983, null                 ; <i1> [#uses=1]
  br i1 %2985, label %bb2.i.i1069, label %_Z14test_variable4Ij28custom_multiple_variable_andIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1069:                                      ; preds = %bb1.i.i1068
  %2986 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %2980) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij28custom_multiple_variable_andIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1068, %bb5.i1066
  %results.102 = phi %struct.one_result* [ %2984, %bb1.i.i1068 ], [ %results.101, %bb5.i1066 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.102 = phi i32 [ %2980, %bb1.i.i1068 ], [ %allocated_results.101, %bb5.i1066 ] ; <i32> [#uses=3]
  %2987 = phi %struct.one_result* [ %2984, %bb1.i.i1068 ], [ %results.101, %bb5.i1066 ] ; <%struct.one_result*> [#uses=2]
  %2988 = getelementptr inbounds %struct.one_result* %2987, i32 103, i32 0 ; <double*> [#uses=1]
  store double %2978, double* %2988, align 4
  %2989 = getelementptr inbounds %struct.one_result* %2987, i32 103, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str115, i32 0, i32 0), i8** %2989, align 4
  %2990 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1040, label %bb5.i1051

bb.nph6.i1040:                                    ; preds = %_Z14test_variable4Ij28custom_multiple_variable_andIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %2991 = or i32 %2599, %2601                     ; <i32> [#uses=1]
  %2992 = mul i32 %2991, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1043

bb2.preheader.us.i1043:                           ; preds = %_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i, %bb.nph6.i1040
  %i.05.us.i1041 = phi i32 [ 0, %bb.nph6.i1040 ], [ %tmp.i1042, %_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1042 = add i32 %i.05.us.i1041, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1049

_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1050, %bb.i1.us.i1044
  %2993 = icmp slt i32 %tmp.i1042, %iterations.0  ; <i1> [#uses=1]
  br i1 %2993, label %bb2.preheader.us.i1043, label %bb5.i1051

bb.i1.us.i1044:                                   ; preds = %bb2.bb3_crit_edge.us.i1050
  %2994 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 104) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i

bb1.us.i1049:                                     ; preds = %bb1.us.i1049, %bb2.preheader.us.i1043
  %result.03.us.i1045 = phi i32 [ 0, %bb2.preheader.us.i1043 ], [ %2997, %bb1.us.i1049 ] ; <i32> [#uses=1]
  %n.02.us.i1046 = phi i32 [ 0, %bb2.preheader.us.i1043 ], [ %2998, %bb1.us.i1049 ] ; <i32> [#uses=2]
  %scevgep.i1047 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1046 ; <i32*> [#uses=1]
  %2995 = load i32* %scevgep.i1047, align 4       ; <i32> [#uses=1]
  %2996 = or i32 %2995, %2601                     ; <i32> [#uses=1]
  %2997 = add i32 %2996, %result.03.us.i1045      ; <i32> [#uses=2]
  %2998 = add nsw i32 %n.02.us.i1046, 1           ; <i32> [#uses=2]
  %exitcond.i1048 = icmp eq i32 %2998, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1048, label %bb2.bb3_crit_edge.us.i1050, label %bb1.us.i1049

bb2.bb3_crit_edge.us.i1050:                       ; preds = %bb1.us.i1049
  %2999 = icmp eq i32 %2992, %2997                ; <i1> [#uses=1]
  br i1 %2999, label %_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1044

bb5.i1051:                                        ; preds = %_Z26check_shifted_variable_sumIj18custom_variable_orIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij28custom_multiple_variable_andIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %3000 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3001 = sub i32 %3000, %2990                    ; <i32> [#uses=1]
  %3002 = sitofp i32 %3001 to double              ; <double> [#uses=1]
  %3003 = fdiv double %3002, 1.000000e+06         ; <double> [#uses=1]
  %.not2932 = icmp ne %struct.one_result* %results.102, null ; <i1> [#uses=1]
  %3004 = icmp sgt i32 %allocated_results.102, 104 ; <i1> [#uses=1]
  %or.cond2933 = and i1 %3004, %.not2932          ; <i1> [#uses=1]
  br i1 %or.cond2933, label %_Z14test_variable1Ij18custom_variable_orIjEEvPT_iS2_PKc.exit, label %bb1.i.i1053

bb1.i.i1053:                                      ; preds = %bb5.i1051
  %3005 = add nsw i32 %allocated_results.102, 10  ; <i32> [#uses=3]
  %3006 = mul i32 %3005, 12                       ; <i32> [#uses=1]
  %3007 = bitcast %struct.one_result* %results.102 to i8* ; <i8*> [#uses=1]
  %3008 = tail call i8* @realloc(i8* %3007, i32 %3006) nounwind ; <i8*> [#uses=2]
  %3009 = bitcast i8* %3008 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3010 = icmp eq i8* %3008, null                 ; <i1> [#uses=1]
  br i1 %3010, label %bb2.i.i1054, label %_Z14test_variable1Ij18custom_variable_orIjEEvPT_iS2_PKc.exit

bb2.i.i1054:                                      ; preds = %bb1.i.i1053
  %3011 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3005) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij18custom_variable_orIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1053, %bb5.i1051
  %results.103 = phi %struct.one_result* [ %3009, %bb1.i.i1053 ], [ %results.102, %bb5.i1051 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.103 = phi i32 [ %3005, %bb1.i.i1053 ], [ %allocated_results.102, %bb5.i1051 ] ; <i32> [#uses=3]
  %3012 = phi %struct.one_result* [ %3009, %bb1.i.i1053 ], [ %results.102, %bb5.i1051 ] ; <%struct.one_result*> [#uses=2]
  %3013 = getelementptr inbounds %struct.one_result* %3012, i32 104, i32 0 ; <double*> [#uses=1]
  store double %3003, double* %3013, align 4
  %3014 = getelementptr inbounds %struct.one_result* %3012, i32 104, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str116, i32 0, i32 0), i8** %3014, align 4
  %3015 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1025, label %bb5.i1036

bb.nph6.i1025:                                    ; preds = %_Z14test_variable1Ij18custom_variable_orIjEEvPT_iS2_PKc.exit
  %3016 = or i32 %2602, %2601                     ; <i32> [#uses=1]
  %3017 = or i32 %3016, %2603                     ; <i32> [#uses=1]
  %3018 = or i32 %3017, %2605                     ; <i32> [#uses=2]
  %3019 = or i32 %3018, %2599                     ; <i32> [#uses=1]
  %3020 = mul i32 %3019, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1028

bb2.preheader.us.i1028:                           ; preds = %_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i1025
  %i.05.us.i1026 = phi i32 [ 0, %bb.nph6.i1025 ], [ %tmp.i1027, %_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1027 = add i32 %i.05.us.i1026, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1034

_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1035, %bb.i1.us.i1029
  %3021 = icmp slt i32 %tmp.i1027, %iterations.0  ; <i1> [#uses=1]
  br i1 %3021, label %bb2.preheader.us.i1028, label %bb5.i1036

bb.i1.us.i1029:                                   ; preds = %bb2.bb3_crit_edge.us.i1035
  %3022 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 105) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1034:                                     ; preds = %bb1.us.i1034, %bb2.preheader.us.i1028
  %result.03.us.i1030 = phi i32 [ 0, %bb2.preheader.us.i1028 ], [ %3025, %bb1.us.i1034 ] ; <i32> [#uses=1]
  %n.02.us.i1031 = phi i32 [ 0, %bb2.preheader.us.i1028 ], [ %3026, %bb1.us.i1034 ] ; <i32> [#uses=2]
  %scevgep.i1032 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1031 ; <i32*> [#uses=1]
  %3023 = load i32* %scevgep.i1032, align 4       ; <i32> [#uses=1]
  %3024 = or i32 %3018, %3023                     ; <i32> [#uses=1]
  %3025 = add i32 %3024, %result.03.us.i1030      ; <i32> [#uses=2]
  %3026 = add nsw i32 %n.02.us.i1031, 1           ; <i32> [#uses=2]
  %exitcond.i1033 = icmp eq i32 %3026, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1033, label %bb2.bb3_crit_edge.us.i1035, label %bb1.us.i1034

bb2.bb3_crit_edge.us.i1035:                       ; preds = %bb1.us.i1034
  %3027 = icmp eq i32 %3020, %3025                ; <i1> [#uses=1]
  br i1 %3027, label %_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i1029

bb5.i1036:                                        ; preds = %_Z26check_shifted_variable_sumIj27custom_multiple_variable_orIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij18custom_variable_orIjEEvPT_iS2_PKc.exit
  %3028 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3029 = sub i32 %3028, %3015                    ; <i32> [#uses=1]
  %3030 = sitofp i32 %3029 to double              ; <double> [#uses=1]
  %3031 = fdiv double %3030, 1.000000e+06         ; <double> [#uses=1]
  %.not2934 = icmp ne %struct.one_result* %results.103, null ; <i1> [#uses=1]
  %3032 = icmp sgt i32 %allocated_results.103, 105 ; <i1> [#uses=1]
  %or.cond2935 = and i1 %3032, %.not2934          ; <i1> [#uses=1]
  br i1 %or.cond2935, label %_Z14test_variable4Ij27custom_multiple_variable_orIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1038

bb1.i.i1038:                                      ; preds = %bb5.i1036
  %3033 = add nsw i32 %allocated_results.103, 10  ; <i32> [#uses=3]
  %3034 = mul i32 %3033, 12                       ; <i32> [#uses=1]
  %3035 = bitcast %struct.one_result* %results.103 to i8* ; <i8*> [#uses=1]
  %3036 = tail call i8* @realloc(i8* %3035, i32 %3034) nounwind ; <i8*> [#uses=2]
  %3037 = bitcast i8* %3036 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3038 = icmp eq i8* %3036, null                 ; <i1> [#uses=1]
  br i1 %3038, label %bb2.i.i1039, label %_Z14test_variable4Ij27custom_multiple_variable_orIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1039:                                      ; preds = %bb1.i.i1038
  %3039 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3033) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij27custom_multiple_variable_orIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1038, %bb5.i1036
  %results.104 = phi %struct.one_result* [ %3037, %bb1.i.i1038 ], [ %results.103, %bb5.i1036 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.104 = phi i32 [ %3033, %bb1.i.i1038 ], [ %allocated_results.103, %bb5.i1036 ] ; <i32> [#uses=3]
  %3040 = phi %struct.one_result* [ %3037, %bb1.i.i1038 ], [ %results.103, %bb5.i1036 ] ; <%struct.one_result*> [#uses=2]
  %3041 = getelementptr inbounds %struct.one_result* %3040, i32 105, i32 0 ; <double*> [#uses=1]
  store double %3031, double* %3041, align 4
  %3042 = getelementptr inbounds %struct.one_result* %3040, i32 105, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str117, i32 0, i32 0), i8** %3042, align 4
  %3043 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i1010, label %bb5.i1021

bb.nph6.i1010:                                    ; preds = %_Z14test_variable4Ij27custom_multiple_variable_orIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %3044 = xor i32 %2599, %2601                    ; <i32> [#uses=1]
  %3045 = mul i32 %3044, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i1013

bb2.preheader.us.i1013:                           ; preds = %_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i, %bb.nph6.i1010
  %i.05.us.i1011 = phi i32 [ 0, %bb.nph6.i1010 ], [ %tmp.i1012, %_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i1012 = add i32 %i.05.us.i1011, 1          ; <i32> [#uses=2]
  br label %bb1.us.i1019

_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1020, %bb.i1.us.i1014
  %3046 = icmp slt i32 %tmp.i1012, %iterations.0  ; <i1> [#uses=1]
  br i1 %3046, label %bb2.preheader.us.i1013, label %bb5.i1021

bb.i1.us.i1014:                                   ; preds = %bb2.bb3_crit_edge.us.i1020
  %3047 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 106) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i

bb1.us.i1019:                                     ; preds = %bb1.us.i1019, %bb2.preheader.us.i1013
  %result.03.us.i1015 = phi i32 [ 0, %bb2.preheader.us.i1013 ], [ %3050, %bb1.us.i1019 ] ; <i32> [#uses=1]
  %n.02.us.i1016 = phi i32 [ 0, %bb2.preheader.us.i1013 ], [ %3051, %bb1.us.i1019 ] ; <i32> [#uses=2]
  %scevgep.i1017 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1016 ; <i32*> [#uses=1]
  %3048 = load i32* %scevgep.i1017, align 4       ; <i32> [#uses=1]
  %3049 = xor i32 %3048, %2601                    ; <i32> [#uses=1]
  %3050 = add i32 %3049, %result.03.us.i1015      ; <i32> [#uses=2]
  %3051 = add nsw i32 %n.02.us.i1016, 1           ; <i32> [#uses=2]
  %exitcond.i1018 = icmp eq i32 %3051, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1018, label %bb2.bb3_crit_edge.us.i1020, label %bb1.us.i1019

bb2.bb3_crit_edge.us.i1020:                       ; preds = %bb1.us.i1019
  %3052 = icmp eq i32 %3045, %3050                ; <i1> [#uses=1]
  br i1 %3052, label %_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i, label %bb.i1.us.i1014

bb5.i1021:                                        ; preds = %_Z26check_shifted_variable_sumIj19custom_variable_xorIjEEvT_S2_.exit.us.i, %_Z14test_variable4Ij27custom_multiple_variable_orIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %3053 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3054 = sub i32 %3053, %3043                    ; <i32> [#uses=1]
  %3055 = sitofp i32 %3054 to double              ; <double> [#uses=1]
  %3056 = fdiv double %3055, 1.000000e+06         ; <double> [#uses=1]
  %.not2936 = icmp ne %struct.one_result* %results.104, null ; <i1> [#uses=1]
  %3057 = icmp sgt i32 %allocated_results.104, 106 ; <i1> [#uses=1]
  %or.cond2937 = and i1 %3057, %.not2936          ; <i1> [#uses=1]
  br i1 %or.cond2937, label %_Z14test_variable1Ij19custom_variable_xorIjEEvPT_iS2_PKc.exit, label %bb1.i.i1023

bb1.i.i1023:                                      ; preds = %bb5.i1021
  %3058 = add nsw i32 %allocated_results.104, 10  ; <i32> [#uses=3]
  %3059 = mul i32 %3058, 12                       ; <i32> [#uses=1]
  %3060 = bitcast %struct.one_result* %results.104 to i8* ; <i8*> [#uses=1]
  %3061 = tail call i8* @realloc(i8* %3060, i32 %3059) nounwind ; <i8*> [#uses=2]
  %3062 = bitcast i8* %3061 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3063 = icmp eq i8* %3061, null                 ; <i1> [#uses=1]
  br i1 %3063, label %bb2.i.i1024, label %_Z14test_variable1Ij19custom_variable_xorIjEEvPT_iS2_PKc.exit

bb2.i.i1024:                                      ; preds = %bb1.i.i1023
  %3064 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3058) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ij19custom_variable_xorIjEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i1023, %bb5.i1021
  %results.105 = phi %struct.one_result* [ %3062, %bb1.i.i1023 ], [ %results.104, %bb5.i1021 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.105 = phi i32 [ %3058, %bb1.i.i1023 ], [ %allocated_results.104, %bb5.i1021 ] ; <i32> [#uses=3]
  %3065 = phi %struct.one_result* [ %3062, %bb1.i.i1023 ], [ %results.104, %bb5.i1021 ] ; <%struct.one_result*> [#uses=2]
  %3066 = getelementptr inbounds %struct.one_result* %3065, i32 106, i32 0 ; <double*> [#uses=1]
  store double %3056, double* %3066, align 4
  %3067 = getelementptr inbounds %struct.one_result* %3065, i32 106, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str118, i32 0, i32 0), i8** %3067, align 4
  %3068 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i995, label %bb5.i1006

bb.nph6.i995:                                     ; preds = %_Z14test_variable1Ij19custom_variable_xorIjEEvPT_iS2_PKc.exit
  %3069 = xor i32 %2602, %2601                    ; <i32> [#uses=1]
  %3070 = xor i32 %3069, %2603                    ; <i32> [#uses=1]
  %3071 = xor i32 %3070, %2605                    ; <i32> [#uses=2]
  %3072 = xor i32 %3071, %2599                    ; <i32> [#uses=1]
  %3073 = mul i32 %3072, 8000                     ; <i32> [#uses=1]
  br label %bb2.preheader.us.i998

bb2.preheader.us.i998:                            ; preds = %_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i995
  %i.05.us.i996 = phi i32 [ 0, %bb.nph6.i995 ], [ %tmp.i997, %_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i997 = add i32 %i.05.us.i996, 1            ; <i32> [#uses=2]
  br label %bb1.us.i1004

_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i1005, %bb.i1.us.i999
  %3074 = icmp slt i32 %tmp.i997, %iterations.0   ; <i1> [#uses=1]
  br i1 %3074, label %bb2.preheader.us.i998, label %bb5.i1006

bb.i1.us.i999:                                    ; preds = %bb2.bb3_crit_edge.us.i1005
  %3075 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 107) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i1004:                                     ; preds = %bb1.us.i1004, %bb2.preheader.us.i998
  %result.03.us.i1000 = phi i32 [ 0, %bb2.preheader.us.i998 ], [ %3078, %bb1.us.i1004 ] ; <i32> [#uses=1]
  %n.02.us.i1001 = phi i32 [ 0, %bb2.preheader.us.i998 ], [ %3079, %bb1.us.i1004 ] ; <i32> [#uses=2]
  %scevgep.i1002 = getelementptr [8000 x i32]* @data32unsigned, i32 0, i32 %n.02.us.i1001 ; <i32*> [#uses=1]
  %3076 = load i32* %scevgep.i1002, align 4       ; <i32> [#uses=1]
  %3077 = xor i32 %3071, %3076                    ; <i32> [#uses=1]
  %3078 = add i32 %3077, %result.03.us.i1000      ; <i32> [#uses=2]
  %3079 = add nsw i32 %n.02.us.i1001, 1           ; <i32> [#uses=2]
  %exitcond.i1003 = icmp eq i32 %3079, 8000       ; <i1> [#uses=1]
  br i1 %exitcond.i1003, label %bb2.bb3_crit_edge.us.i1005, label %bb1.us.i1004

bb2.bb3_crit_edge.us.i1005:                       ; preds = %bb1.us.i1004
  %3080 = icmp eq i32 %3073, %3078                ; <i1> [#uses=1]
  br i1 %3080, label %_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i999

bb5.i1006:                                        ; preds = %_Z26check_shifted_variable_sumIj28custom_multiple_variable_xorIjEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ij19custom_variable_xorIjEEvPT_iS2_PKc.exit
  %3081 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3082 = sub i32 %3081, %3068                    ; <i32> [#uses=1]
  %3083 = sitofp i32 %3082 to double              ; <double> [#uses=1]
  %3084 = fdiv double %3083, 1.000000e+06         ; <double> [#uses=1]
  %.not2938 = icmp ne %struct.one_result* %results.105, null ; <i1> [#uses=1]
  %3085 = icmp sgt i32 %allocated_results.105, 107 ; <i1> [#uses=1]
  %or.cond2939 = and i1 %3085, %.not2938          ; <i1> [#uses=1]
  br i1 %or.cond2939, label %_Z14test_variable4Ij28custom_multiple_variable_xorIjEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i1008

bb1.i.i1008:                                      ; preds = %bb5.i1006
  %3086 = add nsw i32 %allocated_results.105, 10  ; <i32> [#uses=3]
  %3087 = mul i32 %3086, 12                       ; <i32> [#uses=1]
  %3088 = bitcast %struct.one_result* %results.105 to i8* ; <i8*> [#uses=1]
  %3089 = tail call i8* @realloc(i8* %3088, i32 %3087) nounwind ; <i8*> [#uses=2]
  %3090 = bitcast i8* %3089 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3091 = icmp eq i8* %3089, null                 ; <i1> [#uses=1]
  br i1 %3091, label %bb2.i.i1009, label %_Z14test_variable4Ij28custom_multiple_variable_xorIjEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i1009:                                      ; preds = %bb1.i.i1008
  %3092 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3086) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ij28custom_multiple_variable_xorIjEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i1008, %bb5.i1006
  %results.106 = phi %struct.one_result* [ %3090, %bb1.i.i1008 ], [ %results.105, %bb5.i1006 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.106 = phi i32 [ %3086, %bb1.i.i1008 ], [ %allocated_results.105, %bb5.i1006 ] ; <i32> [#uses=3]
  %3093 = phi %struct.one_result* [ %3090, %bb1.i.i1008 ], [ %results.105, %bb5.i1006 ] ; <%struct.one_result*> [#uses=2]
  %3094 = getelementptr inbounds %struct.one_result* %3093, i32 107, i32 0 ; <double*> [#uses=1]
  store double %3084, double* %3094, align 4
  %3095 = getelementptr inbounds %struct.one_result* %3093, i32 107, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str119, i32 0, i32 0), i8** %3095, align 4
  %3096 = fptosi double %init_value.0 to i64      ; <i64> [#uses=19]
  br label %bb.i28

bb.i28:                                           ; preds = %bb.i28, %_Z14test_variable4Ij28custom_multiple_variable_xorIjEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i24 = phi i32 [ 0, %_Z14test_variable4Ij28custom_multiple_variable_xorIjEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i26, %bb.i28 ] ; <i32> [#uses=2]
  %tmp.i26 = add i32 %indvar.i24, 1               ; <i32> [#uses=2]
  %first_addr.01.i25 = getelementptr [8000 x i64]* @data64, i32 0, i32 %indvar.i24 ; <i64*> [#uses=1]
  store i64 %3096, i64* %first_addr.01.i25, align 8
  %scevgep.i27.idx.mask = and i32 %tmp.i26, 536870911 ; <i32> [#uses=1]
  %3097 = icmp eq i32 %scevgep.i27.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %3097, label %_Z4fillIPxxEvT_S1_T0_.exit, label %bb.i28

_Z4fillIPxxEvT_S1_T0_.exit:                       ; preds = %bb.i28
  %3098 = fptosi double %temp.0 to i64            ; <i64> [#uses=32]
  %3099 = shl i64 %3098, 1                        ; <i64> [#uses=13]
  %3100 = add nsw i64 %3098, 2                    ; <i64> [#uses=14]
  %3101 = sdiv i64 %3099, %3100                   ; <i64> [#uses=1]
  %3102 = add nsw i64 %3101, %3098                ; <i64> [#uses=13]
  %3103 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i979, label %bb5.i991

bb.nph6.i979:                                     ; preds = %_Z4fillIPxxEvT_S1_T0_.exit
  %3104 = add nsw i64 %3096, %3098                ; <i64> [#uses=1]
  %3105 = mul i64 %3104, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i982

bb2.preheader.us.i982:                            ; preds = %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983, %bb.nph6.i979
  %i.05.us.i980 = phi i32 [ 0, %bb.nph6.i979 ], [ %tmp.i981, %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983 ] ; <i32> [#uses=1]
  %tmp.i981 = add i32 %i.05.us.i980, 1            ; <i32> [#uses=2]
  br label %bb1.us.i989

_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983: ; preds = %bb2.bb3_crit_edge.us.i990, %bb.i1.us.i984
  %3106 = icmp slt i32 %tmp.i981, %iterations.0   ; <i1> [#uses=1]
  br i1 %3106, label %bb2.preheader.us.i982, label %bb5.i991

bb.i1.us.i984:                                    ; preds = %bb2.bb3_crit_edge.us.i990
  %3107 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 108) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983

bb1.us.i989:                                      ; preds = %bb1.us.i989, %bb2.preheader.us.i982
  %result.03.us.i985 = phi i64 [ 0, %bb2.preheader.us.i982 ], [ %3110, %bb1.us.i989 ] ; <i64> [#uses=1]
  %n.02.us.i986 = phi i32 [ 0, %bb2.preheader.us.i982 ], [ %3111, %bb1.us.i989 ] ; <i32> [#uses=2]
  %scevgep.i987 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i986 ; <i64*> [#uses=1]
  %3108 = load i64* %scevgep.i987, align 8        ; <i64> [#uses=1]
  %3109 = add nsw i64 %result.03.us.i985, %3098   ; <i64> [#uses=1]
  %3110 = add nsw i64 %3109, %3108                ; <i64> [#uses=2]
  %3111 = add nsw i32 %n.02.us.i986, 1            ; <i32> [#uses=2]
  %exitcond.i988 = icmp eq i32 %3111, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i988, label %bb2.bb3_crit_edge.us.i990, label %bb1.us.i989

bb2.bb3_crit_edge.us.i990:                        ; preds = %bb1.us.i989
  %3112 = icmp eq i64 %3105, %3110                ; <i1> [#uses=1]
  br i1 %3112, label %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983, label %bb.i1.us.i984

bb5.i991:                                         ; preds = %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i983, %_Z4fillIPxxEvT_S1_T0_.exit
  %3113 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3114 = sub i32 %3113, %3103                    ; <i32> [#uses=1]
  %3115 = sitofp i32 %3114 to double              ; <double> [#uses=1]
  %3116 = fdiv double %3115, 1.000000e+06         ; <double> [#uses=1]
  %.not2940 = icmp ne %struct.one_result* %results.106, null ; <i1> [#uses=1]
  %3117 = icmp sgt i32 %allocated_results.106, 108 ; <i1> [#uses=1]
  %or.cond2941 = and i1 %3117, %.not2940          ; <i1> [#uses=1]
  br i1 %or.cond2941, label %_Z14test_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit, label %bb1.i.i993

bb1.i.i993:                                       ; preds = %bb5.i991
  %3118 = add nsw i32 %allocated_results.106, 10  ; <i32> [#uses=3]
  %3119 = mul i32 %3118, 12                       ; <i32> [#uses=1]
  %3120 = bitcast %struct.one_result* %results.106 to i8* ; <i8*> [#uses=1]
  %3121 = tail call i8* @realloc(i8* %3120, i32 %3119) nounwind ; <i8*> [#uses=2]
  %3122 = bitcast i8* %3121 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3123 = icmp eq i8* %3121, null                 ; <i1> [#uses=1]
  br i1 %3123, label %bb2.i.i994, label %_Z14test_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit

bb2.i.i994:                                       ; preds = %bb1.i.i993
  %3124 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3118) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i993, %bb5.i991
  %results.107 = phi %struct.one_result* [ %3122, %bb1.i.i993 ], [ %results.106, %bb5.i991 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.107 = phi i32 [ %3118, %bb1.i.i993 ], [ %allocated_results.106, %bb5.i991 ] ; <i32> [#uses=3]
  %3125 = phi %struct.one_result* [ %3122, %bb1.i.i993 ], [ %results.106, %bb5.i991 ] ; <%struct.one_result*> [#uses=2]
  %3126 = getelementptr inbounds %struct.one_result* %3125, i32 108, i32 0 ; <double*> [#uses=1]
  store double %3116, double* %3126, align 4
  %3127 = getelementptr inbounds %struct.one_result* %3125, i32 108, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str120, i32 0, i32 0), i8** %3127, align 4
  %3128 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i964, label %bb5.i975

bb.nph6.i964:                                     ; preds = %_Z14test_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit
  %3129 = mul i64 %3098, 8000                     ; <i64> [#uses=1]
  %3130 = add nsw i64 %3096, %3098                ; <i64> [#uses=1]
  %3131 = mul i64 %3130, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i967

bb2.preheader.us.i967:                            ; preds = %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i, %bb.nph6.i964
  %i.05.us.i965 = phi i32 [ 0, %bb.nph6.i964 ], [ %tmp.i966, %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i966 = add i32 %i.05.us.i965, 1            ; <i32> [#uses=2]
  br label %bb1.us.i973

_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i974, %bb.i1.us.i968
  %3132 = icmp slt i32 %tmp.i966, %iterations.0   ; <i1> [#uses=1]
  br i1 %3132, label %bb2.preheader.us.i967, label %bb5.i975

bb.i1.us.i968:                                    ; preds = %bb2.bb3_crit_edge.us.i974
  %3133 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 109) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i

bb1.us.i973:                                      ; preds = %bb1.us.i973, %bb2.preheader.us.i967
  %result.03.us.i969 = phi i64 [ 0, %bb2.preheader.us.i967 ], [ %3135, %bb1.us.i973 ] ; <i64> [#uses=1]
  %n.02.us.i970 = phi i32 [ 0, %bb2.preheader.us.i967 ], [ %3136, %bb1.us.i973 ] ; <i32> [#uses=2]
  %scevgep.i971 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i970 ; <i64*> [#uses=1]
  %3134 = load i64* %scevgep.i971, align 8        ; <i64> [#uses=1]
  %3135 = add nsw i64 %3134, %result.03.us.i969   ; <i64> [#uses=2]
  %3136 = add nsw i32 %n.02.us.i970, 1            ; <i32> [#uses=2]
  %exitcond.i972 = icmp eq i32 %3136, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i972, label %bb2.bb3_crit_edge.us.i974, label %bb1.us.i973

bb2.bb3_crit_edge.us.i974:                        ; preds = %bb1.us.i973
  %3137 = add nsw i64 %3135, %3129                ; <i64> [#uses=1]
  %3138 = icmp eq i64 %3131, %3137                ; <i1> [#uses=1]
  br i1 %3138, label %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i, label %bb.i1.us.i968

bb5.i975:                                         ; preds = %_Z26check_shifted_variable_sumIx19custom_add_variableIxEEvT_S2_.exit.us.i, %_Z14test_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit
  %3139 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3140 = sub i32 %3139, %3128                    ; <i32> [#uses=1]
  %3141 = sitofp i32 %3140 to double              ; <double> [#uses=1]
  %3142 = fdiv double %3141, 1.000000e+06         ; <double> [#uses=1]
  %.not2942 = icmp ne %struct.one_result* %results.107, null ; <i1> [#uses=1]
  %3143 = icmp sgt i32 %allocated_results.107, 109 ; <i1> [#uses=1]
  %or.cond2943 = and i1 %3143, %.not2942          ; <i1> [#uses=1]
  br i1 %or.cond2943, label %_Z22test_hoisted_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit, label %bb1.i.i977

bb1.i.i977:                                       ; preds = %bb5.i975
  %3144 = add nsw i32 %allocated_results.107, 10  ; <i32> [#uses=3]
  %3145 = mul i32 %3144, 12                       ; <i32> [#uses=1]
  %3146 = bitcast %struct.one_result* %results.107 to i8* ; <i8*> [#uses=1]
  %3147 = tail call i8* @realloc(i8* %3146, i32 %3145) nounwind ; <i8*> [#uses=2]
  %3148 = bitcast i8* %3147 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3149 = icmp eq i8* %3147, null                 ; <i1> [#uses=1]
  br i1 %3149, label %bb2.i.i978, label %_Z22test_hoisted_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit

bb2.i.i978:                                       ; preds = %bb1.i.i977
  %3150 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3144) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i977, %bb5.i975
  %results.108 = phi %struct.one_result* [ %3148, %bb1.i.i977 ], [ %results.107, %bb5.i975 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.108 = phi i32 [ %3144, %bb1.i.i977 ], [ %allocated_results.107, %bb5.i975 ] ; <i32> [#uses=3]
  %3151 = phi %struct.one_result* [ %3148, %bb1.i.i977 ], [ %results.107, %bb5.i975 ] ; <%struct.one_result*> [#uses=2]
  %3152 = getelementptr inbounds %struct.one_result* %3151, i32 109, i32 0 ; <double*> [#uses=1]
  store double %3142, double* %3152, align 4
  %3153 = getelementptr inbounds %struct.one_result* %3151, i32 109, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str121, i32 0, i32 0), i8** %3153, align 4
  %3154 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i949, label %bb5.i960

bb.nph6.i949:                                     ; preds = %_Z22test_hoisted_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit
  %3155 = add nsw i64 %3099, %3098                ; <i64> [#uses=1]
  %3156 = add nsw i64 %3155, %3100                ; <i64> [#uses=1]
  %3157 = add nsw i64 %3156, %3102                ; <i64> [#uses=2]
  %3158 = add nsw i64 %3157, %3096                ; <i64> [#uses=1]
  %3159 = mul i64 %3158, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i952

bb2.preheader.us.i952:                            ; preds = %_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i949
  %i.05.us.i950 = phi i32 [ 0, %bb.nph6.i949 ], [ %tmp.i951, %_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i951 = add i32 %i.05.us.i950, 1            ; <i32> [#uses=2]
  br label %bb1.us.i958

_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i959, %bb.i1.us.i953
  %3160 = icmp slt i32 %tmp.i951, %iterations.0   ; <i1> [#uses=1]
  br i1 %3160, label %bb2.preheader.us.i952, label %bb5.i960

bb.i1.us.i953:                                    ; preds = %bb2.bb3_crit_edge.us.i959
  %3161 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 110) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i958:                                      ; preds = %bb1.us.i958, %bb2.preheader.us.i952
  %result.03.us.i954 = phi i64 [ 0, %bb2.preheader.us.i952 ], [ %3164, %bb1.us.i958 ] ; <i64> [#uses=1]
  %n.02.us.i955 = phi i32 [ 0, %bb2.preheader.us.i952 ], [ %3165, %bb1.us.i958 ] ; <i32> [#uses=2]
  %scevgep.i956 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i955 ; <i64*> [#uses=1]
  %3162 = load i64* %scevgep.i956, align 8        ; <i64> [#uses=1]
  %3163 = add nsw i64 %3157, %result.03.us.i954   ; <i64> [#uses=1]
  %3164 = add nsw i64 %3163, %3162                ; <i64> [#uses=2]
  %3165 = add nsw i32 %n.02.us.i955, 1            ; <i32> [#uses=2]
  %exitcond.i957 = icmp eq i32 %3165, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i957, label %bb2.bb3_crit_edge.us.i959, label %bb1.us.i958

bb2.bb3_crit_edge.us.i959:                        ; preds = %bb1.us.i958
  %3166 = icmp eq i64 %3159, %3164                ; <i1> [#uses=1]
  br i1 %3166, label %_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i953

bb5.i960:                                         ; preds = %_Z26check_shifted_variable_sumIx28custom_add_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Ix19custom_add_variableIxEEvPT_iS2_PKc.exit
  %3167 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3168 = sub i32 %3167, %3154                    ; <i32> [#uses=1]
  %3169 = sitofp i32 %3168 to double              ; <double> [#uses=1]
  %3170 = fdiv double %3169, 1.000000e+06         ; <double> [#uses=1]
  %.not2944 = icmp ne %struct.one_result* %results.108, null ; <i1> [#uses=1]
  %3171 = icmp sgt i32 %allocated_results.108, 110 ; <i1> [#uses=1]
  %or.cond2945 = and i1 %3171, %.not2944          ; <i1> [#uses=1]
  br i1 %or.cond2945, label %_Z14test_variable4Ix28custom_add_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i962

bb1.i.i962:                                       ; preds = %bb5.i960
  %3172 = add nsw i32 %allocated_results.108, 10  ; <i32> [#uses=3]
  %3173 = mul i32 %3172, 12                       ; <i32> [#uses=1]
  %3174 = bitcast %struct.one_result* %results.108 to i8* ; <i8*> [#uses=1]
  %3175 = tail call i8* @realloc(i8* %3174, i32 %3173) nounwind ; <i8*> [#uses=2]
  %3176 = bitcast i8* %3175 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3177 = icmp eq i8* %3175, null                 ; <i1> [#uses=1]
  br i1 %3177, label %bb2.i.i963, label %_Z14test_variable4Ix28custom_add_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i963:                                       ; preds = %bb1.i.i962
  %3178 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3172) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix28custom_add_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i962, %bb5.i960
  %results.109 = phi %struct.one_result* [ %3176, %bb1.i.i962 ], [ %results.108, %bb5.i960 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.109 = phi i32 [ %3172, %bb1.i.i962 ], [ %allocated_results.108, %bb5.i960 ] ; <i32> [#uses=3]
  %3179 = phi %struct.one_result* [ %3176, %bb1.i.i962 ], [ %results.108, %bb5.i960 ] ; <%struct.one_result*> [#uses=2]
  %3180 = getelementptr inbounds %struct.one_result* %3179, i32 110, i32 0 ; <double*> [#uses=1]
  store double %3170, double* %3180, align 4
  %3181 = getelementptr inbounds %struct.one_result* %3179, i32 110, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str122, i32 0, i32 0), i8** %3181, align 4
  %3182 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i934, label %bb5.i945

bb.nph6.i934:                                     ; preds = %_Z14test_variable4Ix28custom_add_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3183 = sub i64 %3096, %3098                    ; <i64> [#uses=1]
  %3184 = mul i64 %3183, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i937

bb2.preheader.us.i937:                            ; preds = %_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i, %bb.nph6.i934
  %i.05.us.i935 = phi i32 [ 0, %bb.nph6.i934 ], [ %tmp.i936, %_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i936 = add i32 %i.05.us.i935, 1            ; <i32> [#uses=2]
  br label %bb1.us.i943

_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i944, %bb.i1.us.i938
  %3185 = icmp slt i32 %tmp.i936, %iterations.0   ; <i1> [#uses=1]
  br i1 %3185, label %bb2.preheader.us.i937, label %bb5.i945

bb.i1.us.i938:                                    ; preds = %bb2.bb3_crit_edge.us.i944
  %3186 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 111) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i

bb1.us.i943:                                      ; preds = %bb1.us.i943, %bb2.preheader.us.i937
  %result.03.us.i939 = phi i64 [ 0, %bb2.preheader.us.i937 ], [ %3189, %bb1.us.i943 ] ; <i64> [#uses=1]
  %n.02.us.i940 = phi i32 [ 0, %bb2.preheader.us.i937 ], [ %3190, %bb1.us.i943 ] ; <i32> [#uses=2]
  %scevgep.i941 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i940 ; <i64*> [#uses=1]
  %3187 = load i64* %scevgep.i941, align 8        ; <i64> [#uses=1]
  %3188 = sub i64 %result.03.us.i939, %3098       ; <i64> [#uses=1]
  %3189 = add nsw i64 %3188, %3187                ; <i64> [#uses=2]
  %3190 = add nsw i32 %n.02.us.i940, 1            ; <i32> [#uses=2]
  %exitcond.i942 = icmp eq i32 %3190, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i942, label %bb2.bb3_crit_edge.us.i944, label %bb1.us.i943

bb2.bb3_crit_edge.us.i944:                        ; preds = %bb1.us.i943
  %3191 = icmp eq i64 %3184, %3189                ; <i1> [#uses=1]
  br i1 %3191, label %_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i, label %bb.i1.us.i938

bb5.i945:                                         ; preds = %_Z26check_shifted_variable_sumIx19custom_sub_variableIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix28custom_add_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3192 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3193 = sub i32 %3192, %3182                    ; <i32> [#uses=1]
  %3194 = sitofp i32 %3193 to double              ; <double> [#uses=1]
  %3195 = fdiv double %3194, 1.000000e+06         ; <double> [#uses=1]
  %.not2946 = icmp ne %struct.one_result* %results.109, null ; <i1> [#uses=1]
  %3196 = icmp sgt i32 %allocated_results.109, 111 ; <i1> [#uses=1]
  %or.cond2947 = and i1 %3196, %.not2946          ; <i1> [#uses=1]
  br i1 %or.cond2947, label %_Z14test_variable1Ix19custom_sub_variableIxEEvPT_iS2_PKc.exit, label %bb1.i.i947

bb1.i.i947:                                       ; preds = %bb5.i945
  %3197 = add nsw i32 %allocated_results.109, 10  ; <i32> [#uses=3]
  %3198 = mul i32 %3197, 12                       ; <i32> [#uses=1]
  %3199 = bitcast %struct.one_result* %results.109 to i8* ; <i8*> [#uses=1]
  %3200 = tail call i8* @realloc(i8* %3199, i32 %3198) nounwind ; <i8*> [#uses=2]
  %3201 = bitcast i8* %3200 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3202 = icmp eq i8* %3200, null                 ; <i1> [#uses=1]
  br i1 %3202, label %bb2.i.i948, label %_Z14test_variable1Ix19custom_sub_variableIxEEvPT_iS2_PKc.exit

bb2.i.i948:                                       ; preds = %bb1.i.i947
  %3203 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3197) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix19custom_sub_variableIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i947, %bb5.i945
  %results.110 = phi %struct.one_result* [ %3201, %bb1.i.i947 ], [ %results.109, %bb5.i945 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.110 = phi i32 [ %3197, %bb1.i.i947 ], [ %allocated_results.109, %bb5.i945 ] ; <i32> [#uses=3]
  %3204 = phi %struct.one_result* [ %3201, %bb1.i.i947 ], [ %results.109, %bb5.i945 ] ; <%struct.one_result*> [#uses=2]
  %3205 = getelementptr inbounds %struct.one_result* %3204, i32 111, i32 0 ; <double*> [#uses=1]
  store double %3195, double* %3205, align 4
  %3206 = getelementptr inbounds %struct.one_result* %3204, i32 111, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str123, i32 0, i32 0), i8** %3206, align 4
  %3207 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i919, label %bb5.i930

bb.nph8.i919:                                     ; preds = %_Z14test_variable1Ix19custom_sub_variableIxEEvPT_iS2_PKc.exit
  %sum9.i917 = add i64 %3099, %3098               ; <i64> [#uses=2]
  %3208 = sub i64 0, %sum9.i917                   ; <i64> [#uses=1]
  %3209 = sub i64 %3208, %3100                    ; <i64> [#uses=1]
  %3210 = sub i64 %3209, %3102                    ; <i64> [#uses=1]
  %sum.i918 = add i64 %sum9.i917, %3100           ; <i64> [#uses=1]
  %3211 = sub i64 0, %sum.i918                    ; <i64> [#uses=1]
  %3212 = sub i64 %3211, %3102                    ; <i64> [#uses=1]
  %3213 = add i64 %3212, %3096                    ; <i64> [#uses=1]
  %3214 = mul i64 %3213, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i922

bb2.preheader.us.i922:                            ; preds = %_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i919
  %i.07.us.i920 = phi i32 [ 0, %bb.nph8.i919 ], [ %tmp.i921, %_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i921 = add i32 %i.07.us.i920, 1            ; <i32> [#uses=2]
  br label %bb1.us.i928

_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i929, %bb.i1.us.i923
  %3215 = icmp slt i32 %tmp.i921, %iterations.0   ; <i1> [#uses=1]
  br i1 %3215, label %bb2.preheader.us.i922, label %bb5.i930

bb.i1.us.i923:                                    ; preds = %bb2.bb3_crit_edge.us.i929
  %3216 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 112) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i928:                                      ; preds = %bb1.us.i928, %bb2.preheader.us.i922
  %result.05.us.i924 = phi i64 [ 0, %bb2.preheader.us.i922 ], [ %3219, %bb1.us.i928 ] ; <i64> [#uses=1]
  %n.04.us.i925 = phi i32 [ 0, %bb2.preheader.us.i922 ], [ %3220, %bb1.us.i928 ] ; <i32> [#uses=2]
  %scevgep.i926 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.04.us.i925 ; <i64*> [#uses=1]
  %3217 = load i64* %scevgep.i926, align 8        ; <i64> [#uses=1]
  %3218 = add i64 %3210, %result.05.us.i924       ; <i64> [#uses=1]
  %3219 = add nsw i64 %3218, %3217                ; <i64> [#uses=2]
  %3220 = add nsw i32 %n.04.us.i925, 1            ; <i32> [#uses=2]
  %exitcond.i927 = icmp eq i32 %3220, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i927, label %bb2.bb3_crit_edge.us.i929, label %bb1.us.i928

bb2.bb3_crit_edge.us.i929:                        ; preds = %bb1.us.i928
  %3221 = icmp eq i64 %3214, %3219                ; <i1> [#uses=1]
  br i1 %3221, label %_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i923

bb5.i930:                                         ; preds = %_Z26check_shifted_variable_sumIx28custom_sub_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix19custom_sub_variableIxEEvPT_iS2_PKc.exit
  %3222 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3223 = sub i32 %3222, %3207                    ; <i32> [#uses=1]
  %3224 = sitofp i32 %3223 to double              ; <double> [#uses=1]
  %3225 = fdiv double %3224, 1.000000e+06         ; <double> [#uses=1]
  %.not2948 = icmp ne %struct.one_result* %results.110, null ; <i1> [#uses=1]
  %3226 = icmp sgt i32 %allocated_results.110, 112 ; <i1> [#uses=1]
  %or.cond2949 = and i1 %3226, %.not2948          ; <i1> [#uses=1]
  br i1 %or.cond2949, label %_Z14test_variable4Ix28custom_sub_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i932

bb1.i.i932:                                       ; preds = %bb5.i930
  %3227 = add nsw i32 %allocated_results.110, 10  ; <i32> [#uses=3]
  %3228 = mul i32 %3227, 12                       ; <i32> [#uses=1]
  %3229 = bitcast %struct.one_result* %results.110 to i8* ; <i8*> [#uses=1]
  %3230 = tail call i8* @realloc(i8* %3229, i32 %3228) nounwind ; <i8*> [#uses=2]
  %3231 = bitcast i8* %3230 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3232 = icmp eq i8* %3230, null                 ; <i1> [#uses=1]
  br i1 %3232, label %bb2.i.i933, label %_Z14test_variable4Ix28custom_sub_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i933:                                       ; preds = %bb1.i.i932
  %3233 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3227) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix28custom_sub_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i932, %bb5.i930
  %results.111 = phi %struct.one_result* [ %3231, %bb1.i.i932 ], [ %results.110, %bb5.i930 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.111 = phi i32 [ %3227, %bb1.i.i932 ], [ %allocated_results.110, %bb5.i930 ] ; <i32> [#uses=3]
  %3234 = phi %struct.one_result* [ %3231, %bb1.i.i932 ], [ %results.110, %bb5.i930 ] ; <%struct.one_result*> [#uses=2]
  %3235 = getelementptr inbounds %struct.one_result* %3234, i32 112, i32 0 ; <double*> [#uses=1]
  store double %3225, double* %3235, align 4
  %3236 = getelementptr inbounds %struct.one_result* %3234, i32 112, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str124, i32 0, i32 0), i8** %3236, align 4
  %3237 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i902, label %bb5.i913

bb.nph6.i902:                                     ; preds = %_Z14test_variable4Ix28custom_sub_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3238 = mul i64 %3098, 8000                     ; <i64> [#uses=1]
  %3239 = mul i64 %3238, %3096                    ; <i64> [#uses=1]
  br label %bb2.preheader.us.i905

bb2.preheader.us.i905:                            ; preds = %_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i, %bb.nph6.i902
  %i.05.us.i903 = phi i32 [ 0, %bb.nph6.i902 ], [ %tmp.i904, %_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i904 = add i32 %i.05.us.i903, 1            ; <i32> [#uses=2]
  br label %bb1.us.i911

_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i912, %bb.i1.us.i906
  %3240 = icmp slt i32 %tmp.i904, %iterations.0   ; <i1> [#uses=1]
  br i1 %3240, label %bb2.preheader.us.i905, label %bb5.i913

bb.i1.us.i906:                                    ; preds = %bb2.bb3_crit_edge.us.i912
  %3241 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 113) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i

bb1.us.i911:                                      ; preds = %bb1.us.i911, %bb2.preheader.us.i905
  %result.03.us.i907 = phi i64 [ 0, %bb2.preheader.us.i905 ], [ %3244, %bb1.us.i911 ] ; <i64> [#uses=1]
  %n.02.us.i908 = phi i32 [ 0, %bb2.preheader.us.i905 ], [ %3245, %bb1.us.i911 ] ; <i32> [#uses=2]
  %scevgep.i909 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i908 ; <i64*> [#uses=1]
  %3242 = load i64* %scevgep.i909, align 8        ; <i64> [#uses=1]
  %3243 = mul i64 %3242, %3098                    ; <i64> [#uses=1]
  %3244 = add nsw i64 %3243, %result.03.us.i907   ; <i64> [#uses=2]
  %3245 = add nsw i32 %n.02.us.i908, 1            ; <i32> [#uses=2]
  %exitcond.i910 = icmp eq i32 %3245, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i910, label %bb2.bb3_crit_edge.us.i912, label %bb1.us.i911

bb2.bb3_crit_edge.us.i912:                        ; preds = %bb1.us.i911
  %3246 = icmp eq i64 %3239, %3244                ; <i1> [#uses=1]
  br i1 %3246, label %_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i, label %bb.i1.us.i906

bb5.i913:                                         ; preds = %_Z26check_shifted_variable_sumIx24custom_multiply_variableIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix28custom_sub_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3247 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3248 = sub i32 %3247, %3237                    ; <i32> [#uses=1]
  %3249 = sitofp i32 %3248 to double              ; <double> [#uses=1]
  %3250 = fdiv double %3249, 1.000000e+06         ; <double> [#uses=1]
  %.not2950 = icmp ne %struct.one_result* %results.111, null ; <i1> [#uses=1]
  %3251 = icmp sgt i32 %allocated_results.111, 113 ; <i1> [#uses=1]
  %or.cond2951 = and i1 %3251, %.not2950          ; <i1> [#uses=1]
  br i1 %or.cond2951, label %_Z14test_variable1Ix24custom_multiply_variableIxEEvPT_iS2_PKc.exit, label %bb1.i.i915

bb1.i.i915:                                       ; preds = %bb5.i913
  %3252 = add nsw i32 %allocated_results.111, 10  ; <i32> [#uses=3]
  %3253 = mul i32 %3252, 12                       ; <i32> [#uses=1]
  %3254 = bitcast %struct.one_result* %results.111 to i8* ; <i8*> [#uses=1]
  %3255 = tail call i8* @realloc(i8* %3254, i32 %3253) nounwind ; <i8*> [#uses=2]
  %3256 = bitcast i8* %3255 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3257 = icmp eq i8* %3255, null                 ; <i1> [#uses=1]
  br i1 %3257, label %bb2.i.i916, label %_Z14test_variable1Ix24custom_multiply_variableIxEEvPT_iS2_PKc.exit

bb2.i.i916:                                       ; preds = %bb1.i.i915
  %3258 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3252) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix24custom_multiply_variableIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i915, %bb5.i913
  %results.112 = phi %struct.one_result* [ %3256, %bb1.i.i915 ], [ %results.111, %bb5.i913 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.112 = phi i32 [ %3252, %bb1.i.i915 ], [ %allocated_results.111, %bb5.i913 ] ; <i32> [#uses=3]
  %3259 = phi %struct.one_result* [ %3256, %bb1.i.i915 ], [ %results.111, %bb5.i913 ] ; <%struct.one_result*> [#uses=2]
  %3260 = getelementptr inbounds %struct.one_result* %3259, i32 113, i32 0 ; <double*> [#uses=1]
  store double %3250, double* %3260, align 4
  %3261 = getelementptr inbounds %struct.one_result* %3259, i32 113, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([26 x i8]* @.str125, i32 0, i32 0), i8** %3261, align 4
  %3262 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i887, label %bb5.i898

bb.nph6.i887:                                     ; preds = %_Z14test_variable1Ix24custom_multiply_variableIxEEvPT_iS2_PKc.exit
  %3263 = mul i64 %3099, %3098                    ; <i64> [#uses=1]
  %3264 = mul i64 %3263, %3100                    ; <i64> [#uses=1]
  %3265 = mul i64 %3264, %3102                    ; <i64> [#uses=1]
  %3266 = mul i64 %3098, 8000                     ; <i64> [#uses=1]
  %3267 = mul i64 %3266, %3099                    ; <i64> [#uses=1]
  %3268 = mul i64 %3267, %3100                    ; <i64> [#uses=1]
  %3269 = mul i64 %3268, %3102                    ; <i64> [#uses=1]
  %3270 = mul i64 %3269, %3096                    ; <i64> [#uses=1]
  br label %bb2.preheader.us.i890

bb2.preheader.us.i890:                            ; preds = %_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i887
  %i.05.us.i888 = phi i32 [ 0, %bb.nph6.i887 ], [ %tmp.i889, %_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i889 = add i32 %i.05.us.i888, 1            ; <i32> [#uses=2]
  br label %bb1.us.i896

_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i897, %bb.i1.us.i891
  %3271 = icmp slt i32 %tmp.i889, %iterations.0   ; <i1> [#uses=1]
  br i1 %3271, label %bb2.preheader.us.i890, label %bb5.i898

bb.i1.us.i891:                                    ; preds = %bb2.bb3_crit_edge.us.i897
  %3272 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 114) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i896:                                      ; preds = %bb1.us.i896, %bb2.preheader.us.i890
  %result.03.us.i892 = phi i64 [ 0, %bb2.preheader.us.i890 ], [ %3275, %bb1.us.i896 ] ; <i64> [#uses=1]
  %n.02.us.i893 = phi i32 [ 0, %bb2.preheader.us.i890 ], [ %3276, %bb1.us.i896 ] ; <i32> [#uses=2]
  %scevgep.i894 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i893 ; <i64*> [#uses=1]
  %3273 = load i64* %scevgep.i894, align 8        ; <i64> [#uses=1]
  %3274 = mul i64 %3265, %3273                    ; <i64> [#uses=1]
  %3275 = add nsw i64 %3274, %result.03.us.i892   ; <i64> [#uses=2]
  %3276 = add nsw i32 %n.02.us.i893, 1            ; <i32> [#uses=2]
  %exitcond.i895 = icmp eq i32 %3276, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i895, label %bb2.bb3_crit_edge.us.i897, label %bb1.us.i896

bb2.bb3_crit_edge.us.i897:                        ; preds = %bb1.us.i896
  %3277 = icmp eq i64 %3270, %3275                ; <i1> [#uses=1]
  br i1 %3277, label %_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i891

bb5.i898:                                         ; preds = %_Z26check_shifted_variable_sumIx33custom_multiply_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix24custom_multiply_variableIxEEvPT_iS2_PKc.exit
  %3278 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3279 = sub i32 %3278, %3262                    ; <i32> [#uses=1]
  %3280 = sitofp i32 %3279 to double              ; <double> [#uses=1]
  %3281 = fdiv double %3280, 1.000000e+06         ; <double> [#uses=1]
  %.not2952 = icmp ne %struct.one_result* %results.112, null ; <i1> [#uses=1]
  %3282 = icmp sgt i32 %allocated_results.112, 114 ; <i1> [#uses=1]
  %or.cond2953 = and i1 %3282, %.not2952          ; <i1> [#uses=1]
  br i1 %or.cond2953, label %_Z14test_variable4Ix33custom_multiply_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i900

bb1.i.i900:                                       ; preds = %bb5.i898
  %3283 = add nsw i32 %allocated_results.112, 10  ; <i32> [#uses=3]
  %3284 = mul i32 %3283, 12                       ; <i32> [#uses=1]
  %3285 = bitcast %struct.one_result* %results.112 to i8* ; <i8*> [#uses=1]
  %3286 = tail call i8* @realloc(i8* %3285, i32 %3284) nounwind ; <i8*> [#uses=2]
  %3287 = bitcast i8* %3286 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3288 = icmp eq i8* %3286, null                 ; <i1> [#uses=1]
  br i1 %3288, label %bb2.i.i901, label %_Z14test_variable4Ix33custom_multiply_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i901:                                       ; preds = %bb1.i.i900
  %3289 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3283) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix33custom_multiply_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i900, %bb5.i898
  %results.113 = phi %struct.one_result* [ %3287, %bb1.i.i900 ], [ %results.112, %bb5.i898 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.113 = phi i32 [ %3283, %bb1.i.i900 ], [ %allocated_results.112, %bb5.i898 ] ; <i32> [#uses=3]
  %3290 = phi %struct.one_result* [ %3287, %bb1.i.i900 ], [ %results.112, %bb5.i898 ] ; <%struct.one_result*> [#uses=2]
  %3291 = getelementptr inbounds %struct.one_result* %3290, i32 114, i32 0 ; <double*> [#uses=1]
  store double %3281, double* %3291, align 4
  %3292 = getelementptr inbounds %struct.one_result* %3290, i32 114, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str126, i32 0, i32 0), i8** %3292, align 4
  %3293 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i872, label %bb5.i883

bb.nph6.i872:                                     ; preds = %_Z14test_variable4Ix33custom_multiply_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3294 = mul i64 %3099, %3098                    ; <i64> [#uses=1]
  %3295 = mul i64 %3294, %3100                    ; <i64> [#uses=1]
  %3296 = mul i64 %3295, %3102                    ; <i64> [#uses=2]
  %3297 = add nsw i64 %3096, %3296                ; <i64> [#uses=1]
  %3298 = mul i64 %3297, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i875

bb2.preheader.us.i875:                            ; preds = %_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i872
  %i.05.us.i873 = phi i32 [ 0, %bb.nph6.i872 ], [ %tmp.i874, %_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i874 = add i32 %i.05.us.i873, 1            ; <i32> [#uses=2]
  br label %bb1.us.i881

_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i882, %bb.i1.us.i876
  %3299 = icmp slt i32 %tmp.i874, %iterations.0   ; <i1> [#uses=1]
  br i1 %3299, label %bb2.preheader.us.i875, label %bb5.i883

bb.i1.us.i876:                                    ; preds = %bb2.bb3_crit_edge.us.i882
  %3300 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 115) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i881:                                      ; preds = %bb1.us.i881, %bb2.preheader.us.i875
  %result.03.us.i877 = phi i64 [ 0, %bb2.preheader.us.i875 ], [ %3303, %bb1.us.i881 ] ; <i64> [#uses=1]
  %n.02.us.i878 = phi i32 [ 0, %bb2.preheader.us.i875 ], [ %3304, %bb1.us.i881 ] ; <i32> [#uses=2]
  %scevgep.i879 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i878 ; <i64*> [#uses=1]
  %3301 = load i64* %scevgep.i879, align 8        ; <i64> [#uses=1]
  %3302 = add nsw i64 %result.03.us.i877, %3296   ; <i64> [#uses=1]
  %3303 = add nsw i64 %3302, %3301                ; <i64> [#uses=2]
  %3304 = add nsw i32 %n.02.us.i878, 1            ; <i32> [#uses=2]
  %exitcond.i880 = icmp eq i32 %3304, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i880, label %bb2.bb3_crit_edge.us.i882, label %bb1.us.i881

bb2.bb3_crit_edge.us.i882:                        ; preds = %bb1.us.i881
  %3305 = icmp eq i64 %3298, %3303                ; <i1> [#uses=1]
  br i1 %3305, label %_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i876

bb5.i883:                                         ; preds = %_Z26check_shifted_variable_sumIx34custom_multiply_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ix33custom_multiply_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3306 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3307 = sub i32 %3306, %3293                    ; <i32> [#uses=1]
  %3308 = sitofp i32 %3307 to double              ; <double> [#uses=1]
  %3309 = fdiv double %3308, 1.000000e+06         ; <double> [#uses=1]
  %.not2954 = icmp ne %struct.one_result* %results.113, null ; <i1> [#uses=1]
  %3310 = icmp sgt i32 %allocated_results.113, 115 ; <i1> [#uses=1]
  %or.cond2955 = and i1 %3310, %.not2954          ; <i1> [#uses=1]
  br i1 %or.cond2955, label %_Z14test_variable4Ix34custom_multiply_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i885

bb1.i.i885:                                       ; preds = %bb5.i883
  %3311 = add nsw i32 %allocated_results.113, 10  ; <i32> [#uses=3]
  %3312 = mul i32 %3311, 12                       ; <i32> [#uses=1]
  %3313 = bitcast %struct.one_result* %results.113 to i8* ; <i8*> [#uses=1]
  %3314 = tail call i8* @realloc(i8* %3313, i32 %3312) nounwind ; <i8*> [#uses=2]
  %3315 = bitcast i8* %3314 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3316 = icmp eq i8* %3314, null                 ; <i1> [#uses=1]
  br i1 %3316, label %bb2.i.i886, label %_Z14test_variable4Ix34custom_multiply_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i886:                                       ; preds = %bb1.i.i885
  %3317 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3311) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix34custom_multiply_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i885, %bb5.i883
  %results.114 = phi %struct.one_result* [ %3315, %bb1.i.i885 ], [ %results.113, %bb5.i883 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.114 = phi i32 [ %3311, %bb1.i.i885 ], [ %allocated_results.113, %bb5.i883 ] ; <i32> [#uses=3]
  %3318 = phi %struct.one_result* [ %3315, %bb1.i.i885 ], [ %results.113, %bb5.i883 ] ; <%struct.one_result*> [#uses=2]
  %3319 = getelementptr inbounds %struct.one_result* %3318, i32 115, i32 0 ; <double*> [#uses=1]
  store double %3309, double* %3319, align 4
  %3320 = getelementptr inbounds %struct.one_result* %3318, i32 115, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str127, i32 0, i32 0), i8** %3320, align 4
  %3321 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i857, label %bb5.i868

bb.nph6.i857:                                     ; preds = %_Z14test_variable4Ix34custom_multiply_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3322 = sdiv i64 %3096, %3098                   ; <i64> [#uses=1]
  %3323 = mul i64 %3322, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i860

bb2.preheader.us.i860:                            ; preds = %_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i, %bb.nph6.i857
  %i.05.us.i858 = phi i32 [ 0, %bb.nph6.i857 ], [ %tmp.i859, %_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i859 = add i32 %i.05.us.i858, 1            ; <i32> [#uses=2]
  br label %bb1.us.i866

_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i867, %bb.i1.us.i861
  %3324 = icmp slt i32 %tmp.i859, %iterations.0   ; <i1> [#uses=1]
  br i1 %3324, label %bb2.preheader.us.i860, label %bb5.i868

bb.i1.us.i861:                                    ; preds = %bb2.bb3_crit_edge.us.i867
  %3325 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 116) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i

bb1.us.i866:                                      ; preds = %bb1.us.i866, %bb2.preheader.us.i860
  %result.03.us.i862 = phi i64 [ 0, %bb2.preheader.us.i860 ], [ %3328, %bb1.us.i866 ] ; <i64> [#uses=1]
  %n.02.us.i863 = phi i32 [ 0, %bb2.preheader.us.i860 ], [ %3329, %bb1.us.i866 ] ; <i32> [#uses=2]
  %scevgep.i864 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i863 ; <i64*> [#uses=1]
  %3326 = load i64* %scevgep.i864, align 8        ; <i64> [#uses=1]
  %3327 = sdiv i64 %3326, %3098                   ; <i64> [#uses=1]
  %3328 = add nsw i64 %3327, %result.03.us.i862   ; <i64> [#uses=2]
  %3329 = add nsw i32 %n.02.us.i863, 1            ; <i32> [#uses=2]
  %exitcond.i865 = icmp eq i32 %3329, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i865, label %bb2.bb3_crit_edge.us.i867, label %bb1.us.i866

bb2.bb3_crit_edge.us.i867:                        ; preds = %bb1.us.i866
  %3330 = icmp eq i64 %3323, %3328                ; <i1> [#uses=1]
  br i1 %3330, label %_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i, label %bb.i1.us.i861

bb5.i868:                                         ; preds = %_Z26check_shifted_variable_sumIx22custom_divide_variableIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix34custom_multiply_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3331 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3332 = sub i32 %3331, %3321                    ; <i32> [#uses=1]
  %3333 = sitofp i32 %3332 to double              ; <double> [#uses=1]
  %3334 = fdiv double %3333, 1.000000e+06         ; <double> [#uses=1]
  %.not2956 = icmp ne %struct.one_result* %results.114, null ; <i1> [#uses=1]
  %3335 = icmp sgt i32 %allocated_results.114, 116 ; <i1> [#uses=1]
  %or.cond2957 = and i1 %3335, %.not2956          ; <i1> [#uses=1]
  br i1 %or.cond2957, label %_Z14test_variable1Ix22custom_divide_variableIxEEvPT_iS2_PKc.exit, label %bb1.i.i870

bb1.i.i870:                                       ; preds = %bb5.i868
  %3336 = add nsw i32 %allocated_results.114, 10  ; <i32> [#uses=3]
  %3337 = mul i32 %3336, 12                       ; <i32> [#uses=1]
  %3338 = bitcast %struct.one_result* %results.114 to i8* ; <i8*> [#uses=1]
  %3339 = tail call i8* @realloc(i8* %3338, i32 %3337) nounwind ; <i8*> [#uses=2]
  %3340 = bitcast i8* %3339 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3341 = icmp eq i8* %3339, null                 ; <i1> [#uses=1]
  br i1 %3341, label %bb2.i.i871, label %_Z14test_variable1Ix22custom_divide_variableIxEEvPT_iS2_PKc.exit

bb2.i.i871:                                       ; preds = %bb1.i.i870
  %3342 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3336) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix22custom_divide_variableIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i870, %bb5.i868
  %results.115 = phi %struct.one_result* [ %3340, %bb1.i.i870 ], [ %results.114, %bb5.i868 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.115 = phi i32 [ %3336, %bb1.i.i870 ], [ %allocated_results.114, %bb5.i868 ] ; <i32> [#uses=3]
  %3343 = phi %struct.one_result* [ %3340, %bb1.i.i870 ], [ %results.114, %bb5.i868 ] ; <%struct.one_result*> [#uses=2]
  %3344 = getelementptr inbounds %struct.one_result* %3343, i32 116, i32 0 ; <double*> [#uses=1]
  store double %3334, double* %3344, align 4
  %3345 = getelementptr inbounds %struct.one_result* %3343, i32 116, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str128, i32 0, i32 0), i8** %3345, align 4
  %3346 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i842, label %bb5.i853

bb.nph6.i842:                                     ; preds = %_Z14test_variable1Ix22custom_divide_variableIxEEvPT_iS2_PKc.exit
  %3347 = sdiv i64 %3096, %3098                   ; <i64> [#uses=1]
  %3348 = sdiv i64 %3347, %3099                   ; <i64> [#uses=1]
  %3349 = sdiv i64 %3348, %3100                   ; <i64> [#uses=1]
  %3350 = sdiv i64 %3349, %3102                   ; <i64> [#uses=1]
  %3351 = mul i64 %3350, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i845

bb2.preheader.us.i845:                            ; preds = %_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i842
  %i.05.us.i843 = phi i32 [ 0, %bb.nph6.i842 ], [ %tmp.i844, %_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i844 = add i32 %i.05.us.i843, 1            ; <i32> [#uses=2]
  br label %bb1.us.i851

_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i852, %bb.i1.us.i846
  %3352 = icmp slt i32 %tmp.i844, %iterations.0   ; <i1> [#uses=1]
  br i1 %3352, label %bb2.preheader.us.i845, label %bb5.i853

bb.i1.us.i846:                                    ; preds = %bb2.bb3_crit_edge.us.i852
  %3353 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 117) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i851:                                      ; preds = %bb1.us.i851, %bb2.preheader.us.i845
  %result.03.us.i847 = phi i64 [ 0, %bb2.preheader.us.i845 ], [ %3359, %bb1.us.i851 ] ; <i64> [#uses=1]
  %n.02.us.i848 = phi i32 [ 0, %bb2.preheader.us.i845 ], [ %3360, %bb1.us.i851 ] ; <i32> [#uses=2]
  %scevgep.i849 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i848 ; <i64*> [#uses=1]
  %3354 = load i64* %scevgep.i849, align 8        ; <i64> [#uses=1]
  %3355 = sdiv i64 %3354, %3098                   ; <i64> [#uses=1]
  %3356 = sdiv i64 %3355, %3099                   ; <i64> [#uses=1]
  %3357 = sdiv i64 %3356, %3100                   ; <i64> [#uses=1]
  %3358 = sdiv i64 %3357, %3102                   ; <i64> [#uses=1]
  %3359 = add nsw i64 %3358, %result.03.us.i847   ; <i64> [#uses=2]
  %3360 = add nsw i32 %n.02.us.i848, 1            ; <i32> [#uses=2]
  %exitcond.i850 = icmp eq i32 %3360, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i850, label %bb2.bb3_crit_edge.us.i852, label %bb1.us.i851

bb2.bb3_crit_edge.us.i852:                        ; preds = %bb1.us.i851
  %3361 = icmp eq i64 %3351, %3359                ; <i1> [#uses=1]
  br i1 %3361, label %_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i846

bb5.i853:                                         ; preds = %_Z26check_shifted_variable_sumIx31custom_divide_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix22custom_divide_variableIxEEvPT_iS2_PKc.exit
  %3362 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3363 = sub i32 %3362, %3346                    ; <i32> [#uses=1]
  %3364 = sitofp i32 %3363 to double              ; <double> [#uses=1]
  %3365 = fdiv double %3364, 1.000000e+06         ; <double> [#uses=1]
  %.not2958 = icmp ne %struct.one_result* %results.115, null ; <i1> [#uses=1]
  %3366 = icmp sgt i32 %allocated_results.115, 117 ; <i1> [#uses=1]
  %or.cond2959 = and i1 %3366, %.not2958          ; <i1> [#uses=1]
  br i1 %or.cond2959, label %_Z14test_variable4Ix31custom_divide_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i855

bb1.i.i855:                                       ; preds = %bb5.i853
  %3367 = add nsw i32 %allocated_results.115, 10  ; <i32> [#uses=3]
  %3368 = mul i32 %3367, 12                       ; <i32> [#uses=1]
  %3369 = bitcast %struct.one_result* %results.115 to i8* ; <i8*> [#uses=1]
  %3370 = tail call i8* @realloc(i8* %3369, i32 %3368) nounwind ; <i8*> [#uses=2]
  %3371 = bitcast i8* %3370 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3372 = icmp eq i8* %3370, null                 ; <i1> [#uses=1]
  br i1 %3372, label %bb2.i.i856, label %_Z14test_variable4Ix31custom_divide_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i856:                                       ; preds = %bb1.i.i855
  %3373 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3367) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix31custom_divide_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i855, %bb5.i853
  %results.116 = phi %struct.one_result* [ %3371, %bb1.i.i855 ], [ %results.115, %bb5.i853 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.116 = phi i32 [ %3367, %bb1.i.i855 ], [ %allocated_results.115, %bb5.i853 ] ; <i32> [#uses=3]
  %3374 = phi %struct.one_result* [ %3371, %bb1.i.i855 ], [ %results.115, %bb5.i853 ] ; <%struct.one_result*> [#uses=2]
  %3375 = getelementptr inbounds %struct.one_result* %3374, i32 117, i32 0 ; <double*> [#uses=1]
  store double %3365, double* %3375, align 4
  %3376 = getelementptr inbounds %struct.one_result* %3374, i32 117, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str129, i32 0, i32 0), i8** %3376, align 4
  %3377 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i827, label %bb5.i838

bb.nph6.i827:                                     ; preds = %_Z14test_variable4Ix31custom_divide_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3378 = sdiv i64 %3098, %3099                   ; <i64> [#uses=1]
  %3379 = sdiv i64 %3378, %3100                   ; <i64> [#uses=1]
  %3380 = sdiv i64 %3379, %3102                   ; <i64> [#uses=2]
  %3381 = add nsw i64 %3380, %3096                ; <i64> [#uses=1]
  %3382 = mul i64 %3381, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i830

bb2.preheader.us.i830:                            ; preds = %_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i827
  %i.05.us.i828 = phi i32 [ 0, %bb.nph6.i827 ], [ %tmp.i829, %_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i829 = add i32 %i.05.us.i828, 1            ; <i32> [#uses=2]
  br label %bb1.us.i836

_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i837, %bb.i1.us.i831
  %3383 = icmp slt i32 %tmp.i829, %iterations.0   ; <i1> [#uses=1]
  br i1 %3383, label %bb2.preheader.us.i830, label %bb5.i838

bb.i1.us.i831:                                    ; preds = %bb2.bb3_crit_edge.us.i837
  %3384 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 118) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i836:                                      ; preds = %bb1.us.i836, %bb2.preheader.us.i830
  %result.03.us.i832 = phi i64 [ 0, %bb2.preheader.us.i830 ], [ %3387, %bb1.us.i836 ] ; <i64> [#uses=1]
  %n.02.us.i833 = phi i32 [ 0, %bb2.preheader.us.i830 ], [ %3388, %bb1.us.i836 ] ; <i32> [#uses=2]
  %scevgep.i834 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i833 ; <i64*> [#uses=1]
  %3385 = load i64* %scevgep.i834, align 8        ; <i64> [#uses=1]
  %3386 = add nsw i64 %3385, %result.03.us.i832   ; <i64> [#uses=1]
  %3387 = add nsw i64 %3386, %3380                ; <i64> [#uses=2]
  %3388 = add nsw i32 %n.02.us.i833, 1            ; <i32> [#uses=2]
  %exitcond.i835 = icmp eq i32 %3388, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i835, label %bb2.bb3_crit_edge.us.i837, label %bb1.us.i836

bb2.bb3_crit_edge.us.i837:                        ; preds = %bb1.us.i836
  %3389 = icmp eq i64 %3382, %3387                ; <i1> [#uses=1]
  br i1 %3389, label %_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i831

bb5.i838:                                         ; preds = %_Z26check_shifted_variable_sumIx32custom_divide_multiple_variable2IxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ix31custom_divide_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3390 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3391 = sub i32 %3390, %3377                    ; <i32> [#uses=1]
  %3392 = sitofp i32 %3391 to double              ; <double> [#uses=1]
  %3393 = fdiv double %3392, 1.000000e+06         ; <double> [#uses=1]
  %.not2960 = icmp ne %struct.one_result* %results.116, null ; <i1> [#uses=1]
  %3394 = icmp sgt i32 %allocated_results.116, 118 ; <i1> [#uses=1]
  %or.cond2961 = and i1 %3394, %.not2960          ; <i1> [#uses=1]
  br i1 %or.cond2961, label %_Z14test_variable4Ix32custom_divide_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i840

bb1.i.i840:                                       ; preds = %bb5.i838
  %3395 = add nsw i32 %allocated_results.116, 10  ; <i32> [#uses=3]
  %3396 = mul i32 %3395, 12                       ; <i32> [#uses=1]
  %3397 = bitcast %struct.one_result* %results.116 to i8* ; <i8*> [#uses=1]
  %3398 = tail call i8* @realloc(i8* %3397, i32 %3396) nounwind ; <i8*> [#uses=2]
  %3399 = bitcast i8* %3398 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3400 = icmp eq i8* %3398, null                 ; <i1> [#uses=1]
  br i1 %3400, label %bb2.i.i841, label %_Z14test_variable4Ix32custom_divide_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i841:                                       ; preds = %bb1.i.i840
  %3401 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3395) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix32custom_divide_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i840, %bb5.i838
  %results.117 = phi %struct.one_result* [ %3399, %bb1.i.i840 ], [ %results.116, %bb5.i838 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.117 = phi i32 [ %3395, %bb1.i.i840 ], [ %allocated_results.116, %bb5.i838 ] ; <i32> [#uses=3]
  %3402 = phi %struct.one_result* [ %3399, %bb1.i.i840 ], [ %results.116, %bb5.i838 ] ; <%struct.one_result*> [#uses=2]
  %3403 = getelementptr inbounds %struct.one_result* %3402, i32 118, i32 0 ; <double*> [#uses=1]
  store double %3393, double* %3403, align 4
  %3404 = getelementptr inbounds %struct.one_result* %3402, i32 118, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str130, i32 0, i32 0), i8** %3404, align 4
  %3405 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i812, label %bb5.i823

bb.nph7.i812:                                     ; preds = %_Z14test_variable4Ix32custom_divide_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3406 = mul i64 %3100, %3099                    ; <i64> [#uses=1]
  %3407 = sdiv i64 %3406, %3102                   ; <i64> [#uses=2]
  %3408 = add i64 %3096, %3098                    ; <i64> [#uses=1]
  %3409 = sub i64 %3408, %3407                    ; <i64> [#uses=1]
  %3410 = mul i64 %3409, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i815

bb2.preheader.us.i815:                            ; preds = %_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i812
  %i.06.us.i813 = phi i32 [ 0, %bb.nph7.i812 ], [ %tmp.i814, %_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i814 = add i32 %i.06.us.i813, 1            ; <i32> [#uses=2]
  br label %bb1.us.i821

_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i822, %bb.i1.us.i816
  %3411 = icmp slt i32 %tmp.i814, %iterations.0   ; <i1> [#uses=1]
  br i1 %3411, label %bb2.preheader.us.i815, label %bb5.i823

bb.i1.us.i816:                                    ; preds = %bb2.bb3_crit_edge.us.i822
  %3412 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 119) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i821:                                      ; preds = %bb1.us.i821, %bb2.preheader.us.i815
  %result.04.us.i817 = phi i64 [ 0, %bb2.preheader.us.i815 ], [ %3416, %bb1.us.i821 ] ; <i64> [#uses=1]
  %n.03.us.i818 = phi i32 [ 0, %bb2.preheader.us.i815 ], [ %3417, %bb1.us.i821 ] ; <i32> [#uses=2]
  %scevgep.i819 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.03.us.i818 ; <i64*> [#uses=1]
  %3413 = load i64* %scevgep.i819, align 8        ; <i64> [#uses=1]
  %3414 = add nsw i64 %result.04.us.i817, %3098   ; <i64> [#uses=1]
  %3415 = add i64 %3414, %3413                    ; <i64> [#uses=1]
  %3416 = sub i64 %3415, %3407                    ; <i64> [#uses=2]
  %3417 = add nsw i32 %n.03.us.i818, 1            ; <i32> [#uses=2]
  %exitcond.i820 = icmp eq i32 %3417, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i820, label %bb2.bb3_crit_edge.us.i822, label %bb1.us.i821

bb2.bb3_crit_edge.us.i822:                        ; preds = %bb1.us.i821
  %3418 = icmp eq i64 %3410, %3416                ; <i1> [#uses=1]
  br i1 %3418, label %_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i816

bb5.i823:                                         ; preds = %_Z26check_shifted_variable_sumIx30custom_mixed_multiple_variableIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Ix32custom_divide_multiple_variable2IxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3419 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3420 = sub i32 %3419, %3405                    ; <i32> [#uses=1]
  %3421 = sitofp i32 %3420 to double              ; <double> [#uses=1]
  %3422 = fdiv double %3421, 1.000000e+06         ; <double> [#uses=1]
  %.not2962 = icmp ne %struct.one_result* %results.117, null ; <i1> [#uses=1]
  %3423 = icmp sgt i32 %allocated_results.117, 119 ; <i1> [#uses=1]
  %or.cond2963 = and i1 %3423, %.not2962          ; <i1> [#uses=1]
  br i1 %or.cond2963, label %_Z14test_variable4Ix30custom_mixed_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i825

bb1.i.i825:                                       ; preds = %bb5.i823
  %3424 = add nsw i32 %allocated_results.117, 10  ; <i32> [#uses=3]
  %3425 = mul i32 %3424, 12                       ; <i32> [#uses=1]
  %3426 = bitcast %struct.one_result* %results.117 to i8* ; <i8*> [#uses=1]
  %3427 = tail call i8* @realloc(i8* %3426, i32 %3425) nounwind ; <i8*> [#uses=2]
  %3428 = bitcast i8* %3427 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3429 = icmp eq i8* %3427, null                 ; <i1> [#uses=1]
  br i1 %3429, label %bb2.i.i826, label %_Z14test_variable4Ix30custom_mixed_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i826:                                       ; preds = %bb1.i.i825
  %3430 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3424) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix30custom_mixed_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i825, %bb5.i823
  %results.118 = phi %struct.one_result* [ %3428, %bb1.i.i825 ], [ %results.117, %bb5.i823 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.118 = phi i32 [ %3424, %bb1.i.i825 ], [ %allocated_results.117, %bb5.i823 ] ; <i32> [#uses=3]
  %3431 = phi %struct.one_result* [ %3428, %bb1.i.i825 ], [ %results.117, %bb5.i823 ] ; <%struct.one_result*> [#uses=2]
  %3432 = getelementptr inbounds %struct.one_result* %3431, i32 119, i32 0 ; <double*> [#uses=1]
  store double %3422, double* %3432, align 4
  %3433 = getelementptr inbounds %struct.one_result* %3431, i32 119, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str131, i32 0, i32 0), i8** %3433, align 4
  %3434 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i797, label %bb5.i808

bb.nph6.i797:                                     ; preds = %_Z14test_variable4Ix30custom_mixed_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3435 = and i64 %3096, %3098                    ; <i64> [#uses=1]
  %3436 = mul i64 %3435, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i800

bb2.preheader.us.i800:                            ; preds = %_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i, %bb.nph6.i797
  %i.05.us.i798 = phi i32 [ 0, %bb.nph6.i797 ], [ %tmp.i799, %_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i799 = add i32 %i.05.us.i798, 1            ; <i32> [#uses=2]
  br label %bb1.us.i806

_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i807, %bb.i1.us.i801
  %3437 = icmp slt i32 %tmp.i799, %iterations.0   ; <i1> [#uses=1]
  br i1 %3437, label %bb2.preheader.us.i800, label %bb5.i808

bb.i1.us.i801:                                    ; preds = %bb2.bb3_crit_edge.us.i807
  %3438 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 120) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i

bb1.us.i806:                                      ; preds = %bb1.us.i806, %bb2.preheader.us.i800
  %result.03.us.i802 = phi i64 [ 0, %bb2.preheader.us.i800 ], [ %3441, %bb1.us.i806 ] ; <i64> [#uses=1]
  %n.02.us.i803 = phi i32 [ 0, %bb2.preheader.us.i800 ], [ %3442, %bb1.us.i806 ] ; <i32> [#uses=2]
  %scevgep.i804 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i803 ; <i64*> [#uses=1]
  %3439 = load i64* %scevgep.i804, align 8        ; <i64> [#uses=1]
  %3440 = and i64 %3439, %3098                    ; <i64> [#uses=1]
  %3441 = add nsw i64 %3440, %result.03.us.i802   ; <i64> [#uses=2]
  %3442 = add nsw i32 %n.02.us.i803, 1            ; <i32> [#uses=2]
  %exitcond.i805 = icmp eq i32 %3442, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i805, label %bb2.bb3_crit_edge.us.i807, label %bb1.us.i806

bb2.bb3_crit_edge.us.i807:                        ; preds = %bb1.us.i806
  %3443 = icmp eq i64 %3436, %3441                ; <i1> [#uses=1]
  br i1 %3443, label %_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i, label %bb.i1.us.i801

bb5.i808:                                         ; preds = %_Z26check_shifted_variable_sumIx19custom_variable_andIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix30custom_mixed_multiple_variableIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3444 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3445 = sub i32 %3444, %3434                    ; <i32> [#uses=1]
  %3446 = sitofp i32 %3445 to double              ; <double> [#uses=1]
  %3447 = fdiv double %3446, 1.000000e+06         ; <double> [#uses=1]
  %.not2964 = icmp ne %struct.one_result* %results.118, null ; <i1> [#uses=1]
  %3448 = icmp sgt i32 %allocated_results.118, 120 ; <i1> [#uses=1]
  %or.cond2965 = and i1 %3448, %.not2964          ; <i1> [#uses=1]
  br i1 %or.cond2965, label %_Z14test_variable1Ix19custom_variable_andIxEEvPT_iS2_PKc.exit, label %bb1.i.i810

bb1.i.i810:                                       ; preds = %bb5.i808
  %3449 = add nsw i32 %allocated_results.118, 10  ; <i32> [#uses=3]
  %3450 = mul i32 %3449, 12                       ; <i32> [#uses=1]
  %3451 = bitcast %struct.one_result* %results.118 to i8* ; <i8*> [#uses=1]
  %3452 = tail call i8* @realloc(i8* %3451, i32 %3450) nounwind ; <i8*> [#uses=2]
  %3453 = bitcast i8* %3452 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3454 = icmp eq i8* %3452, null                 ; <i1> [#uses=1]
  br i1 %3454, label %bb2.i.i811, label %_Z14test_variable1Ix19custom_variable_andIxEEvPT_iS2_PKc.exit

bb2.i.i811:                                       ; preds = %bb1.i.i810
  %3455 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3449) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix19custom_variable_andIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i810, %bb5.i808
  %results.119 = phi %struct.one_result* [ %3453, %bb1.i.i810 ], [ %results.118, %bb5.i808 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.119 = phi i32 [ %3449, %bb1.i.i810 ], [ %allocated_results.118, %bb5.i808 ] ; <i32> [#uses=3]
  %3456 = phi %struct.one_result* [ %3453, %bb1.i.i810 ], [ %results.118, %bb5.i808 ] ; <%struct.one_result*> [#uses=2]
  %3457 = getelementptr inbounds %struct.one_result* %3456, i32 120, i32 0 ; <double*> [#uses=1]
  store double %3447, double* %3457, align 4
  %3458 = getelementptr inbounds %struct.one_result* %3456, i32 120, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str132, i32 0, i32 0), i8** %3458, align 4
  %3459 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i782, label %bb5.i793

bb.nph6.i782:                                     ; preds = %_Z14test_variable1Ix19custom_variable_andIxEEvPT_iS2_PKc.exit
  %3460 = and i64 %3099, %3098                    ; <i64> [#uses=1]
  %3461 = and i64 %3460, %3100                    ; <i64> [#uses=1]
  %3462 = and i64 %3461, %3102                    ; <i64> [#uses=2]
  %3463 = and i64 %3462, %3096                    ; <i64> [#uses=1]
  %3464 = mul i64 %3463, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i785

bb2.preheader.us.i785:                            ; preds = %_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i782
  %i.05.us.i783 = phi i32 [ 0, %bb.nph6.i782 ], [ %tmp.i784, %_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i784 = add i32 %i.05.us.i783, 1            ; <i32> [#uses=2]
  br label %bb1.us.i791

_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i792, %bb.i1.us.i786
  %3465 = icmp slt i32 %tmp.i784, %iterations.0   ; <i1> [#uses=1]
  br i1 %3465, label %bb2.preheader.us.i785, label %bb5.i793

bb.i1.us.i786:                                    ; preds = %bb2.bb3_crit_edge.us.i792
  %3466 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 121) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i791:                                      ; preds = %bb1.us.i791, %bb2.preheader.us.i785
  %result.03.us.i787 = phi i64 [ 0, %bb2.preheader.us.i785 ], [ %3469, %bb1.us.i791 ] ; <i64> [#uses=1]
  %n.02.us.i788 = phi i32 [ 0, %bb2.preheader.us.i785 ], [ %3470, %bb1.us.i791 ] ; <i32> [#uses=2]
  %scevgep.i789 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i788 ; <i64*> [#uses=1]
  %3467 = load i64* %scevgep.i789, align 8        ; <i64> [#uses=1]
  %3468 = and i64 %3462, %3467                    ; <i64> [#uses=1]
  %3469 = add nsw i64 %3468, %result.03.us.i787   ; <i64> [#uses=2]
  %3470 = add nsw i32 %n.02.us.i788, 1            ; <i32> [#uses=2]
  %exitcond.i790 = icmp eq i32 %3470, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i790, label %bb2.bb3_crit_edge.us.i792, label %bb1.us.i791

bb2.bb3_crit_edge.us.i792:                        ; preds = %bb1.us.i791
  %3471 = icmp eq i64 %3464, %3469                ; <i1> [#uses=1]
  br i1 %3471, label %_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i786

bb5.i793:                                         ; preds = %_Z26check_shifted_variable_sumIx28custom_multiple_variable_andIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix19custom_variable_andIxEEvPT_iS2_PKc.exit
  %3472 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3473 = sub i32 %3472, %3459                    ; <i32> [#uses=1]
  %3474 = sitofp i32 %3473 to double              ; <double> [#uses=1]
  %3475 = fdiv double %3474, 1.000000e+06         ; <double> [#uses=1]
  %.not2966 = icmp ne %struct.one_result* %results.119, null ; <i1> [#uses=1]
  %3476 = icmp sgt i32 %allocated_results.119, 121 ; <i1> [#uses=1]
  %or.cond2967 = and i1 %3476, %.not2966          ; <i1> [#uses=1]
  br i1 %or.cond2967, label %_Z14test_variable4Ix28custom_multiple_variable_andIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i795

bb1.i.i795:                                       ; preds = %bb5.i793
  %3477 = add nsw i32 %allocated_results.119, 10  ; <i32> [#uses=3]
  %3478 = mul i32 %3477, 12                       ; <i32> [#uses=1]
  %3479 = bitcast %struct.one_result* %results.119 to i8* ; <i8*> [#uses=1]
  %3480 = tail call i8* @realloc(i8* %3479, i32 %3478) nounwind ; <i8*> [#uses=2]
  %3481 = bitcast i8* %3480 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3482 = icmp eq i8* %3480, null                 ; <i1> [#uses=1]
  br i1 %3482, label %bb2.i.i796, label %_Z14test_variable4Ix28custom_multiple_variable_andIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i796:                                       ; preds = %bb1.i.i795
  %3483 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3477) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix28custom_multiple_variable_andIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i795, %bb5.i793
  %results.120 = phi %struct.one_result* [ %3481, %bb1.i.i795 ], [ %results.119, %bb5.i793 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.120 = phi i32 [ %3477, %bb1.i.i795 ], [ %allocated_results.119, %bb5.i793 ] ; <i32> [#uses=3]
  %3484 = phi %struct.one_result* [ %3481, %bb1.i.i795 ], [ %results.119, %bb5.i793 ] ; <%struct.one_result*> [#uses=2]
  %3485 = getelementptr inbounds %struct.one_result* %3484, i32 121, i32 0 ; <double*> [#uses=1]
  store double %3475, double* %3485, align 4
  %3486 = getelementptr inbounds %struct.one_result* %3484, i32 121, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str133, i32 0, i32 0), i8** %3486, align 4
  %3487 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i767, label %bb5.i778

bb.nph6.i767:                                     ; preds = %_Z14test_variable4Ix28custom_multiple_variable_andIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3488 = or i64 %3096, %3098                     ; <i64> [#uses=1]
  %3489 = mul i64 %3488, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i770

bb2.preheader.us.i770:                            ; preds = %_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i, %bb.nph6.i767
  %i.05.us.i768 = phi i32 [ 0, %bb.nph6.i767 ], [ %tmp.i769, %_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i769 = add i32 %i.05.us.i768, 1            ; <i32> [#uses=2]
  br label %bb1.us.i776

_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i777, %bb.i1.us.i771
  %3490 = icmp slt i32 %tmp.i769, %iterations.0   ; <i1> [#uses=1]
  br i1 %3490, label %bb2.preheader.us.i770, label %bb5.i778

bb.i1.us.i771:                                    ; preds = %bb2.bb3_crit_edge.us.i777
  %3491 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 122) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i

bb1.us.i776:                                      ; preds = %bb1.us.i776, %bb2.preheader.us.i770
  %result.03.us.i772 = phi i64 [ 0, %bb2.preheader.us.i770 ], [ %3494, %bb1.us.i776 ] ; <i64> [#uses=1]
  %n.02.us.i773 = phi i32 [ 0, %bb2.preheader.us.i770 ], [ %3495, %bb1.us.i776 ] ; <i32> [#uses=2]
  %scevgep.i774 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i773 ; <i64*> [#uses=1]
  %3492 = load i64* %scevgep.i774, align 8        ; <i64> [#uses=1]
  %3493 = or i64 %3492, %3098                     ; <i64> [#uses=1]
  %3494 = add nsw i64 %3493, %result.03.us.i772   ; <i64> [#uses=2]
  %3495 = add nsw i32 %n.02.us.i773, 1            ; <i32> [#uses=2]
  %exitcond.i775 = icmp eq i32 %3495, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i775, label %bb2.bb3_crit_edge.us.i777, label %bb1.us.i776

bb2.bb3_crit_edge.us.i777:                        ; preds = %bb1.us.i776
  %3496 = icmp eq i64 %3489, %3494                ; <i1> [#uses=1]
  br i1 %3496, label %_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i, label %bb.i1.us.i771

bb5.i778:                                         ; preds = %_Z26check_shifted_variable_sumIx18custom_variable_orIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix28custom_multiple_variable_andIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3497 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3498 = sub i32 %3497, %3487                    ; <i32> [#uses=1]
  %3499 = sitofp i32 %3498 to double              ; <double> [#uses=1]
  %3500 = fdiv double %3499, 1.000000e+06         ; <double> [#uses=1]
  %.not2968 = icmp ne %struct.one_result* %results.120, null ; <i1> [#uses=1]
  %3501 = icmp sgt i32 %allocated_results.120, 122 ; <i1> [#uses=1]
  %or.cond2969 = and i1 %3501, %.not2968          ; <i1> [#uses=1]
  br i1 %or.cond2969, label %_Z14test_variable1Ix18custom_variable_orIxEEvPT_iS2_PKc.exit, label %bb1.i.i780

bb1.i.i780:                                       ; preds = %bb5.i778
  %3502 = add nsw i32 %allocated_results.120, 10  ; <i32> [#uses=3]
  %3503 = mul i32 %3502, 12                       ; <i32> [#uses=1]
  %3504 = bitcast %struct.one_result* %results.120 to i8* ; <i8*> [#uses=1]
  %3505 = tail call i8* @realloc(i8* %3504, i32 %3503) nounwind ; <i8*> [#uses=2]
  %3506 = bitcast i8* %3505 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3507 = icmp eq i8* %3505, null                 ; <i1> [#uses=1]
  br i1 %3507, label %bb2.i.i781, label %_Z14test_variable1Ix18custom_variable_orIxEEvPT_iS2_PKc.exit

bb2.i.i781:                                       ; preds = %bb1.i.i780
  %3508 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3502) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix18custom_variable_orIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i780, %bb5.i778
  %results.121 = phi %struct.one_result* [ %3506, %bb1.i.i780 ], [ %results.120, %bb5.i778 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.121 = phi i32 [ %3502, %bb1.i.i780 ], [ %allocated_results.120, %bb5.i778 ] ; <i32> [#uses=3]
  %3509 = phi %struct.one_result* [ %3506, %bb1.i.i780 ], [ %results.120, %bb5.i778 ] ; <%struct.one_result*> [#uses=2]
  %3510 = getelementptr inbounds %struct.one_result* %3509, i32 122, i32 0 ; <double*> [#uses=1]
  store double %3500, double* %3510, align 4
  %3511 = getelementptr inbounds %struct.one_result* %3509, i32 122, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str134, i32 0, i32 0), i8** %3511, align 4
  %3512 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i752, label %bb5.i763

bb.nph6.i752:                                     ; preds = %_Z14test_variable1Ix18custom_variable_orIxEEvPT_iS2_PKc.exit
  %3513 = or i64 %3099, %3098                     ; <i64> [#uses=1]
  %3514 = or i64 %3513, %3100                     ; <i64> [#uses=1]
  %3515 = or i64 %3514, %3102                     ; <i64> [#uses=2]
  %3516 = or i64 %3515, %3096                     ; <i64> [#uses=1]
  %3517 = mul i64 %3516, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i755

bb2.preheader.us.i755:                            ; preds = %_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i752
  %i.05.us.i753 = phi i32 [ 0, %bb.nph6.i752 ], [ %tmp.i754, %_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i754 = add i32 %i.05.us.i753, 1            ; <i32> [#uses=2]
  br label %bb1.us.i761

_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i762, %bb.i1.us.i756
  %3518 = icmp slt i32 %tmp.i754, %iterations.0   ; <i1> [#uses=1]
  br i1 %3518, label %bb2.preheader.us.i755, label %bb5.i763

bb.i1.us.i756:                                    ; preds = %bb2.bb3_crit_edge.us.i762
  %3519 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 123) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i761:                                      ; preds = %bb1.us.i761, %bb2.preheader.us.i755
  %result.03.us.i757 = phi i64 [ 0, %bb2.preheader.us.i755 ], [ %3522, %bb1.us.i761 ] ; <i64> [#uses=1]
  %n.02.us.i758 = phi i32 [ 0, %bb2.preheader.us.i755 ], [ %3523, %bb1.us.i761 ] ; <i32> [#uses=2]
  %scevgep.i759 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i758 ; <i64*> [#uses=1]
  %3520 = load i64* %scevgep.i759, align 8        ; <i64> [#uses=1]
  %3521 = or i64 %3515, %3520                     ; <i64> [#uses=1]
  %3522 = add nsw i64 %3521, %result.03.us.i757   ; <i64> [#uses=2]
  %3523 = add nsw i32 %n.02.us.i758, 1            ; <i32> [#uses=2]
  %exitcond.i760 = icmp eq i32 %3523, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i760, label %bb2.bb3_crit_edge.us.i762, label %bb1.us.i761

bb2.bb3_crit_edge.us.i762:                        ; preds = %bb1.us.i761
  %3524 = icmp eq i64 %3517, %3522                ; <i1> [#uses=1]
  br i1 %3524, label %_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i756

bb5.i763:                                         ; preds = %_Z26check_shifted_variable_sumIx27custom_multiple_variable_orIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix18custom_variable_orIxEEvPT_iS2_PKc.exit
  %3525 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3526 = sub i32 %3525, %3512                    ; <i32> [#uses=1]
  %3527 = sitofp i32 %3526 to double              ; <double> [#uses=1]
  %3528 = fdiv double %3527, 1.000000e+06         ; <double> [#uses=1]
  %.not2970 = icmp ne %struct.one_result* %results.121, null ; <i1> [#uses=1]
  %3529 = icmp sgt i32 %allocated_results.121, 123 ; <i1> [#uses=1]
  %or.cond2971 = and i1 %3529, %.not2970          ; <i1> [#uses=1]
  br i1 %or.cond2971, label %_Z14test_variable4Ix27custom_multiple_variable_orIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i765

bb1.i.i765:                                       ; preds = %bb5.i763
  %3530 = add nsw i32 %allocated_results.121, 10  ; <i32> [#uses=3]
  %3531 = mul i32 %3530, 12                       ; <i32> [#uses=1]
  %3532 = bitcast %struct.one_result* %results.121 to i8* ; <i8*> [#uses=1]
  %3533 = tail call i8* @realloc(i8* %3532, i32 %3531) nounwind ; <i8*> [#uses=2]
  %3534 = bitcast i8* %3533 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3535 = icmp eq i8* %3533, null                 ; <i1> [#uses=1]
  br i1 %3535, label %bb2.i.i766, label %_Z14test_variable4Ix27custom_multiple_variable_orIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i766:                                       ; preds = %bb1.i.i765
  %3536 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3530) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix27custom_multiple_variable_orIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i765, %bb5.i763
  %results.122 = phi %struct.one_result* [ %3534, %bb1.i.i765 ], [ %results.121, %bb5.i763 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.122 = phi i32 [ %3530, %bb1.i.i765 ], [ %allocated_results.121, %bb5.i763 ] ; <i32> [#uses=3]
  %3537 = phi %struct.one_result* [ %3534, %bb1.i.i765 ], [ %results.121, %bb5.i763 ] ; <%struct.one_result*> [#uses=2]
  %3538 = getelementptr inbounds %struct.one_result* %3537, i32 123, i32 0 ; <double*> [#uses=1]
  store double %3528, double* %3538, align 4
  %3539 = getelementptr inbounds %struct.one_result* %3537, i32 123, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str135, i32 0, i32 0), i8** %3539, align 4
  %3540 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i737, label %bb5.i748

bb.nph6.i737:                                     ; preds = %_Z14test_variable4Ix27custom_multiple_variable_orIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3541 = xor i64 %3096, %3098                    ; <i64> [#uses=1]
  %3542 = mul i64 %3541, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i740

bb2.preheader.us.i740:                            ; preds = %_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i, %bb.nph6.i737
  %i.05.us.i738 = phi i32 [ 0, %bb.nph6.i737 ], [ %tmp.i739, %_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i739 = add i32 %i.05.us.i738, 1            ; <i32> [#uses=2]
  br label %bb1.us.i746

_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i747, %bb.i1.us.i741
  %3543 = icmp slt i32 %tmp.i739, %iterations.0   ; <i1> [#uses=1]
  br i1 %3543, label %bb2.preheader.us.i740, label %bb5.i748

bb.i1.us.i741:                                    ; preds = %bb2.bb3_crit_edge.us.i747
  %3544 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 124) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i

bb1.us.i746:                                      ; preds = %bb1.us.i746, %bb2.preheader.us.i740
  %result.03.us.i742 = phi i64 [ 0, %bb2.preheader.us.i740 ], [ %3547, %bb1.us.i746 ] ; <i64> [#uses=1]
  %n.02.us.i743 = phi i32 [ 0, %bb2.preheader.us.i740 ], [ %3548, %bb1.us.i746 ] ; <i32> [#uses=2]
  %scevgep.i744 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i743 ; <i64*> [#uses=1]
  %3545 = load i64* %scevgep.i744, align 8        ; <i64> [#uses=1]
  %3546 = xor i64 %3545, %3098                    ; <i64> [#uses=1]
  %3547 = add nsw i64 %3546, %result.03.us.i742   ; <i64> [#uses=2]
  %3548 = add nsw i32 %n.02.us.i743, 1            ; <i32> [#uses=2]
  %exitcond.i745 = icmp eq i32 %3548, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i745, label %bb2.bb3_crit_edge.us.i747, label %bb1.us.i746

bb2.bb3_crit_edge.us.i747:                        ; preds = %bb1.us.i746
  %3549 = icmp eq i64 %3542, %3547                ; <i1> [#uses=1]
  br i1 %3549, label %_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i, label %bb.i1.us.i741

bb5.i748:                                         ; preds = %_Z26check_shifted_variable_sumIx19custom_variable_xorIxEEvT_S2_.exit.us.i, %_Z14test_variable4Ix27custom_multiple_variable_orIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %3550 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3551 = sub i32 %3550, %3540                    ; <i32> [#uses=1]
  %3552 = sitofp i32 %3551 to double              ; <double> [#uses=1]
  %3553 = fdiv double %3552, 1.000000e+06         ; <double> [#uses=1]
  %.not2972 = icmp ne %struct.one_result* %results.122, null ; <i1> [#uses=1]
  %3554 = icmp sgt i32 %allocated_results.122, 124 ; <i1> [#uses=1]
  %or.cond2973 = and i1 %3554, %.not2972          ; <i1> [#uses=1]
  br i1 %or.cond2973, label %_Z14test_variable1Ix19custom_variable_xorIxEEvPT_iS2_PKc.exit, label %bb1.i.i750

bb1.i.i750:                                       ; preds = %bb5.i748
  %3555 = add nsw i32 %allocated_results.122, 10  ; <i32> [#uses=3]
  %3556 = mul i32 %3555, 12                       ; <i32> [#uses=1]
  %3557 = bitcast %struct.one_result* %results.122 to i8* ; <i8*> [#uses=1]
  %3558 = tail call i8* @realloc(i8* %3557, i32 %3556) nounwind ; <i8*> [#uses=2]
  %3559 = bitcast i8* %3558 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3560 = icmp eq i8* %3558, null                 ; <i1> [#uses=1]
  br i1 %3560, label %bb2.i.i751, label %_Z14test_variable1Ix19custom_variable_xorIxEEvPT_iS2_PKc.exit

bb2.i.i751:                                       ; preds = %bb1.i.i750
  %3561 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3555) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Ix19custom_variable_xorIxEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i750, %bb5.i748
  %results.123 = phi %struct.one_result* [ %3559, %bb1.i.i750 ], [ %results.122, %bb5.i748 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.123 = phi i32 [ %3555, %bb1.i.i750 ], [ %allocated_results.122, %bb5.i748 ] ; <i32> [#uses=3]
  %3562 = phi %struct.one_result* [ %3559, %bb1.i.i750 ], [ %results.122, %bb5.i748 ] ; <%struct.one_result*> [#uses=2]
  %3563 = getelementptr inbounds %struct.one_result* %3562, i32 124, i32 0 ; <double*> [#uses=1]
  store double %3553, double* %3563, align 4
  %3564 = getelementptr inbounds %struct.one_result* %3562, i32 124, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str136, i32 0, i32 0), i8** %3564, align 4
  %3565 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i722, label %bb5.i733

bb.nph6.i722:                                     ; preds = %_Z14test_variable1Ix19custom_variable_xorIxEEvPT_iS2_PKc.exit
  %3566 = xor i64 %3099, %3098                    ; <i64> [#uses=1]
  %3567 = xor i64 %3566, %3100                    ; <i64> [#uses=1]
  %3568 = xor i64 %3567, %3102                    ; <i64> [#uses=2]
  %3569 = xor i64 %3568, %3096                    ; <i64> [#uses=1]
  %3570 = mul i64 %3569, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i725

bb2.preheader.us.i725:                            ; preds = %_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i722
  %i.05.us.i723 = phi i32 [ 0, %bb.nph6.i722 ], [ %tmp.i724, %_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i724 = add i32 %i.05.us.i723, 1            ; <i32> [#uses=2]
  br label %bb1.us.i731

_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i732, %bb.i1.us.i726
  %3571 = icmp slt i32 %tmp.i724, %iterations.0   ; <i1> [#uses=1]
  br i1 %3571, label %bb2.preheader.us.i725, label %bb5.i733

bb.i1.us.i726:                                    ; preds = %bb2.bb3_crit_edge.us.i732
  %3572 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 125) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i731:                                      ; preds = %bb1.us.i731, %bb2.preheader.us.i725
  %result.03.us.i727 = phi i64 [ 0, %bb2.preheader.us.i725 ], [ %3575, %bb1.us.i731 ] ; <i64> [#uses=1]
  %n.02.us.i728 = phi i32 [ 0, %bb2.preheader.us.i725 ], [ %3576, %bb1.us.i731 ] ; <i32> [#uses=2]
  %scevgep.i729 = getelementptr [8000 x i64]* @data64, i32 0, i32 %n.02.us.i728 ; <i64*> [#uses=1]
  %3573 = load i64* %scevgep.i729, align 8        ; <i64> [#uses=1]
  %3574 = xor i64 %3568, %3573                    ; <i64> [#uses=1]
  %3575 = add nsw i64 %3574, %result.03.us.i727   ; <i64> [#uses=2]
  %3576 = add nsw i32 %n.02.us.i728, 1            ; <i32> [#uses=2]
  %exitcond.i730 = icmp eq i32 %3576, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i730, label %bb2.bb3_crit_edge.us.i732, label %bb1.us.i731

bb2.bb3_crit_edge.us.i732:                        ; preds = %bb1.us.i731
  %3577 = icmp eq i64 %3570, %3575                ; <i1> [#uses=1]
  br i1 %3577, label %_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i726

bb5.i733:                                         ; preds = %_Z26check_shifted_variable_sumIx28custom_multiple_variable_xorIxEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Ix19custom_variable_xorIxEEvPT_iS2_PKc.exit
  %3578 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3579 = sub i32 %3578, %3565                    ; <i32> [#uses=1]
  %3580 = sitofp i32 %3579 to double              ; <double> [#uses=1]
  %3581 = fdiv double %3580, 1.000000e+06         ; <double> [#uses=1]
  %.not2974 = icmp ne %struct.one_result* %results.123, null ; <i1> [#uses=1]
  %3582 = icmp sgt i32 %allocated_results.123, 125 ; <i1> [#uses=1]
  %or.cond2975 = and i1 %3582, %.not2974          ; <i1> [#uses=1]
  br i1 %or.cond2975, label %_Z14test_variable4Ix28custom_multiple_variable_xorIxEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i735

bb1.i.i735:                                       ; preds = %bb5.i733
  %3583 = add nsw i32 %allocated_results.123, 10  ; <i32> [#uses=3]
  %3584 = mul i32 %3583, 12                       ; <i32> [#uses=1]
  %3585 = bitcast %struct.one_result* %results.123 to i8* ; <i8*> [#uses=1]
  %3586 = tail call i8* @realloc(i8* %3585, i32 %3584) nounwind ; <i8*> [#uses=2]
  %3587 = bitcast i8* %3586 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3588 = icmp eq i8* %3586, null                 ; <i1> [#uses=1]
  br i1 %3588, label %bb2.i.i736, label %_Z14test_variable4Ix28custom_multiple_variable_xorIxEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i736:                                       ; preds = %bb1.i.i735
  %3589 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3583) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Ix28custom_multiple_variable_xorIxEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i735, %bb5.i733
  %results.124 = phi %struct.one_result* [ %3587, %bb1.i.i735 ], [ %results.123, %bb5.i733 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.124 = phi i32 [ %3583, %bb1.i.i735 ], [ %allocated_results.123, %bb5.i733 ] ; <i32> [#uses=3]
  %3590 = phi %struct.one_result* [ %3587, %bb1.i.i735 ], [ %results.123, %bb5.i733 ] ; <%struct.one_result*> [#uses=2]
  %3591 = getelementptr inbounds %struct.one_result* %3590, i32 125, i32 0 ; <double*> [#uses=1]
  store double %3581, double* %3591, align 4
  %3592 = getelementptr inbounds %struct.one_result* %3590, i32 125, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str137, i32 0, i32 0), i8** %3592, align 4
  %3593 = fptoui double %init_value.0 to i64      ; <i64> [#uses=19]
  br label %bb.i33

bb.i33:                                           ; preds = %bb.i33, %_Z14test_variable4Ix28custom_multiple_variable_xorIxEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i29 = phi i32 [ 0, %_Z14test_variable4Ix28custom_multiple_variable_xorIxEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i31, %bb.i33 ] ; <i32> [#uses=2]
  %tmp.i31 = add i32 %indvar.i29, 1               ; <i32> [#uses=2]
  %first_addr.01.i30 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %indvar.i29 ; <i64*> [#uses=1]
  store i64 %3593, i64* %first_addr.01.i30, align 8
  %scevgep.i32.idx.mask = and i32 %tmp.i31, 536870911 ; <i32> [#uses=1]
  %3594 = icmp eq i32 %scevgep.i32.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %3594, label %_Z4fillIPyyEvT_S1_T0_.exit, label %bb.i33

_Z4fillIPyyEvT_S1_T0_.exit:                       ; preds = %bb.i33
  %3595 = fptoui double %temp.0 to i64            ; <i64> [#uses=32]
  %3596 = shl i64 %3595, 1                        ; <i64> [#uses=13]
  %3597 = add i64 %3595, 2                        ; <i64> [#uses=14]
  %3598 = udiv i64 %3596, %3597                   ; <i64> [#uses=1]
  %3599 = add i64 %3598, %3595                    ; <i64> [#uses=13]
  %3600 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i706, label %bb5.i718

bb.nph6.i706:                                     ; preds = %_Z4fillIPyyEvT_S1_T0_.exit
  %3601 = add i64 %3593, %3595                    ; <i64> [#uses=1]
  %3602 = mul i64 %3601, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i709

bb2.preheader.us.i709:                            ; preds = %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710, %bb.nph6.i706
  %i.05.us.i707 = phi i32 [ 0, %bb.nph6.i706 ], [ %tmp.i708, %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710 ] ; <i32> [#uses=1]
  %tmp.i708 = add i32 %i.05.us.i707, 1            ; <i32> [#uses=2]
  br label %bb1.us.i716

_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710: ; preds = %bb2.bb3_crit_edge.us.i717, %bb.i1.us.i711
  %3603 = icmp slt i32 %tmp.i708, %iterations.0   ; <i1> [#uses=1]
  br i1 %3603, label %bb2.preheader.us.i709, label %bb5.i718

bb.i1.us.i711:                                    ; preds = %bb2.bb3_crit_edge.us.i717
  %3604 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 126) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710

bb1.us.i716:                                      ; preds = %bb1.us.i716, %bb2.preheader.us.i709
  %result.03.us.i712 = phi i64 [ 0, %bb2.preheader.us.i709 ], [ %3607, %bb1.us.i716 ] ; <i64> [#uses=1]
  %n.02.us.i713 = phi i32 [ 0, %bb2.preheader.us.i709 ], [ %3608, %bb1.us.i716 ] ; <i32> [#uses=2]
  %scevgep.i714 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i713 ; <i64*> [#uses=1]
  %3605 = load i64* %scevgep.i714, align 8        ; <i64> [#uses=1]
  %3606 = add i64 %result.03.us.i712, %3595       ; <i64> [#uses=1]
  %3607 = add i64 %3606, %3605                    ; <i64> [#uses=2]
  %3608 = add nsw i32 %n.02.us.i713, 1            ; <i32> [#uses=2]
  %exitcond.i715 = icmp eq i32 %3608, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i715, label %bb2.bb3_crit_edge.us.i717, label %bb1.us.i716

bb2.bb3_crit_edge.us.i717:                        ; preds = %bb1.us.i716
  %3609 = icmp eq i64 %3602, %3607                ; <i1> [#uses=1]
  br i1 %3609, label %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710, label %bb.i1.us.i711

bb5.i718:                                         ; preds = %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i710, %_Z4fillIPyyEvT_S1_T0_.exit
  %3610 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3611 = sub i32 %3610, %3600                    ; <i32> [#uses=1]
  %3612 = sitofp i32 %3611 to double              ; <double> [#uses=1]
  %3613 = fdiv double %3612, 1.000000e+06         ; <double> [#uses=1]
  %.not2976 = icmp ne %struct.one_result* %results.124, null ; <i1> [#uses=1]
  %3614 = icmp sgt i32 %allocated_results.124, 126 ; <i1> [#uses=1]
  %or.cond2977 = and i1 %3614, %.not2976          ; <i1> [#uses=1]
  br i1 %or.cond2977, label %_Z14test_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit, label %bb1.i.i720

bb1.i.i720:                                       ; preds = %bb5.i718
  %3615 = add nsw i32 %allocated_results.124, 10  ; <i32> [#uses=3]
  %3616 = mul i32 %3615, 12                       ; <i32> [#uses=1]
  %3617 = bitcast %struct.one_result* %results.124 to i8* ; <i8*> [#uses=1]
  %3618 = tail call i8* @realloc(i8* %3617, i32 %3616) nounwind ; <i8*> [#uses=2]
  %3619 = bitcast i8* %3618 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3620 = icmp eq i8* %3618, null                 ; <i1> [#uses=1]
  br i1 %3620, label %bb2.i.i721, label %_Z14test_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit

bb2.i.i721:                                       ; preds = %bb1.i.i720
  %3621 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3615) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i720, %bb5.i718
  %results.125 = phi %struct.one_result* [ %3619, %bb1.i.i720 ], [ %results.124, %bb5.i718 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.125 = phi i32 [ %3615, %bb1.i.i720 ], [ %allocated_results.124, %bb5.i718 ] ; <i32> [#uses=3]
  %3622 = phi %struct.one_result* [ %3619, %bb1.i.i720 ], [ %results.124, %bb5.i718 ] ; <%struct.one_result*> [#uses=2]
  %3623 = getelementptr inbounds %struct.one_result* %3622, i32 126, i32 0 ; <double*> [#uses=1]
  store double %3613, double* %3623, align 4
  %3624 = getelementptr inbounds %struct.one_result* %3622, i32 126, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str138, i32 0, i32 0), i8** %3624, align 4
  %3625 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i691, label %bb5.i702

bb.nph6.i691:                                     ; preds = %_Z14test_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit
  %3626 = mul i64 %3595, 8000                     ; <i64> [#uses=1]
  %3627 = add i64 %3593, %3595                    ; <i64> [#uses=1]
  %3628 = mul i64 %3627, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i694

bb2.preheader.us.i694:                            ; preds = %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i, %bb.nph6.i691
  %i.05.us.i692 = phi i32 [ 0, %bb.nph6.i691 ], [ %tmp.i693, %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i693 = add i32 %i.05.us.i692, 1            ; <i32> [#uses=2]
  br label %bb1.us.i700

_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i701, %bb.i1.us.i695
  %3629 = icmp slt i32 %tmp.i693, %iterations.0   ; <i1> [#uses=1]
  br i1 %3629, label %bb2.preheader.us.i694, label %bb5.i702

bb.i1.us.i695:                                    ; preds = %bb2.bb3_crit_edge.us.i701
  %3630 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 127) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i

bb1.us.i700:                                      ; preds = %bb1.us.i700, %bb2.preheader.us.i694
  %result.03.us.i696 = phi i64 [ 0, %bb2.preheader.us.i694 ], [ %3632, %bb1.us.i700 ] ; <i64> [#uses=1]
  %n.02.us.i697 = phi i32 [ 0, %bb2.preheader.us.i694 ], [ %3633, %bb1.us.i700 ] ; <i32> [#uses=2]
  %scevgep.i698 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i697 ; <i64*> [#uses=1]
  %3631 = load i64* %scevgep.i698, align 8        ; <i64> [#uses=1]
  %3632 = add i64 %3631, %result.03.us.i696       ; <i64> [#uses=2]
  %3633 = add nsw i32 %n.02.us.i697, 1            ; <i32> [#uses=2]
  %exitcond.i699 = icmp eq i32 %3633, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i699, label %bb2.bb3_crit_edge.us.i701, label %bb1.us.i700

bb2.bb3_crit_edge.us.i701:                        ; preds = %bb1.us.i700
  %3634 = add i64 %3632, %3626                    ; <i64> [#uses=1]
  %3635 = icmp eq i64 %3628, %3634                ; <i1> [#uses=1]
  br i1 %3635, label %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i, label %bb.i1.us.i695

bb5.i702:                                         ; preds = %_Z26check_shifted_variable_sumIy19custom_add_variableIyEEvT_S2_.exit.us.i, %_Z14test_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit
  %3636 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3637 = sub i32 %3636, %3625                    ; <i32> [#uses=1]
  %3638 = sitofp i32 %3637 to double              ; <double> [#uses=1]
  %3639 = fdiv double %3638, 1.000000e+06         ; <double> [#uses=1]
  %.not2978 = icmp ne %struct.one_result* %results.125, null ; <i1> [#uses=1]
  %3640 = icmp sgt i32 %allocated_results.125, 127 ; <i1> [#uses=1]
  %or.cond2979 = and i1 %3640, %.not2978          ; <i1> [#uses=1]
  br i1 %or.cond2979, label %_Z22test_hoisted_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit, label %bb1.i.i704

bb1.i.i704:                                       ; preds = %bb5.i702
  %3641 = add nsw i32 %allocated_results.125, 10  ; <i32> [#uses=3]
  %3642 = mul i32 %3641, 12                       ; <i32> [#uses=1]
  %3643 = bitcast %struct.one_result* %results.125 to i8* ; <i8*> [#uses=1]
  %3644 = tail call i8* @realloc(i8* %3643, i32 %3642) nounwind ; <i8*> [#uses=2]
  %3645 = bitcast i8* %3644 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3646 = icmp eq i8* %3644, null                 ; <i1> [#uses=1]
  br i1 %3646, label %bb2.i.i705, label %_Z22test_hoisted_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit

bb2.i.i705:                                       ; preds = %bb1.i.i704
  %3647 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3641) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i704, %bb5.i702
  %results.126 = phi %struct.one_result* [ %3645, %bb1.i.i704 ], [ %results.125, %bb5.i702 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.126 = phi i32 [ %3641, %bb1.i.i704 ], [ %allocated_results.125, %bb5.i702 ] ; <i32> [#uses=3]
  %3648 = phi %struct.one_result* [ %3645, %bb1.i.i704 ], [ %results.125, %bb5.i702 ] ; <%struct.one_result*> [#uses=2]
  %3649 = getelementptr inbounds %struct.one_result* %3648, i32 127, i32 0 ; <double*> [#uses=1]
  store double %3639, double* %3649, align 4
  %3650 = getelementptr inbounds %struct.one_result* %3648, i32 127, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str139, i32 0, i32 0), i8** %3650, align 4
  %3651 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i676, label %bb5.i687

bb.nph6.i676:                                     ; preds = %_Z22test_hoisted_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit
  %3652 = add i64 %3596, %3595                    ; <i64> [#uses=1]
  %3653 = add i64 %3652, %3597                    ; <i64> [#uses=1]
  %3654 = add i64 %3653, %3599                    ; <i64> [#uses=2]
  %3655 = add i64 %3654, %3593                    ; <i64> [#uses=1]
  %3656 = mul i64 %3655, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i679

bb2.preheader.us.i679:                            ; preds = %_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i676
  %i.05.us.i677 = phi i32 [ 0, %bb.nph6.i676 ], [ %tmp.i678, %_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i678 = add i32 %i.05.us.i677, 1            ; <i32> [#uses=2]
  br label %bb1.us.i685

_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i686, %bb.i1.us.i680
  %3657 = icmp slt i32 %tmp.i678, %iterations.0   ; <i1> [#uses=1]
  br i1 %3657, label %bb2.preheader.us.i679, label %bb5.i687

bb.i1.us.i680:                                    ; preds = %bb2.bb3_crit_edge.us.i686
  %3658 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 128) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i685:                                      ; preds = %bb1.us.i685, %bb2.preheader.us.i679
  %result.03.us.i681 = phi i64 [ 0, %bb2.preheader.us.i679 ], [ %3661, %bb1.us.i685 ] ; <i64> [#uses=1]
  %n.02.us.i682 = phi i32 [ 0, %bb2.preheader.us.i679 ], [ %3662, %bb1.us.i685 ] ; <i32> [#uses=2]
  %scevgep.i683 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i682 ; <i64*> [#uses=1]
  %3659 = load i64* %scevgep.i683, align 8        ; <i64> [#uses=1]
  %3660 = add i64 %3654, %result.03.us.i681       ; <i64> [#uses=1]
  %3661 = add i64 %3660, %3659                    ; <i64> [#uses=2]
  %3662 = add nsw i32 %n.02.us.i682, 1            ; <i32> [#uses=2]
  %exitcond.i684 = icmp eq i32 %3662, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i684, label %bb2.bb3_crit_edge.us.i686, label %bb1.us.i685

bb2.bb3_crit_edge.us.i686:                        ; preds = %bb1.us.i685
  %3663 = icmp eq i64 %3656, %3661                ; <i1> [#uses=1]
  br i1 %3663, label %_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i680

bb5.i687:                                         ; preds = %_Z26check_shifted_variable_sumIy28custom_add_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z22test_hoisted_variable1Iy19custom_add_variableIyEEvPT_iS2_PKc.exit
  %3664 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3665 = sub i32 %3664, %3651                    ; <i32> [#uses=1]
  %3666 = sitofp i32 %3665 to double              ; <double> [#uses=1]
  %3667 = fdiv double %3666, 1.000000e+06         ; <double> [#uses=1]
  %.not2980 = icmp ne %struct.one_result* %results.126, null ; <i1> [#uses=1]
  %3668 = icmp sgt i32 %allocated_results.126, 128 ; <i1> [#uses=1]
  %or.cond2981 = and i1 %3668, %.not2980          ; <i1> [#uses=1]
  br i1 %or.cond2981, label %_Z14test_variable4Iy28custom_add_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i689

bb1.i.i689:                                       ; preds = %bb5.i687
  %3669 = add nsw i32 %allocated_results.126, 10  ; <i32> [#uses=3]
  %3670 = mul i32 %3669, 12                       ; <i32> [#uses=1]
  %3671 = bitcast %struct.one_result* %results.126 to i8* ; <i8*> [#uses=1]
  %3672 = tail call i8* @realloc(i8* %3671, i32 %3670) nounwind ; <i8*> [#uses=2]
  %3673 = bitcast i8* %3672 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3674 = icmp eq i8* %3672, null                 ; <i1> [#uses=1]
  br i1 %3674, label %bb2.i.i690, label %_Z14test_variable4Iy28custom_add_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i690:                                       ; preds = %bb1.i.i689
  %3675 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3669) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy28custom_add_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i689, %bb5.i687
  %results.127 = phi %struct.one_result* [ %3673, %bb1.i.i689 ], [ %results.126, %bb5.i687 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.127 = phi i32 [ %3669, %bb1.i.i689 ], [ %allocated_results.126, %bb5.i687 ] ; <i32> [#uses=3]
  %3676 = phi %struct.one_result* [ %3673, %bb1.i.i689 ], [ %results.126, %bb5.i687 ] ; <%struct.one_result*> [#uses=2]
  %3677 = getelementptr inbounds %struct.one_result* %3676, i32 128, i32 0 ; <double*> [#uses=1]
  store double %3667, double* %3677, align 4
  %3678 = getelementptr inbounds %struct.one_result* %3676, i32 128, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str140, i32 0, i32 0), i8** %3678, align 4
  %3679 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i661, label %bb5.i672

bb.nph6.i661:                                     ; preds = %_Z14test_variable4Iy28custom_add_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3680 = sub i64 %3593, %3595                    ; <i64> [#uses=1]
  %3681 = mul i64 %3680, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i664

bb2.preheader.us.i664:                            ; preds = %_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i, %bb.nph6.i661
  %i.05.us.i662 = phi i32 [ 0, %bb.nph6.i661 ], [ %tmp.i663, %_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i663 = add i32 %i.05.us.i662, 1            ; <i32> [#uses=2]
  br label %bb1.us.i670

_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i671, %bb.i1.us.i665
  %3682 = icmp slt i32 %tmp.i663, %iterations.0   ; <i1> [#uses=1]
  br i1 %3682, label %bb2.preheader.us.i664, label %bb5.i672

bb.i1.us.i665:                                    ; preds = %bb2.bb3_crit_edge.us.i671
  %3683 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 129) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i

bb1.us.i670:                                      ; preds = %bb1.us.i670, %bb2.preheader.us.i664
  %result.03.us.i666 = phi i64 [ 0, %bb2.preheader.us.i664 ], [ %3686, %bb1.us.i670 ] ; <i64> [#uses=1]
  %n.02.us.i667 = phi i32 [ 0, %bb2.preheader.us.i664 ], [ %3687, %bb1.us.i670 ] ; <i32> [#uses=2]
  %scevgep.i668 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i667 ; <i64*> [#uses=1]
  %3684 = load i64* %scevgep.i668, align 8        ; <i64> [#uses=1]
  %3685 = sub i64 %result.03.us.i666, %3595       ; <i64> [#uses=1]
  %3686 = add i64 %3685, %3684                    ; <i64> [#uses=2]
  %3687 = add nsw i32 %n.02.us.i667, 1            ; <i32> [#uses=2]
  %exitcond.i669 = icmp eq i32 %3687, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i669, label %bb2.bb3_crit_edge.us.i671, label %bb1.us.i670

bb2.bb3_crit_edge.us.i671:                        ; preds = %bb1.us.i670
  %3688 = icmp eq i64 %3681, %3686                ; <i1> [#uses=1]
  br i1 %3688, label %_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i, label %bb.i1.us.i665

bb5.i672:                                         ; preds = %_Z26check_shifted_variable_sumIy19custom_sub_variableIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy28custom_add_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3689 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3690 = sub i32 %3689, %3679                    ; <i32> [#uses=1]
  %3691 = sitofp i32 %3690 to double              ; <double> [#uses=1]
  %3692 = fdiv double %3691, 1.000000e+06         ; <double> [#uses=1]
  %.not2982 = icmp ne %struct.one_result* %results.127, null ; <i1> [#uses=1]
  %3693 = icmp sgt i32 %allocated_results.127, 129 ; <i1> [#uses=1]
  %or.cond2983 = and i1 %3693, %.not2982          ; <i1> [#uses=1]
  br i1 %or.cond2983, label %_Z14test_variable1Iy19custom_sub_variableIyEEvPT_iS2_PKc.exit, label %bb1.i.i674

bb1.i.i674:                                       ; preds = %bb5.i672
  %3694 = add nsw i32 %allocated_results.127, 10  ; <i32> [#uses=3]
  %3695 = mul i32 %3694, 12                       ; <i32> [#uses=1]
  %3696 = bitcast %struct.one_result* %results.127 to i8* ; <i8*> [#uses=1]
  %3697 = tail call i8* @realloc(i8* %3696, i32 %3695) nounwind ; <i8*> [#uses=2]
  %3698 = bitcast i8* %3697 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3699 = icmp eq i8* %3697, null                 ; <i1> [#uses=1]
  br i1 %3699, label %bb2.i.i675, label %_Z14test_variable1Iy19custom_sub_variableIyEEvPT_iS2_PKc.exit

bb2.i.i675:                                       ; preds = %bb1.i.i674
  %3700 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3694) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy19custom_sub_variableIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i674, %bb5.i672
  %results.128 = phi %struct.one_result* [ %3698, %bb1.i.i674 ], [ %results.127, %bb5.i672 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.128 = phi i32 [ %3694, %bb1.i.i674 ], [ %allocated_results.127, %bb5.i672 ] ; <i32> [#uses=3]
  %3701 = phi %struct.one_result* [ %3698, %bb1.i.i674 ], [ %results.127, %bb5.i672 ] ; <%struct.one_result*> [#uses=2]
  %3702 = getelementptr inbounds %struct.one_result* %3701, i32 129, i32 0 ; <double*> [#uses=1]
  store double %3692, double* %3702, align 4
  %3703 = getelementptr inbounds %struct.one_result* %3701, i32 129, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str141, i32 0, i32 0), i8** %3703, align 4
  %3704 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph8.i, label %bb5.i657

bb.nph8.i:                                        ; preds = %_Z14test_variable1Iy19custom_sub_variableIyEEvPT_iS2_PKc.exit
  %sum9.i = add i64 %3596, %3595                  ; <i64> [#uses=2]
  %3705 = sub i64 0, %sum9.i                      ; <i64> [#uses=1]
  %3706 = sub i64 %3705, %3597                    ; <i64> [#uses=1]
  %3707 = sub i64 %3706, %3599                    ; <i64> [#uses=1]
  %sum.i = add i64 %sum9.i, %3597                 ; <i64> [#uses=1]
  %3708 = sub i64 0, %sum.i                       ; <i64> [#uses=1]
  %3709 = sub i64 %3708, %3599                    ; <i64> [#uses=1]
  %3710 = add i64 %3709, %3593                    ; <i64> [#uses=1]
  %3711 = mul i64 %3710, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i651

bb2.preheader.us.i651:                            ; preds = %_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph8.i
  %i.07.us.i = phi i32 [ 0, %bb.nph8.i ], [ %tmp.i650, %_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i650 = add i32 %i.07.us.i, 1               ; <i32> [#uses=2]
  br label %bb1.us.i655

_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i656, %bb.i1.us.i652
  %3712 = icmp slt i32 %tmp.i650, %iterations.0   ; <i1> [#uses=1]
  br i1 %3712, label %bb2.preheader.us.i651, label %bb5.i657

bb.i1.us.i652:                                    ; preds = %bb2.bb3_crit_edge.us.i656
  %3713 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 130) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i655:                                      ; preds = %bb1.us.i655, %bb2.preheader.us.i651
  %result.05.us.i = phi i64 [ 0, %bb2.preheader.us.i651 ], [ %3716, %bb1.us.i655 ] ; <i64> [#uses=1]
  %n.04.us.i = phi i32 [ 0, %bb2.preheader.us.i651 ], [ %3717, %bb1.us.i655 ] ; <i32> [#uses=2]
  %scevgep.i653 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.04.us.i ; <i64*> [#uses=1]
  %3714 = load i64* %scevgep.i653, align 8        ; <i64> [#uses=1]
  %3715 = add i64 %3707, %result.05.us.i          ; <i64> [#uses=1]
  %3716 = add i64 %3715, %3714                    ; <i64> [#uses=2]
  %3717 = add nsw i32 %n.04.us.i, 1               ; <i32> [#uses=2]
  %exitcond.i654 = icmp eq i32 %3717, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i654, label %bb2.bb3_crit_edge.us.i656, label %bb1.us.i655

bb2.bb3_crit_edge.us.i656:                        ; preds = %bb1.us.i655
  %3718 = icmp eq i64 %3711, %3716                ; <i1> [#uses=1]
  br i1 %3718, label %_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i652

bb5.i657:                                         ; preds = %_Z26check_shifted_variable_sumIy28custom_sub_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy19custom_sub_variableIyEEvPT_iS2_PKc.exit
  %3719 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3720 = sub i32 %3719, %3704                    ; <i32> [#uses=1]
  %3721 = sitofp i32 %3720 to double              ; <double> [#uses=1]
  %3722 = fdiv double %3721, 1.000000e+06         ; <double> [#uses=1]
  %.not2984 = icmp ne %struct.one_result* %results.128, null ; <i1> [#uses=1]
  %3723 = icmp sgt i32 %allocated_results.128, 130 ; <i1> [#uses=1]
  %or.cond2985 = and i1 %3723, %.not2984          ; <i1> [#uses=1]
  br i1 %or.cond2985, label %_Z14test_variable4Iy28custom_sub_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i659

bb1.i.i659:                                       ; preds = %bb5.i657
  %3724 = add nsw i32 %allocated_results.128, 10  ; <i32> [#uses=3]
  %3725 = mul i32 %3724, 12                       ; <i32> [#uses=1]
  %3726 = bitcast %struct.one_result* %results.128 to i8* ; <i8*> [#uses=1]
  %3727 = tail call i8* @realloc(i8* %3726, i32 %3725) nounwind ; <i8*> [#uses=2]
  %3728 = bitcast i8* %3727 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3729 = icmp eq i8* %3727, null                 ; <i1> [#uses=1]
  br i1 %3729, label %bb2.i.i660, label %_Z14test_variable4Iy28custom_sub_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i660:                                       ; preds = %bb1.i.i659
  %3730 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3724) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy28custom_sub_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i659, %bb5.i657
  %results.129 = phi %struct.one_result* [ %3728, %bb1.i.i659 ], [ %results.128, %bb5.i657 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.129 = phi i32 [ %3724, %bb1.i.i659 ], [ %allocated_results.128, %bb5.i657 ] ; <i32> [#uses=3]
  %3731 = phi %struct.one_result* [ %3728, %bb1.i.i659 ], [ %results.128, %bb5.i657 ] ; <%struct.one_result*> [#uses=2]
  %3732 = getelementptr inbounds %struct.one_result* %3731, i32 130, i32 0 ; <double*> [#uses=1]
  store double %3722, double* %3732, align 4
  %3733 = getelementptr inbounds %struct.one_result* %3731, i32 130, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str142, i32 0, i32 0), i8** %3733, align 4
  %3734 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i635, label %bb5.i646

bb.nph6.i635:                                     ; preds = %_Z14test_variable4Iy28custom_sub_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3735 = mul i64 %3595, 8000                     ; <i64> [#uses=1]
  %3736 = mul i64 %3735, %3593                    ; <i64> [#uses=1]
  br label %bb2.preheader.us.i638

bb2.preheader.us.i638:                            ; preds = %_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i, %bb.nph6.i635
  %i.05.us.i636 = phi i32 [ 0, %bb.nph6.i635 ], [ %tmp.i637, %_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i637 = add i32 %i.05.us.i636, 1            ; <i32> [#uses=2]
  br label %bb1.us.i644

_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i645, %bb.i1.us.i639
  %3737 = icmp slt i32 %tmp.i637, %iterations.0   ; <i1> [#uses=1]
  br i1 %3737, label %bb2.preheader.us.i638, label %bb5.i646

bb.i1.us.i639:                                    ; preds = %bb2.bb3_crit_edge.us.i645
  %3738 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 131) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i

bb1.us.i644:                                      ; preds = %bb1.us.i644, %bb2.preheader.us.i638
  %result.03.us.i640 = phi i64 [ 0, %bb2.preheader.us.i638 ], [ %3741, %bb1.us.i644 ] ; <i64> [#uses=1]
  %n.02.us.i641 = phi i32 [ 0, %bb2.preheader.us.i638 ], [ %3742, %bb1.us.i644 ] ; <i32> [#uses=2]
  %scevgep.i642 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i641 ; <i64*> [#uses=1]
  %3739 = load i64* %scevgep.i642, align 8        ; <i64> [#uses=1]
  %3740 = mul i64 %3739, %3595                    ; <i64> [#uses=1]
  %3741 = add i64 %3740, %result.03.us.i640       ; <i64> [#uses=2]
  %3742 = add nsw i32 %n.02.us.i641, 1            ; <i32> [#uses=2]
  %exitcond.i643 = icmp eq i32 %3742, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i643, label %bb2.bb3_crit_edge.us.i645, label %bb1.us.i644

bb2.bb3_crit_edge.us.i645:                        ; preds = %bb1.us.i644
  %3743 = icmp eq i64 %3736, %3741                ; <i1> [#uses=1]
  br i1 %3743, label %_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i, label %bb.i1.us.i639

bb5.i646:                                         ; preds = %_Z26check_shifted_variable_sumIy24custom_multiply_variableIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy28custom_sub_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3744 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3745 = sub i32 %3744, %3734                    ; <i32> [#uses=1]
  %3746 = sitofp i32 %3745 to double              ; <double> [#uses=1]
  %3747 = fdiv double %3746, 1.000000e+06         ; <double> [#uses=1]
  %.not2986 = icmp ne %struct.one_result* %results.129, null ; <i1> [#uses=1]
  %3748 = icmp sgt i32 %allocated_results.129, 131 ; <i1> [#uses=1]
  %or.cond2987 = and i1 %3748, %.not2986          ; <i1> [#uses=1]
  br i1 %or.cond2987, label %_Z14test_variable1Iy24custom_multiply_variableIyEEvPT_iS2_PKc.exit, label %bb1.i.i648

bb1.i.i648:                                       ; preds = %bb5.i646
  %3749 = add nsw i32 %allocated_results.129, 10  ; <i32> [#uses=3]
  %3750 = mul i32 %3749, 12                       ; <i32> [#uses=1]
  %3751 = bitcast %struct.one_result* %results.129 to i8* ; <i8*> [#uses=1]
  %3752 = tail call i8* @realloc(i8* %3751, i32 %3750) nounwind ; <i8*> [#uses=2]
  %3753 = bitcast i8* %3752 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3754 = icmp eq i8* %3752, null                 ; <i1> [#uses=1]
  br i1 %3754, label %bb2.i.i649, label %_Z14test_variable1Iy24custom_multiply_variableIyEEvPT_iS2_PKc.exit

bb2.i.i649:                                       ; preds = %bb1.i.i648
  %3755 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3749) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy24custom_multiply_variableIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i648, %bb5.i646
  %results.130 = phi %struct.one_result* [ %3753, %bb1.i.i648 ], [ %results.129, %bb5.i646 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.130 = phi i32 [ %3749, %bb1.i.i648 ], [ %allocated_results.129, %bb5.i646 ] ; <i32> [#uses=3]
  %3756 = phi %struct.one_result* [ %3753, %bb1.i.i648 ], [ %results.129, %bb5.i646 ] ; <%struct.one_result*> [#uses=2]
  %3757 = getelementptr inbounds %struct.one_result* %3756, i32 131, i32 0 ; <double*> [#uses=1]
  store double %3747, double* %3757, align 4
  %3758 = getelementptr inbounds %struct.one_result* %3756, i32 131, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str143, i32 0, i32 0), i8** %3758, align 4
  %3759 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i620, label %bb5.i631

bb.nph6.i620:                                     ; preds = %_Z14test_variable1Iy24custom_multiply_variableIyEEvPT_iS2_PKc.exit
  %3760 = mul i64 %3596, %3595                    ; <i64> [#uses=1]
  %3761 = mul i64 %3760, %3597                    ; <i64> [#uses=1]
  %3762 = mul i64 %3761, %3599                    ; <i64> [#uses=1]
  %3763 = mul i64 %3595, 8000                     ; <i64> [#uses=1]
  %3764 = mul i64 %3763, %3596                    ; <i64> [#uses=1]
  %3765 = mul i64 %3764, %3597                    ; <i64> [#uses=1]
  %3766 = mul i64 %3765, %3599                    ; <i64> [#uses=1]
  %3767 = mul i64 %3766, %3593                    ; <i64> [#uses=1]
  br label %bb2.preheader.us.i623

bb2.preheader.us.i623:                            ; preds = %_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i620
  %i.05.us.i621 = phi i32 [ 0, %bb.nph6.i620 ], [ %tmp.i622, %_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i622 = add i32 %i.05.us.i621, 1            ; <i32> [#uses=2]
  br label %bb1.us.i629

_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i630, %bb.i1.us.i624
  %3768 = icmp slt i32 %tmp.i622, %iterations.0   ; <i1> [#uses=1]
  br i1 %3768, label %bb2.preheader.us.i623, label %bb5.i631

bb.i1.us.i624:                                    ; preds = %bb2.bb3_crit_edge.us.i630
  %3769 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 132) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i629:                                      ; preds = %bb1.us.i629, %bb2.preheader.us.i623
  %result.03.us.i625 = phi i64 [ 0, %bb2.preheader.us.i623 ], [ %3772, %bb1.us.i629 ] ; <i64> [#uses=1]
  %n.02.us.i626 = phi i32 [ 0, %bb2.preheader.us.i623 ], [ %3773, %bb1.us.i629 ] ; <i32> [#uses=2]
  %scevgep.i627 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i626 ; <i64*> [#uses=1]
  %3770 = load i64* %scevgep.i627, align 8        ; <i64> [#uses=1]
  %3771 = mul i64 %3762, %3770                    ; <i64> [#uses=1]
  %3772 = add i64 %3771, %result.03.us.i625       ; <i64> [#uses=2]
  %3773 = add nsw i32 %n.02.us.i626, 1            ; <i32> [#uses=2]
  %exitcond.i628 = icmp eq i32 %3773, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i628, label %bb2.bb3_crit_edge.us.i630, label %bb1.us.i629

bb2.bb3_crit_edge.us.i630:                        ; preds = %bb1.us.i629
  %3774 = icmp eq i64 %3767, %3772                ; <i1> [#uses=1]
  br i1 %3774, label %_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i624

bb5.i631:                                         ; preds = %_Z26check_shifted_variable_sumIy33custom_multiply_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy24custom_multiply_variableIyEEvPT_iS2_PKc.exit
  %3775 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3776 = sub i32 %3775, %3759                    ; <i32> [#uses=1]
  %3777 = sitofp i32 %3776 to double              ; <double> [#uses=1]
  %3778 = fdiv double %3777, 1.000000e+06         ; <double> [#uses=1]
  %.not2988 = icmp ne %struct.one_result* %results.130, null ; <i1> [#uses=1]
  %3779 = icmp sgt i32 %allocated_results.130, 132 ; <i1> [#uses=1]
  %or.cond2989 = and i1 %3779, %.not2988          ; <i1> [#uses=1]
  br i1 %or.cond2989, label %_Z14test_variable4Iy33custom_multiply_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i633

bb1.i.i633:                                       ; preds = %bb5.i631
  %3780 = add nsw i32 %allocated_results.130, 10  ; <i32> [#uses=3]
  %3781 = mul i32 %3780, 12                       ; <i32> [#uses=1]
  %3782 = bitcast %struct.one_result* %results.130 to i8* ; <i8*> [#uses=1]
  %3783 = tail call i8* @realloc(i8* %3782, i32 %3781) nounwind ; <i8*> [#uses=2]
  %3784 = bitcast i8* %3783 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3785 = icmp eq i8* %3783, null                 ; <i1> [#uses=1]
  br i1 %3785, label %bb2.i.i634, label %_Z14test_variable4Iy33custom_multiply_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i634:                                       ; preds = %bb1.i.i633
  %3786 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3780) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy33custom_multiply_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i633, %bb5.i631
  %results.131 = phi %struct.one_result* [ %3784, %bb1.i.i633 ], [ %results.130, %bb5.i631 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.131 = phi i32 [ %3780, %bb1.i.i633 ], [ %allocated_results.130, %bb5.i631 ] ; <i32> [#uses=3]
  %3787 = phi %struct.one_result* [ %3784, %bb1.i.i633 ], [ %results.130, %bb5.i631 ] ; <%struct.one_result*> [#uses=2]
  %3788 = getelementptr inbounds %struct.one_result* %3787, i32 132, i32 0 ; <double*> [#uses=1]
  store double %3778, double* %3788, align 4
  %3789 = getelementptr inbounds %struct.one_result* %3787, i32 132, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([38 x i8]* @.str144, i32 0, i32 0), i8** %3789, align 4
  %3790 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i605, label %bb5.i616

bb.nph6.i605:                                     ; preds = %_Z14test_variable4Iy33custom_multiply_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3791 = mul i64 %3596, %3595                    ; <i64> [#uses=1]
  %3792 = mul i64 %3791, %3597                    ; <i64> [#uses=1]
  %3793 = mul i64 %3792, %3599                    ; <i64> [#uses=2]
  %3794 = add i64 %3593, %3793                    ; <i64> [#uses=1]
  %3795 = mul i64 %3794, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i608

bb2.preheader.us.i608:                            ; preds = %_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i605
  %i.05.us.i606 = phi i32 [ 0, %bb.nph6.i605 ], [ %tmp.i607, %_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i607 = add i32 %i.05.us.i606, 1            ; <i32> [#uses=2]
  br label %bb1.us.i614

_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i615, %bb.i1.us.i609
  %3796 = icmp slt i32 %tmp.i607, %iterations.0   ; <i1> [#uses=1]
  br i1 %3796, label %bb2.preheader.us.i608, label %bb5.i616

bb.i1.us.i609:                                    ; preds = %bb2.bb3_crit_edge.us.i615
  %3797 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 133) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i614:                                      ; preds = %bb1.us.i614, %bb2.preheader.us.i608
  %result.03.us.i610 = phi i64 [ 0, %bb2.preheader.us.i608 ], [ %3800, %bb1.us.i614 ] ; <i64> [#uses=1]
  %n.02.us.i611 = phi i32 [ 0, %bb2.preheader.us.i608 ], [ %3801, %bb1.us.i614 ] ; <i32> [#uses=2]
  %scevgep.i612 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i611 ; <i64*> [#uses=1]
  %3798 = load i64* %scevgep.i612, align 8        ; <i64> [#uses=1]
  %3799 = add i64 %result.03.us.i610, %3793       ; <i64> [#uses=1]
  %3800 = add i64 %3799, %3798                    ; <i64> [#uses=2]
  %3801 = add nsw i32 %n.02.us.i611, 1            ; <i32> [#uses=2]
  %exitcond.i613 = icmp eq i32 %3801, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i613, label %bb2.bb3_crit_edge.us.i615, label %bb1.us.i614

bb2.bb3_crit_edge.us.i615:                        ; preds = %bb1.us.i614
  %3802 = icmp eq i64 %3795, %3800                ; <i1> [#uses=1]
  br i1 %3802, label %_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i609

bb5.i616:                                         ; preds = %_Z26check_shifted_variable_sumIy34custom_multiply_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Iy33custom_multiply_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3803 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3804 = sub i32 %3803, %3790                    ; <i32> [#uses=1]
  %3805 = sitofp i32 %3804 to double              ; <double> [#uses=1]
  %3806 = fdiv double %3805, 1.000000e+06         ; <double> [#uses=1]
  %.not2990 = icmp ne %struct.one_result* %results.131, null ; <i1> [#uses=1]
  %3807 = icmp sgt i32 %allocated_results.131, 133 ; <i1> [#uses=1]
  %or.cond2991 = and i1 %3807, %.not2990          ; <i1> [#uses=1]
  br i1 %or.cond2991, label %_Z14test_variable4Iy34custom_multiply_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i618

bb1.i.i618:                                       ; preds = %bb5.i616
  %3808 = add nsw i32 %allocated_results.131, 10  ; <i32> [#uses=3]
  %3809 = mul i32 %3808, 12                       ; <i32> [#uses=1]
  %3810 = bitcast %struct.one_result* %results.131 to i8* ; <i8*> [#uses=1]
  %3811 = tail call i8* @realloc(i8* %3810, i32 %3809) nounwind ; <i8*> [#uses=2]
  %3812 = bitcast i8* %3811 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3813 = icmp eq i8* %3811, null                 ; <i1> [#uses=1]
  br i1 %3813, label %bb2.i.i619, label %_Z14test_variable4Iy34custom_multiply_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i619:                                       ; preds = %bb1.i.i618
  %3814 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3808) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy34custom_multiply_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i618, %bb5.i616
  %results.132 = phi %struct.one_result* [ %3812, %bb1.i.i618 ], [ %results.131, %bb5.i616 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.132 = phi i32 [ %3808, %bb1.i.i618 ], [ %allocated_results.131, %bb5.i616 ] ; <i32> [#uses=3]
  %3815 = phi %struct.one_result* [ %3812, %bb1.i.i618 ], [ %results.131, %bb5.i616 ] ; <%struct.one_result*> [#uses=2]
  %3816 = getelementptr inbounds %struct.one_result* %3815, i32 133, i32 0 ; <double*> [#uses=1]
  store double %3806, double* %3816, align 4
  %3817 = getelementptr inbounds %struct.one_result* %3815, i32 133, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([39 x i8]* @.str145, i32 0, i32 0), i8** %3817, align 4
  %3818 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i590, label %bb5.i601

bb.nph6.i590:                                     ; preds = %_Z14test_variable4Iy34custom_multiply_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3819 = udiv i64 %3593, %3595                   ; <i64> [#uses=1]
  %3820 = mul i64 %3819, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i593

bb2.preheader.us.i593:                            ; preds = %_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i, %bb.nph6.i590
  %i.05.us.i591 = phi i32 [ 0, %bb.nph6.i590 ], [ %tmp.i592, %_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i592 = add i32 %i.05.us.i591, 1            ; <i32> [#uses=2]
  br label %bb1.us.i599

_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i600, %bb.i1.us.i594
  %3821 = icmp slt i32 %tmp.i592, %iterations.0   ; <i1> [#uses=1]
  br i1 %3821, label %bb2.preheader.us.i593, label %bb5.i601

bb.i1.us.i594:                                    ; preds = %bb2.bb3_crit_edge.us.i600
  %3822 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 134) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i

bb1.us.i599:                                      ; preds = %bb1.us.i599, %bb2.preheader.us.i593
  %result.03.us.i595 = phi i64 [ 0, %bb2.preheader.us.i593 ], [ %3825, %bb1.us.i599 ] ; <i64> [#uses=1]
  %n.02.us.i596 = phi i32 [ 0, %bb2.preheader.us.i593 ], [ %3826, %bb1.us.i599 ] ; <i32> [#uses=2]
  %scevgep.i597 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i596 ; <i64*> [#uses=1]
  %3823 = load i64* %scevgep.i597, align 8        ; <i64> [#uses=1]
  %3824 = udiv i64 %3823, %3595                   ; <i64> [#uses=1]
  %3825 = add i64 %3824, %result.03.us.i595       ; <i64> [#uses=2]
  %3826 = add nsw i32 %n.02.us.i596, 1            ; <i32> [#uses=2]
  %exitcond.i598 = icmp eq i32 %3826, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i598, label %bb2.bb3_crit_edge.us.i600, label %bb1.us.i599

bb2.bb3_crit_edge.us.i600:                        ; preds = %bb1.us.i599
  %3827 = icmp eq i64 %3820, %3825                ; <i1> [#uses=1]
  br i1 %3827, label %_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i, label %bb.i1.us.i594

bb5.i601:                                         ; preds = %_Z26check_shifted_variable_sumIy22custom_divide_variableIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy34custom_multiply_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3828 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3829 = sub i32 %3828, %3818                    ; <i32> [#uses=1]
  %3830 = sitofp i32 %3829 to double              ; <double> [#uses=1]
  %3831 = fdiv double %3830, 1.000000e+06         ; <double> [#uses=1]
  %.not2992 = icmp ne %struct.one_result* %results.132, null ; <i1> [#uses=1]
  %3832 = icmp sgt i32 %allocated_results.132, 134 ; <i1> [#uses=1]
  %or.cond2993 = and i1 %3832, %.not2992          ; <i1> [#uses=1]
  br i1 %or.cond2993, label %_Z14test_variable1Iy22custom_divide_variableIyEEvPT_iS2_PKc.exit, label %bb1.i.i603

bb1.i.i603:                                       ; preds = %bb5.i601
  %3833 = add nsw i32 %allocated_results.132, 10  ; <i32> [#uses=3]
  %3834 = mul i32 %3833, 12                       ; <i32> [#uses=1]
  %3835 = bitcast %struct.one_result* %results.132 to i8* ; <i8*> [#uses=1]
  %3836 = tail call i8* @realloc(i8* %3835, i32 %3834) nounwind ; <i8*> [#uses=2]
  %3837 = bitcast i8* %3836 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3838 = icmp eq i8* %3836, null                 ; <i1> [#uses=1]
  br i1 %3838, label %bb2.i.i604, label %_Z14test_variable1Iy22custom_divide_variableIyEEvPT_iS2_PKc.exit

bb2.i.i604:                                       ; preds = %bb1.i.i603
  %3839 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3833) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy22custom_divide_variableIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i603, %bb5.i601
  %results.133 = phi %struct.one_result* [ %3837, %bb1.i.i603 ], [ %results.132, %bb5.i601 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.133 = phi i32 [ %3833, %bb1.i.i603 ], [ %allocated_results.132, %bb5.i601 ] ; <i32> [#uses=3]
  %3840 = phi %struct.one_result* [ %3837, %bb1.i.i603 ], [ %results.132, %bb5.i601 ] ; <%struct.one_result*> [#uses=2]
  %3841 = getelementptr inbounds %struct.one_result* %3840, i32 134, i32 0 ; <double*> [#uses=1]
  store double %3831, double* %3841, align 4
  %3842 = getelementptr inbounds %struct.one_result* %3840, i32 134, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str146, i32 0, i32 0), i8** %3842, align 4
  %3843 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i575, label %bb5.i586

bb.nph6.i575:                                     ; preds = %_Z14test_variable1Iy22custom_divide_variableIyEEvPT_iS2_PKc.exit
  %3844 = udiv i64 %3593, %3595                   ; <i64> [#uses=1]
  %3845 = udiv i64 %3844, %3596                   ; <i64> [#uses=1]
  %3846 = udiv i64 %3845, %3597                   ; <i64> [#uses=1]
  %3847 = udiv i64 %3846, %3599                   ; <i64> [#uses=1]
  %3848 = mul i64 %3847, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i578

bb2.preheader.us.i578:                            ; preds = %_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i575
  %i.05.us.i576 = phi i32 [ 0, %bb.nph6.i575 ], [ %tmp.i577, %_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i577 = add i32 %i.05.us.i576, 1            ; <i32> [#uses=2]
  br label %bb1.us.i584

_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i585, %bb.i1.us.i579
  %3849 = icmp slt i32 %tmp.i577, %iterations.0   ; <i1> [#uses=1]
  br i1 %3849, label %bb2.preheader.us.i578, label %bb5.i586

bb.i1.us.i579:                                    ; preds = %bb2.bb3_crit_edge.us.i585
  %3850 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 135) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i584:                                      ; preds = %bb1.us.i584, %bb2.preheader.us.i578
  %result.03.us.i580 = phi i64 [ 0, %bb2.preheader.us.i578 ], [ %3856, %bb1.us.i584 ] ; <i64> [#uses=1]
  %n.02.us.i581 = phi i32 [ 0, %bb2.preheader.us.i578 ], [ %3857, %bb1.us.i584 ] ; <i32> [#uses=2]
  %scevgep.i582 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i581 ; <i64*> [#uses=1]
  %3851 = load i64* %scevgep.i582, align 8        ; <i64> [#uses=1]
  %3852 = udiv i64 %3851, %3595                   ; <i64> [#uses=1]
  %3853 = udiv i64 %3852, %3596                   ; <i64> [#uses=1]
  %3854 = udiv i64 %3853, %3597                   ; <i64> [#uses=1]
  %3855 = udiv i64 %3854, %3599                   ; <i64> [#uses=1]
  %3856 = add i64 %3855, %result.03.us.i580       ; <i64> [#uses=2]
  %3857 = add nsw i32 %n.02.us.i581, 1            ; <i32> [#uses=2]
  %exitcond.i583 = icmp eq i32 %3857, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i583, label %bb2.bb3_crit_edge.us.i585, label %bb1.us.i584

bb2.bb3_crit_edge.us.i585:                        ; preds = %bb1.us.i584
  %3858 = icmp eq i64 %3848, %3856                ; <i1> [#uses=1]
  br i1 %3858, label %_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i579

bb5.i586:                                         ; preds = %_Z26check_shifted_variable_sumIy31custom_divide_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy22custom_divide_variableIyEEvPT_iS2_PKc.exit
  %3859 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3860 = sub i32 %3859, %3843                    ; <i32> [#uses=1]
  %3861 = sitofp i32 %3860 to double              ; <double> [#uses=1]
  %3862 = fdiv double %3861, 1.000000e+06         ; <double> [#uses=1]
  %.not2994 = icmp ne %struct.one_result* %results.133, null ; <i1> [#uses=1]
  %3863 = icmp sgt i32 %allocated_results.133, 135 ; <i1> [#uses=1]
  %or.cond2995 = and i1 %3863, %.not2994          ; <i1> [#uses=1]
  br i1 %or.cond2995, label %_Z14test_variable4Iy31custom_divide_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i588

bb1.i.i588:                                       ; preds = %bb5.i586
  %3864 = add nsw i32 %allocated_results.133, 10  ; <i32> [#uses=3]
  %3865 = mul i32 %3864, 12                       ; <i32> [#uses=1]
  %3866 = bitcast %struct.one_result* %results.133 to i8* ; <i8*> [#uses=1]
  %3867 = tail call i8* @realloc(i8* %3866, i32 %3865) nounwind ; <i8*> [#uses=2]
  %3868 = bitcast i8* %3867 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3869 = icmp eq i8* %3867, null                 ; <i1> [#uses=1]
  br i1 %3869, label %bb2.i.i589, label %_Z14test_variable4Iy31custom_divide_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i589:                                       ; preds = %bb1.i.i588
  %3870 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3864) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy31custom_divide_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i588, %bb5.i586
  %results.134 = phi %struct.one_result* [ %3868, %bb1.i.i588 ], [ %results.133, %bb5.i586 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.134 = phi i32 [ %3864, %bb1.i.i588 ], [ %allocated_results.133, %bb5.i586 ] ; <i32> [#uses=3]
  %3871 = phi %struct.one_result* [ %3868, %bb1.i.i588 ], [ %results.133, %bb5.i586 ] ; <%struct.one_result*> [#uses=2]
  %3872 = getelementptr inbounds %struct.one_result* %3871, i32 135, i32 0 ; <double*> [#uses=1]
  store double %3862, double* %3872, align 4
  %3873 = getelementptr inbounds %struct.one_result* %3871, i32 135, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str147, i32 0, i32 0), i8** %3873, align 4
  %3874 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i560, label %bb5.i571

bb.nph6.i560:                                     ; preds = %_Z14test_variable4Iy31custom_divide_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3875 = udiv i64 %3595, %3596                   ; <i64> [#uses=1]
  %3876 = udiv i64 %3875, %3597                   ; <i64> [#uses=1]
  %3877 = udiv i64 %3876, %3599                   ; <i64> [#uses=2]
  %3878 = add i64 %3877, %3593                    ; <i64> [#uses=1]
  %3879 = mul i64 %3878, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i563

bb2.preheader.us.i563:                            ; preds = %_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i560
  %i.05.us.i561 = phi i32 [ 0, %bb.nph6.i560 ], [ %tmp.i562, %_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i562 = add i32 %i.05.us.i561, 1            ; <i32> [#uses=2]
  br label %bb1.us.i569

_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i570, %bb.i1.us.i564
  %3880 = icmp slt i32 %tmp.i562, %iterations.0   ; <i1> [#uses=1]
  br i1 %3880, label %bb2.preheader.us.i563, label %bb5.i571

bb.i1.us.i564:                                    ; preds = %bb2.bb3_crit_edge.us.i570
  %3881 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 136) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i569:                                      ; preds = %bb1.us.i569, %bb2.preheader.us.i563
  %result.03.us.i565 = phi i64 [ 0, %bb2.preheader.us.i563 ], [ %3884, %bb1.us.i569 ] ; <i64> [#uses=1]
  %n.02.us.i566 = phi i32 [ 0, %bb2.preheader.us.i563 ], [ %3885, %bb1.us.i569 ] ; <i32> [#uses=2]
  %scevgep.i567 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i566 ; <i64*> [#uses=1]
  %3882 = load i64* %scevgep.i567, align 8        ; <i64> [#uses=1]
  %3883 = add i64 %3882, %result.03.us.i565       ; <i64> [#uses=1]
  %3884 = add i64 %3883, %3877                    ; <i64> [#uses=2]
  %3885 = add nsw i32 %n.02.us.i566, 1            ; <i32> [#uses=2]
  %exitcond.i568 = icmp eq i32 %3885, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i568, label %bb2.bb3_crit_edge.us.i570, label %bb1.us.i569

bb2.bb3_crit_edge.us.i570:                        ; preds = %bb1.us.i569
  %3886 = icmp eq i64 %3879, %3884                ; <i1> [#uses=1]
  br i1 %3886, label %_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i564

bb5.i571:                                         ; preds = %_Z26check_shifted_variable_sumIy32custom_divide_multiple_variable2IyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Iy31custom_divide_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3887 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3888 = sub i32 %3887, %3874                    ; <i32> [#uses=1]
  %3889 = sitofp i32 %3888 to double              ; <double> [#uses=1]
  %3890 = fdiv double %3889, 1.000000e+06         ; <double> [#uses=1]
  %.not2996 = icmp ne %struct.one_result* %results.134, null ; <i1> [#uses=1]
  %3891 = icmp sgt i32 %allocated_results.134, 136 ; <i1> [#uses=1]
  %or.cond2997 = and i1 %3891, %.not2996          ; <i1> [#uses=1]
  br i1 %or.cond2997, label %_Z14test_variable4Iy32custom_divide_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i573

bb1.i.i573:                                       ; preds = %bb5.i571
  %3892 = add nsw i32 %allocated_results.134, 10  ; <i32> [#uses=3]
  %3893 = mul i32 %3892, 12                       ; <i32> [#uses=1]
  %3894 = bitcast %struct.one_result* %results.134 to i8* ; <i8*> [#uses=1]
  %3895 = tail call i8* @realloc(i8* %3894, i32 %3893) nounwind ; <i8*> [#uses=2]
  %3896 = bitcast i8* %3895 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3897 = icmp eq i8* %3895, null                 ; <i1> [#uses=1]
  br i1 %3897, label %bb2.i.i574, label %_Z14test_variable4Iy32custom_divide_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i574:                                       ; preds = %bb1.i.i573
  %3898 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3892) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy32custom_divide_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i573, %bb5.i571
  %results.135 = phi %struct.one_result* [ %3896, %bb1.i.i573 ], [ %results.134, %bb5.i571 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.135 = phi i32 [ %3892, %bb1.i.i573 ], [ %allocated_results.134, %bb5.i571 ] ; <i32> [#uses=3]
  %3899 = phi %struct.one_result* [ %3896, %bb1.i.i573 ], [ %results.134, %bb5.i571 ] ; <%struct.one_result*> [#uses=2]
  %3900 = getelementptr inbounds %struct.one_result* %3899, i32 136, i32 0 ; <double*> [#uses=1]
  store double %3890, double* %3900, align 4
  %3901 = getelementptr inbounds %struct.one_result* %3899, i32 136, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str148, i32 0, i32 0), i8** %3901, align 4
  %3902 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph7.i, label %bb5.i556

bb.nph7.i:                                        ; preds = %_Z14test_variable4Iy32custom_divide_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3903 = mul i64 %3597, %3596                    ; <i64> [#uses=1]
  %3904 = udiv i64 %3903, %3599                   ; <i64> [#uses=2]
  %3905 = add i64 %3593, %3595                    ; <i64> [#uses=1]
  %3906 = sub i64 %3905, %3904                    ; <i64> [#uses=1]
  %3907 = mul i64 %3906, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i550

bb2.preheader.us.i550:                            ; preds = %_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph7.i
  %i.06.us.i = phi i32 [ 0, %bb.nph7.i ], [ %tmp.i549, %_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i549 = add i32 %i.06.us.i, 1               ; <i32> [#uses=2]
  br label %bb1.us.i554

_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i555, %bb.i1.us.i551
  %3908 = icmp slt i32 %tmp.i549, %iterations.0   ; <i1> [#uses=1]
  br i1 %3908, label %bb2.preheader.us.i550, label %bb5.i556

bb.i1.us.i551:                                    ; preds = %bb2.bb3_crit_edge.us.i555
  %3909 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 137) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i554:                                      ; preds = %bb1.us.i554, %bb2.preheader.us.i550
  %result.04.us.i = phi i64 [ 0, %bb2.preheader.us.i550 ], [ %3913, %bb1.us.i554 ] ; <i64> [#uses=1]
  %n.03.us.i = phi i32 [ 0, %bb2.preheader.us.i550 ], [ %3914, %bb1.us.i554 ] ; <i32> [#uses=2]
  %scevgep.i552 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.03.us.i ; <i64*> [#uses=1]
  %3910 = load i64* %scevgep.i552, align 8        ; <i64> [#uses=1]
  %3911 = add i64 %result.04.us.i, %3595          ; <i64> [#uses=1]
  %3912 = add i64 %3911, %3910                    ; <i64> [#uses=1]
  %3913 = sub i64 %3912, %3904                    ; <i64> [#uses=2]
  %3914 = add nsw i32 %n.03.us.i, 1               ; <i32> [#uses=2]
  %exitcond.i553 = icmp eq i32 %3914, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i553, label %bb2.bb3_crit_edge.us.i555, label %bb1.us.i554

bb2.bb3_crit_edge.us.i555:                        ; preds = %bb1.us.i554
  %3915 = icmp eq i64 %3907, %3913                ; <i1> [#uses=1]
  br i1 %3915, label %_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i551

bb5.i556:                                         ; preds = %_Z26check_shifted_variable_sumIy30custom_mixed_multiple_variableIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable4Iy32custom_divide_multiple_variable2IyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3916 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3917 = sub i32 %3916, %3902                    ; <i32> [#uses=1]
  %3918 = sitofp i32 %3917 to double              ; <double> [#uses=1]
  %3919 = fdiv double %3918, 1.000000e+06         ; <double> [#uses=1]
  %.not2998 = icmp ne %struct.one_result* %results.135, null ; <i1> [#uses=1]
  %3920 = icmp sgt i32 %allocated_results.135, 137 ; <i1> [#uses=1]
  %or.cond2999 = and i1 %3920, %.not2998          ; <i1> [#uses=1]
  br i1 %or.cond2999, label %_Z14test_variable4Iy30custom_mixed_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i558

bb1.i.i558:                                       ; preds = %bb5.i556
  %3921 = add nsw i32 %allocated_results.135, 10  ; <i32> [#uses=3]
  %3922 = mul i32 %3921, 12                       ; <i32> [#uses=1]
  %3923 = bitcast %struct.one_result* %results.135 to i8* ; <i8*> [#uses=1]
  %3924 = tail call i8* @realloc(i8* %3923, i32 %3922) nounwind ; <i8*> [#uses=2]
  %3925 = bitcast i8* %3924 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3926 = icmp eq i8* %3924, null                 ; <i1> [#uses=1]
  br i1 %3926, label %bb2.i.i559, label %_Z14test_variable4Iy30custom_mixed_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i559:                                       ; preds = %bb1.i.i558
  %3927 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3921) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy30custom_mixed_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i558, %bb5.i556
  %results.136 = phi %struct.one_result* [ %3925, %bb1.i.i558 ], [ %results.135, %bb5.i556 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.136 = phi i32 [ %3921, %bb1.i.i558 ], [ %allocated_results.135, %bb5.i556 ] ; <i32> [#uses=3]
  %3928 = phi %struct.one_result* [ %3925, %bb1.i.i558 ], [ %results.135, %bb5.i556 ] ; <%struct.one_result*> [#uses=2]
  %3929 = getelementptr inbounds %struct.one_result* %3928, i32 137, i32 0 ; <double*> [#uses=1]
  store double %3919, double* %3929, align 4
  %3930 = getelementptr inbounds %struct.one_result* %3928, i32 137, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str149, i32 0, i32 0), i8** %3930, align 4
  %3931 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i534, label %bb5.i545

bb.nph6.i534:                                     ; preds = %_Z14test_variable4Iy30custom_mixed_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3932 = and i64 %3593, %3595                    ; <i64> [#uses=1]
  %3933 = mul i64 %3932, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i537

bb2.preheader.us.i537:                            ; preds = %_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i, %bb.nph6.i534
  %i.05.us.i535 = phi i32 [ 0, %bb.nph6.i534 ], [ %tmp.i536, %_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i536 = add i32 %i.05.us.i535, 1            ; <i32> [#uses=2]
  br label %bb1.us.i543

_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i544, %bb.i1.us.i538
  %3934 = icmp slt i32 %tmp.i536, %iterations.0   ; <i1> [#uses=1]
  br i1 %3934, label %bb2.preheader.us.i537, label %bb5.i545

bb.i1.us.i538:                                    ; preds = %bb2.bb3_crit_edge.us.i544
  %3935 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 138) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i

bb1.us.i543:                                      ; preds = %bb1.us.i543, %bb2.preheader.us.i537
  %result.03.us.i539 = phi i64 [ 0, %bb2.preheader.us.i537 ], [ %3938, %bb1.us.i543 ] ; <i64> [#uses=1]
  %n.02.us.i540 = phi i32 [ 0, %bb2.preheader.us.i537 ], [ %3939, %bb1.us.i543 ] ; <i32> [#uses=2]
  %scevgep.i541 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i540 ; <i64*> [#uses=1]
  %3936 = load i64* %scevgep.i541, align 8        ; <i64> [#uses=1]
  %3937 = and i64 %3936, %3595                    ; <i64> [#uses=1]
  %3938 = add i64 %3937, %result.03.us.i539       ; <i64> [#uses=2]
  %3939 = add nsw i32 %n.02.us.i540, 1            ; <i32> [#uses=2]
  %exitcond.i542 = icmp eq i32 %3939, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i542, label %bb2.bb3_crit_edge.us.i544, label %bb1.us.i543

bb2.bb3_crit_edge.us.i544:                        ; preds = %bb1.us.i543
  %3940 = icmp eq i64 %3933, %3938                ; <i1> [#uses=1]
  br i1 %3940, label %_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i, label %bb.i1.us.i538

bb5.i545:                                         ; preds = %_Z26check_shifted_variable_sumIy19custom_variable_andIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy30custom_mixed_multiple_variableIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3941 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3942 = sub i32 %3941, %3931                    ; <i32> [#uses=1]
  %3943 = sitofp i32 %3942 to double              ; <double> [#uses=1]
  %3944 = fdiv double %3943, 1.000000e+06         ; <double> [#uses=1]
  %.not3000 = icmp ne %struct.one_result* %results.136, null ; <i1> [#uses=1]
  %3945 = icmp sgt i32 %allocated_results.136, 138 ; <i1> [#uses=1]
  %or.cond3001 = and i1 %3945, %.not3000          ; <i1> [#uses=1]
  br i1 %or.cond3001, label %_Z14test_variable1Iy19custom_variable_andIyEEvPT_iS2_PKc.exit, label %bb1.i.i547

bb1.i.i547:                                       ; preds = %bb5.i545
  %3946 = add nsw i32 %allocated_results.136, 10  ; <i32> [#uses=3]
  %3947 = mul i32 %3946, 12                       ; <i32> [#uses=1]
  %3948 = bitcast %struct.one_result* %results.136 to i8* ; <i8*> [#uses=1]
  %3949 = tail call i8* @realloc(i8* %3948, i32 %3947) nounwind ; <i8*> [#uses=2]
  %3950 = bitcast i8* %3949 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3951 = icmp eq i8* %3949, null                 ; <i1> [#uses=1]
  br i1 %3951, label %bb2.i.i548, label %_Z14test_variable1Iy19custom_variable_andIyEEvPT_iS2_PKc.exit

bb2.i.i548:                                       ; preds = %bb1.i.i547
  %3952 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3946) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy19custom_variable_andIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i547, %bb5.i545
  %results.137 = phi %struct.one_result* [ %3950, %bb1.i.i547 ], [ %results.136, %bb5.i545 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.137 = phi i32 [ %3946, %bb1.i.i547 ], [ %allocated_results.136, %bb5.i545 ] ; <i32> [#uses=3]
  %3953 = phi %struct.one_result* [ %3950, %bb1.i.i547 ], [ %results.136, %bb5.i545 ] ; <%struct.one_result*> [#uses=2]
  %3954 = getelementptr inbounds %struct.one_result* %3953, i32 138, i32 0 ; <double*> [#uses=1]
  store double %3944, double* %3954, align 4
  %3955 = getelementptr inbounds %struct.one_result* %3953, i32 138, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str150, i32 0, i32 0), i8** %3955, align 4
  %3956 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i519, label %bb5.i530

bb.nph6.i519:                                     ; preds = %_Z14test_variable1Iy19custom_variable_andIyEEvPT_iS2_PKc.exit
  %3957 = and i64 %3596, %3595                    ; <i64> [#uses=1]
  %3958 = and i64 %3957, %3597                    ; <i64> [#uses=1]
  %3959 = and i64 %3958, %3599                    ; <i64> [#uses=2]
  %3960 = and i64 %3959, %3593                    ; <i64> [#uses=1]
  %3961 = mul i64 %3960, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i522

bb2.preheader.us.i522:                            ; preds = %_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i519
  %i.05.us.i520 = phi i32 [ 0, %bb.nph6.i519 ], [ %tmp.i521, %_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i521 = add i32 %i.05.us.i520, 1            ; <i32> [#uses=2]
  br label %bb1.us.i528

_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i529, %bb.i1.us.i523
  %3962 = icmp slt i32 %tmp.i521, %iterations.0   ; <i1> [#uses=1]
  br i1 %3962, label %bb2.preheader.us.i522, label %bb5.i530

bb.i1.us.i523:                                    ; preds = %bb2.bb3_crit_edge.us.i529
  %3963 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 139) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i528:                                      ; preds = %bb1.us.i528, %bb2.preheader.us.i522
  %result.03.us.i524 = phi i64 [ 0, %bb2.preheader.us.i522 ], [ %3966, %bb1.us.i528 ] ; <i64> [#uses=1]
  %n.02.us.i525 = phi i32 [ 0, %bb2.preheader.us.i522 ], [ %3967, %bb1.us.i528 ] ; <i32> [#uses=2]
  %scevgep.i526 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i525 ; <i64*> [#uses=1]
  %3964 = load i64* %scevgep.i526, align 8        ; <i64> [#uses=1]
  %3965 = and i64 %3959, %3964                    ; <i64> [#uses=1]
  %3966 = add i64 %3965, %result.03.us.i524       ; <i64> [#uses=2]
  %3967 = add nsw i32 %n.02.us.i525, 1            ; <i32> [#uses=2]
  %exitcond.i527 = icmp eq i32 %3967, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i527, label %bb2.bb3_crit_edge.us.i529, label %bb1.us.i528

bb2.bb3_crit_edge.us.i529:                        ; preds = %bb1.us.i528
  %3968 = icmp eq i64 %3961, %3966                ; <i1> [#uses=1]
  br i1 %3968, label %_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i523

bb5.i530:                                         ; preds = %_Z26check_shifted_variable_sumIy28custom_multiple_variable_andIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy19custom_variable_andIyEEvPT_iS2_PKc.exit
  %3969 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3970 = sub i32 %3969, %3956                    ; <i32> [#uses=1]
  %3971 = sitofp i32 %3970 to double              ; <double> [#uses=1]
  %3972 = fdiv double %3971, 1.000000e+06         ; <double> [#uses=1]
  %.not3002 = icmp ne %struct.one_result* %results.137, null ; <i1> [#uses=1]
  %3973 = icmp sgt i32 %allocated_results.137, 139 ; <i1> [#uses=1]
  %or.cond3003 = and i1 %3973, %.not3002          ; <i1> [#uses=1]
  br i1 %or.cond3003, label %_Z14test_variable4Iy28custom_multiple_variable_andIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i532

bb1.i.i532:                                       ; preds = %bb5.i530
  %3974 = add nsw i32 %allocated_results.137, 10  ; <i32> [#uses=3]
  %3975 = mul i32 %3974, 12                       ; <i32> [#uses=1]
  %3976 = bitcast %struct.one_result* %results.137 to i8* ; <i8*> [#uses=1]
  %3977 = tail call i8* @realloc(i8* %3976, i32 %3975) nounwind ; <i8*> [#uses=2]
  %3978 = bitcast i8* %3977 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %3979 = icmp eq i8* %3977, null                 ; <i1> [#uses=1]
  br i1 %3979, label %bb2.i.i533, label %_Z14test_variable4Iy28custom_multiple_variable_andIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i533:                                       ; preds = %bb1.i.i532
  %3980 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3974) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy28custom_multiple_variable_andIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i532, %bb5.i530
  %results.138 = phi %struct.one_result* [ %3978, %bb1.i.i532 ], [ %results.137, %bb5.i530 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.138 = phi i32 [ %3974, %bb1.i.i532 ], [ %allocated_results.137, %bb5.i530 ] ; <i32> [#uses=3]
  %3981 = phi %struct.one_result* [ %3978, %bb1.i.i532 ], [ %results.137, %bb5.i530 ] ; <%struct.one_result*> [#uses=2]
  %3982 = getelementptr inbounds %struct.one_result* %3981, i32 139, i32 0 ; <double*> [#uses=1]
  store double %3972, double* %3982, align 4
  %3983 = getelementptr inbounds %struct.one_result* %3981, i32 139, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str151, i32 0, i32 0), i8** %3983, align 4
  %3984 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i504, label %bb5.i515

bb.nph6.i504:                                     ; preds = %_Z14test_variable4Iy28custom_multiple_variable_andIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3985 = or i64 %3593, %3595                     ; <i64> [#uses=1]
  %3986 = mul i64 %3985, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i507

bb2.preheader.us.i507:                            ; preds = %_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i, %bb.nph6.i504
  %i.05.us.i505 = phi i32 [ 0, %bb.nph6.i504 ], [ %tmp.i506, %_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i506 = add i32 %i.05.us.i505, 1            ; <i32> [#uses=2]
  br label %bb1.us.i513

_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i514, %bb.i1.us.i508
  %3987 = icmp slt i32 %tmp.i506, %iterations.0   ; <i1> [#uses=1]
  br i1 %3987, label %bb2.preheader.us.i507, label %bb5.i515

bb.i1.us.i508:                                    ; preds = %bb2.bb3_crit_edge.us.i514
  %3988 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 140) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i

bb1.us.i513:                                      ; preds = %bb1.us.i513, %bb2.preheader.us.i507
  %result.03.us.i509 = phi i64 [ 0, %bb2.preheader.us.i507 ], [ %3991, %bb1.us.i513 ] ; <i64> [#uses=1]
  %n.02.us.i510 = phi i32 [ 0, %bb2.preheader.us.i507 ], [ %3992, %bb1.us.i513 ] ; <i32> [#uses=2]
  %scevgep.i511 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i510 ; <i64*> [#uses=1]
  %3989 = load i64* %scevgep.i511, align 8        ; <i64> [#uses=1]
  %3990 = or i64 %3989, %3595                     ; <i64> [#uses=1]
  %3991 = add i64 %3990, %result.03.us.i509       ; <i64> [#uses=2]
  %3992 = add nsw i32 %n.02.us.i510, 1            ; <i32> [#uses=2]
  %exitcond.i512 = icmp eq i32 %3992, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i512, label %bb2.bb3_crit_edge.us.i514, label %bb1.us.i513

bb2.bb3_crit_edge.us.i514:                        ; preds = %bb1.us.i513
  %3993 = icmp eq i64 %3986, %3991                ; <i1> [#uses=1]
  br i1 %3993, label %_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i, label %bb.i1.us.i508

bb5.i515:                                         ; preds = %_Z26check_shifted_variable_sumIy18custom_variable_orIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy28custom_multiple_variable_andIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %3994 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %3995 = sub i32 %3994, %3984                    ; <i32> [#uses=1]
  %3996 = sitofp i32 %3995 to double              ; <double> [#uses=1]
  %3997 = fdiv double %3996, 1.000000e+06         ; <double> [#uses=1]
  %.not3004 = icmp ne %struct.one_result* %results.138, null ; <i1> [#uses=1]
  %3998 = icmp sgt i32 %allocated_results.138, 140 ; <i1> [#uses=1]
  %or.cond3005 = and i1 %3998, %.not3004          ; <i1> [#uses=1]
  br i1 %or.cond3005, label %_Z14test_variable1Iy18custom_variable_orIyEEvPT_iS2_PKc.exit, label %bb1.i.i517

bb1.i.i517:                                       ; preds = %bb5.i515
  %3999 = add nsw i32 %allocated_results.138, 10  ; <i32> [#uses=3]
  %4000 = mul i32 %3999, 12                       ; <i32> [#uses=1]
  %4001 = bitcast %struct.one_result* %results.138 to i8* ; <i8*> [#uses=1]
  %4002 = tail call i8* @realloc(i8* %4001, i32 %4000) nounwind ; <i8*> [#uses=2]
  %4003 = bitcast i8* %4002 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4004 = icmp eq i8* %4002, null                 ; <i1> [#uses=1]
  br i1 %4004, label %bb2.i.i518, label %_Z14test_variable1Iy18custom_variable_orIyEEvPT_iS2_PKc.exit

bb2.i.i518:                                       ; preds = %bb1.i.i517
  %4005 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %3999) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy18custom_variable_orIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i517, %bb5.i515
  %results.139 = phi %struct.one_result* [ %4003, %bb1.i.i517 ], [ %results.138, %bb5.i515 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.139 = phi i32 [ %3999, %bb1.i.i517 ], [ %allocated_results.138, %bb5.i515 ] ; <i32> [#uses=3]
  %4006 = phi %struct.one_result* [ %4003, %bb1.i.i517 ], [ %results.138, %bb5.i515 ] ; <%struct.one_result*> [#uses=2]
  %4007 = getelementptr inbounds %struct.one_result* %4006, i32 140, i32 0 ; <double*> [#uses=1]
  store double %3997, double* %4007, align 4
  %4008 = getelementptr inbounds %struct.one_result* %4006, i32 140, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([21 x i8]* @.str152, i32 0, i32 0), i8** %4008, align 4
  %4009 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i489, label %bb5.i500

bb.nph6.i489:                                     ; preds = %_Z14test_variable1Iy18custom_variable_orIyEEvPT_iS2_PKc.exit
  %4010 = or i64 %3596, %3595                     ; <i64> [#uses=1]
  %4011 = or i64 %4010, %3597                     ; <i64> [#uses=1]
  %4012 = or i64 %4011, %3599                     ; <i64> [#uses=2]
  %4013 = or i64 %4012, %3593                     ; <i64> [#uses=1]
  %4014 = mul i64 %4013, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i492

bb2.preheader.us.i492:                            ; preds = %_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i489
  %i.05.us.i490 = phi i32 [ 0, %bb.nph6.i489 ], [ %tmp.i491, %_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i491 = add i32 %i.05.us.i490, 1            ; <i32> [#uses=2]
  br label %bb1.us.i498

_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i499, %bb.i1.us.i493
  %4015 = icmp slt i32 %tmp.i491, %iterations.0   ; <i1> [#uses=1]
  br i1 %4015, label %bb2.preheader.us.i492, label %bb5.i500

bb.i1.us.i493:                                    ; preds = %bb2.bb3_crit_edge.us.i499
  %4016 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 141) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i498:                                      ; preds = %bb1.us.i498, %bb2.preheader.us.i492
  %result.03.us.i494 = phi i64 [ 0, %bb2.preheader.us.i492 ], [ %4019, %bb1.us.i498 ] ; <i64> [#uses=1]
  %n.02.us.i495 = phi i32 [ 0, %bb2.preheader.us.i492 ], [ %4020, %bb1.us.i498 ] ; <i32> [#uses=2]
  %scevgep.i496 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i495 ; <i64*> [#uses=1]
  %4017 = load i64* %scevgep.i496, align 8        ; <i64> [#uses=1]
  %4018 = or i64 %4012, %4017                     ; <i64> [#uses=1]
  %4019 = add i64 %4018, %result.03.us.i494       ; <i64> [#uses=2]
  %4020 = add nsw i32 %n.02.us.i495, 1            ; <i32> [#uses=2]
  %exitcond.i497 = icmp eq i32 %4020, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i497, label %bb2.bb3_crit_edge.us.i499, label %bb1.us.i498

bb2.bb3_crit_edge.us.i499:                        ; preds = %bb1.us.i498
  %4021 = icmp eq i64 %4014, %4019                ; <i1> [#uses=1]
  br i1 %4021, label %_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i493

bb5.i500:                                         ; preds = %_Z26check_shifted_variable_sumIy27custom_multiple_variable_orIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy18custom_variable_orIyEEvPT_iS2_PKc.exit
  %4022 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4023 = sub i32 %4022, %4009                    ; <i32> [#uses=1]
  %4024 = sitofp i32 %4023 to double              ; <double> [#uses=1]
  %4025 = fdiv double %4024, 1.000000e+06         ; <double> [#uses=1]
  %.not3006 = icmp ne %struct.one_result* %results.139, null ; <i1> [#uses=1]
  %4026 = icmp sgt i32 %allocated_results.139, 141 ; <i1> [#uses=1]
  %or.cond3007 = and i1 %4026, %.not3006          ; <i1> [#uses=1]
  br i1 %or.cond3007, label %_Z14test_variable4Iy27custom_multiple_variable_orIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i502

bb1.i.i502:                                       ; preds = %bb5.i500
  %4027 = add nsw i32 %allocated_results.139, 10  ; <i32> [#uses=3]
  %4028 = mul i32 %4027, 12                       ; <i32> [#uses=1]
  %4029 = bitcast %struct.one_result* %results.139 to i8* ; <i8*> [#uses=1]
  %4030 = tail call i8* @realloc(i8* %4029, i32 %4028) nounwind ; <i8*> [#uses=2]
  %4031 = bitcast i8* %4030 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4032 = icmp eq i8* %4030, null                 ; <i1> [#uses=1]
  br i1 %4032, label %bb2.i.i503, label %_Z14test_variable4Iy27custom_multiple_variable_orIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i503:                                       ; preds = %bb1.i.i502
  %4033 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4027) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy27custom_multiple_variable_orIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i502, %bb5.i500
  %results.140 = phi %struct.one_result* [ %4031, %bb1.i.i502 ], [ %results.139, %bb5.i500 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.140 = phi i32 [ %4027, %bb1.i.i502 ], [ %allocated_results.139, %bb5.i500 ] ; <i32> [#uses=3]
  %4034 = phi %struct.one_result* [ %4031, %bb1.i.i502 ], [ %results.139, %bb5.i500 ] ; <%struct.one_result*> [#uses=2]
  %4035 = getelementptr inbounds %struct.one_result* %4034, i32 141, i32 0 ; <double*> [#uses=1]
  store double %4025, double* %4035, align 4
  %4036 = getelementptr inbounds %struct.one_result* %4034, i32 141, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str153, i32 0, i32 0), i8** %4036, align 4
  %4037 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i474, label %bb5.i485

bb.nph6.i474:                                     ; preds = %_Z14test_variable4Iy27custom_multiple_variable_orIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %4038 = xor i64 %3593, %3595                    ; <i64> [#uses=1]
  %4039 = mul i64 %4038, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i477

bb2.preheader.us.i477:                            ; preds = %_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i, %bb.nph6.i474
  %i.05.us.i475 = phi i32 [ 0, %bb.nph6.i474 ], [ %tmp.i476, %_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i476 = add i32 %i.05.us.i475, 1            ; <i32> [#uses=2]
  br label %bb1.us.i483

_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i484, %bb.i1.us.i478
  %4040 = icmp slt i32 %tmp.i476, %iterations.0   ; <i1> [#uses=1]
  br i1 %4040, label %bb2.preheader.us.i477, label %bb5.i485

bb.i1.us.i478:                                    ; preds = %bb2.bb3_crit_edge.us.i484
  %4041 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 142) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i

bb1.us.i483:                                      ; preds = %bb1.us.i483, %bb2.preheader.us.i477
  %result.03.us.i479 = phi i64 [ 0, %bb2.preheader.us.i477 ], [ %4044, %bb1.us.i483 ] ; <i64> [#uses=1]
  %n.02.us.i480 = phi i32 [ 0, %bb2.preheader.us.i477 ], [ %4045, %bb1.us.i483 ] ; <i32> [#uses=2]
  %scevgep.i481 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i480 ; <i64*> [#uses=1]
  %4042 = load i64* %scevgep.i481, align 8        ; <i64> [#uses=1]
  %4043 = xor i64 %4042, %3595                    ; <i64> [#uses=1]
  %4044 = add i64 %4043, %result.03.us.i479       ; <i64> [#uses=2]
  %4045 = add nsw i32 %n.02.us.i480, 1            ; <i32> [#uses=2]
  %exitcond.i482 = icmp eq i32 %4045, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i482, label %bb2.bb3_crit_edge.us.i484, label %bb1.us.i483

bb2.bb3_crit_edge.us.i484:                        ; preds = %bb1.us.i483
  %4046 = icmp eq i64 %4039, %4044                ; <i1> [#uses=1]
  br i1 %4046, label %_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i, label %bb.i1.us.i478

bb5.i485:                                         ; preds = %_Z26check_shifted_variable_sumIy19custom_variable_xorIyEEvT_S2_.exit.us.i, %_Z14test_variable4Iy27custom_multiple_variable_orIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %4047 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4048 = sub i32 %4047, %4037                    ; <i32> [#uses=1]
  %4049 = sitofp i32 %4048 to double              ; <double> [#uses=1]
  %4050 = fdiv double %4049, 1.000000e+06         ; <double> [#uses=1]
  %.not3008 = icmp ne %struct.one_result* %results.140, null ; <i1> [#uses=1]
  %4051 = icmp sgt i32 %allocated_results.140, 142 ; <i1> [#uses=1]
  %or.cond3009 = and i1 %4051, %.not3008          ; <i1> [#uses=1]
  br i1 %or.cond3009, label %_Z14test_variable1Iy19custom_variable_xorIyEEvPT_iS2_PKc.exit, label %bb1.i.i487

bb1.i.i487:                                       ; preds = %bb5.i485
  %4052 = add nsw i32 %allocated_results.140, 10  ; <i32> [#uses=3]
  %4053 = mul i32 %4052, 12                       ; <i32> [#uses=1]
  %4054 = bitcast %struct.one_result* %results.140 to i8* ; <i8*> [#uses=1]
  %4055 = tail call i8* @realloc(i8* %4054, i32 %4053) nounwind ; <i8*> [#uses=2]
  %4056 = bitcast i8* %4055 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4057 = icmp eq i8* %4055, null                 ; <i1> [#uses=1]
  br i1 %4057, label %bb2.i.i488, label %_Z14test_variable1Iy19custom_variable_xorIyEEvPT_iS2_PKc.exit

bb2.i.i488:                                       ; preds = %bb1.i.i487
  %4058 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4052) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Iy19custom_variable_xorIyEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i487, %bb5.i485
  %results.141 = phi %struct.one_result* [ %4056, %bb1.i.i487 ], [ %results.140, %bb5.i485 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.141 = phi i32 [ %4052, %bb1.i.i487 ], [ %allocated_results.140, %bb5.i485 ] ; <i32> [#uses=3]
  %4059 = phi %struct.one_result* [ %4056, %bb1.i.i487 ], [ %results.140, %bb5.i485 ] ; <%struct.one_result*> [#uses=2]
  %4060 = getelementptr inbounds %struct.one_result* %4059, i32 142, i32 0 ; <double*> [#uses=1]
  store double %4050, double* %4060, align 4
  %4061 = getelementptr inbounds %struct.one_result* %4059, i32 142, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str154, i32 0, i32 0), i8** %4061, align 4
  %4062 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i459, label %bb5.i470

bb.nph6.i459:                                     ; preds = %_Z14test_variable1Iy19custom_variable_xorIyEEvPT_iS2_PKc.exit
  %4063 = xor i64 %3596, %3595                    ; <i64> [#uses=1]
  %4064 = xor i64 %4063, %3597                    ; <i64> [#uses=1]
  %4065 = xor i64 %4064, %3599                    ; <i64> [#uses=2]
  %4066 = xor i64 %4065, %3593                    ; <i64> [#uses=1]
  %4067 = mul i64 %4066, 8000                     ; <i64> [#uses=1]
  br label %bb2.preheader.us.i462

bb2.preheader.us.i462:                            ; preds = %_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i, %bb.nph6.i459
  %i.05.us.i460 = phi i32 [ 0, %bb.nph6.i459 ], [ %tmp.i461, %_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i ] ; <i32> [#uses=1]
  %tmp.i461 = add i32 %i.05.us.i460, 1            ; <i32> [#uses=2]
  br label %bb1.us.i468

_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i: ; preds = %bb2.bb3_crit_edge.us.i469, %bb.i1.us.i463
  %4068 = icmp slt i32 %tmp.i461, %iterations.0   ; <i1> [#uses=1]
  br i1 %4068, label %bb2.preheader.us.i462, label %bb5.i470

bb.i1.us.i463:                                    ; preds = %bb2.bb3_crit_edge.us.i469
  %4069 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 143) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i

bb1.us.i468:                                      ; preds = %bb1.us.i468, %bb2.preheader.us.i462
  %result.03.us.i464 = phi i64 [ 0, %bb2.preheader.us.i462 ], [ %4072, %bb1.us.i468 ] ; <i64> [#uses=1]
  %n.02.us.i465 = phi i32 [ 0, %bb2.preheader.us.i462 ], [ %4073, %bb1.us.i468 ] ; <i32> [#uses=2]
  %scevgep.i466 = getelementptr [8000 x i64]* @data64unsigned, i32 0, i32 %n.02.us.i465 ; <i64*> [#uses=1]
  %4070 = load i64* %scevgep.i466, align 8        ; <i64> [#uses=1]
  %4071 = xor i64 %4065, %4070                    ; <i64> [#uses=1]
  %4072 = add i64 %4071, %result.03.us.i464       ; <i64> [#uses=2]
  %4073 = add nsw i32 %n.02.us.i465, 1            ; <i32> [#uses=2]
  %exitcond.i467 = icmp eq i32 %4073, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i467, label %bb2.bb3_crit_edge.us.i469, label %bb1.us.i468

bb2.bb3_crit_edge.us.i469:                        ; preds = %bb1.us.i468
  %4074 = icmp eq i64 %4067, %4072                ; <i1> [#uses=1]
  br i1 %4074, label %_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i, label %bb.i1.us.i463

bb5.i470:                                         ; preds = %_Z26check_shifted_variable_sumIy28custom_multiple_variable_xorIyEEvT_S2_S2_S2_S2_.exit.us.i, %_Z14test_variable1Iy19custom_variable_xorIyEEvPT_iS2_PKc.exit
  %4075 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4076 = sub i32 %4075, %4062                    ; <i32> [#uses=1]
  %4077 = sitofp i32 %4076 to double              ; <double> [#uses=1]
  %4078 = fdiv double %4077, 1.000000e+06         ; <double> [#uses=1]
  %.not3010 = icmp ne %struct.one_result* %results.141, null ; <i1> [#uses=1]
  %4079 = icmp sgt i32 %allocated_results.141, 143 ; <i1> [#uses=1]
  %or.cond3011 = and i1 %4079, %.not3010          ; <i1> [#uses=1]
  br i1 %or.cond3011, label %_Z14test_variable4Iy28custom_multiple_variable_xorIyEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i472

bb1.i.i472:                                       ; preds = %bb5.i470
  %4080 = add nsw i32 %allocated_results.141, 10  ; <i32> [#uses=3]
  %4081 = mul i32 %4080, 12                       ; <i32> [#uses=1]
  %4082 = bitcast %struct.one_result* %results.141 to i8* ; <i8*> [#uses=1]
  %4083 = tail call i8* @realloc(i8* %4082, i32 %4081) nounwind ; <i8*> [#uses=2]
  %4084 = bitcast i8* %4083 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4085 = icmp eq i8* %4083, null                 ; <i1> [#uses=1]
  br i1 %4085, label %bb2.i.i473, label %_Z14test_variable4Iy28custom_multiple_variable_xorIyEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i473:                                       ; preds = %bb1.i.i472
  %4086 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4080) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Iy28custom_multiple_variable_xorIyEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i472, %bb5.i470
  %results.142 = phi %struct.one_result* [ %4084, %bb1.i.i472 ], [ %results.141, %bb5.i470 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.142 = phi i32 [ %4080, %bb1.i.i472 ], [ %allocated_results.141, %bb5.i470 ] ; <i32> [#uses=3]
  %4087 = phi %struct.one_result* [ %4084, %bb1.i.i472 ], [ %results.141, %bb5.i470 ] ; <%struct.one_result*> [#uses=2]
  %4088 = getelementptr inbounds %struct.one_result* %4087, i32 143, i32 0 ; <double*> [#uses=1]
  store double %4078, double* %4088, align 4
  %4089 = getelementptr inbounds %struct.one_result* %4087, i32 143, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str155, i32 0, i32 0), i8** %4089, align 4
  %4090 = fptrunc double %init_value.0 to float   ; <float> [#uses=13]
  br label %bb.i38

bb.i38:                                           ; preds = %bb.i38, %_Z14test_variable4Iy28custom_multiple_variable_xorIyEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i34 = phi i32 [ 0, %_Z14test_variable4Iy28custom_multiple_variable_xorIyEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i36, %bb.i38 ] ; <i32> [#uses=2]
  %tmp.i36 = add i32 %indvar.i34, 1               ; <i32> [#uses=2]
  %first_addr.01.i35 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %indvar.i34 ; <float*> [#uses=1]
  store float %4090, float* %first_addr.01.i35, align 4
  %scevgep.i37.idx.mask = and i32 %tmp.i36, 1073741823 ; <i32> [#uses=1]
  %4091 = icmp eq i32 %scevgep.i37.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %4091, label %_Z4fillIPffEvT_S1_T0_.exit, label %bb.i38

_Z4fillIPffEvT_S1_T0_.exit:                       ; preds = %bb.i38
  %4092 = fptrunc double %temp.0 to float         ; <float> [#uses=25]
  %4093 = fmul float %4092, 2.000000e+00          ; <float> [#uses=12]
  %4094 = fadd float %4092, 2.000000e+00          ; <float> [#uses=12]
  %4095 = fdiv float %4093, %4094                 ; <float> [#uses=1]
  %4096 = fadd float %4095, %4092                 ; <float> [#uses=11]
  %4097 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i451, label %bb5.i455

bb1.i442:                                         ; preds = %bb2.preheader.i454, %bb1.i442
  %result.03.i438 = phi float [ 0.000000e+00, %bb2.preheader.i454 ], [ %4100, %bb1.i442 ] ; <float> [#uses=1]
  %n.02.i439 = phi i32 [ 0, %bb2.preheader.i454 ], [ %4101, %bb1.i442 ] ; <i32> [#uses=2]
  %scevgep.i440 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i439 ; <float*> [#uses=1]
  %4098 = load float* %scevgep.i440, align 4      ; <float> [#uses=1]
  %4099 = fadd float %4098, %4092                 ; <float> [#uses=1]
  %4100 = fadd float %4099, %result.03.i438       ; <float> [#uses=4]
  %4101 = add nsw i32 %n.02.i439, 1               ; <i32> [#uses=2]
  %exitcond.i441 = icmp eq i32 %4101, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i441, label %bb3.i444, label %bb1.i442

bb3.i444:                                         ; preds = %bb1.i442
  %4102 = fsub float %4100, %4112                 ; <float> [#uses=2]
  %4103 = tail call float @fabsf(float %4100) nounwind readnone ; <float> [#uses=1]
  %4104 = fpext float %4103 to double             ; <double> [#uses=1]
  %4105 = fcmp ogt double %4104, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4105, label %bb.i.i.i445, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i448

bb.i.i.i445:                                      ; preds = %bb3.i444
  %4106 = fdiv float %4102, %4100                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i448

_Z15tolerance_equalIfEbRT_S1_.exit.i.i448:        ; preds = %bb.i.i.i445, %bb3.i444
  %reldiff.0.in.i.i.i446 = phi float [ %4106, %bb.i.i.i445 ], [ %4102, %bb3.i444 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i447 = fpext float %reldiff.0.in.i.i.i446 to double ; <double> [#uses=1]
  %4107 = tail call double @fabs(double %reldiff.0.i.i.i447) nounwind readnone ; <double> [#uses=1]
  %4108 = fcmp olt double %4107, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4108, label %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450, label %bb.i1.i449

bb.i1.i449:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i448
  %4109 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 144) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450

_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450: ; preds = %bb.i1.i449, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i448
  %4110 = icmp slt i32 %tmp.i453, %iterations.0   ; <i1> [#uses=1]
  br i1 %4110, label %bb2.preheader.i454, label %bb5.i455

bb.nph6.i451:                                     ; preds = %_Z4fillIPffEvT_S1_T0_.exit
  %4111 = fadd float %4090, %4092                 ; <float> [#uses=1]
  %4112 = fmul float %4111, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i454

bb2.preheader.i454:                               ; preds = %bb.nph6.i451, %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450
  %i.05.i452 = phi i32 [ 0, %bb.nph6.i451 ], [ %tmp.i453, %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450 ] ; <i32> [#uses=1]
  %tmp.i453 = add i32 %i.05.i452, 1               ; <i32> [#uses=2]
  br label %bb1.i442

bb5.i455:                                         ; preds = %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i450, %_Z4fillIPffEvT_S1_T0_.exit
  %4113 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4114 = sub i32 %4113, %4097                    ; <i32> [#uses=1]
  %4115 = sitofp i32 %4114 to double              ; <double> [#uses=1]
  %4116 = fdiv double %4115, 1.000000e+06         ; <double> [#uses=1]
  %.not3012 = icmp ne %struct.one_result* %results.142, null ; <i1> [#uses=1]
  %4117 = icmp sgt i32 %allocated_results.142, 144 ; <i1> [#uses=1]
  %or.cond3013 = and i1 %4117, %.not3012          ; <i1> [#uses=1]
  br i1 %or.cond3013, label %_Z14test_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit, label %bb1.i.i457

bb1.i.i457:                                       ; preds = %bb5.i455
  %4118 = add nsw i32 %allocated_results.142, 10  ; <i32> [#uses=3]
  %4119 = mul i32 %4118, 12                       ; <i32> [#uses=1]
  %4120 = bitcast %struct.one_result* %results.142 to i8* ; <i8*> [#uses=1]
  %4121 = tail call i8* @realloc(i8* %4120, i32 %4119) nounwind ; <i8*> [#uses=2]
  %4122 = bitcast i8* %4121 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4123 = icmp eq i8* %4121, null                 ; <i1> [#uses=1]
  br i1 %4123, label %bb2.i.i458, label %_Z14test_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit

bb2.i.i458:                                       ; preds = %bb1.i.i457
  %4124 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4118) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i457, %bb5.i455
  %results.143 = phi %struct.one_result* [ %4122, %bb1.i.i457 ], [ %results.142, %bb5.i455 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.143 = phi i32 [ %4118, %bb1.i.i457 ], [ %allocated_results.142, %bb5.i455 ] ; <i32> [#uses=3]
  %4125 = phi %struct.one_result* [ %4122, %bb1.i.i457 ], [ %results.142, %bb5.i455 ] ; <%struct.one_result*> [#uses=2]
  %4126 = getelementptr inbounds %struct.one_result* %4125, i32 144, i32 0 ; <double*> [#uses=1]
  store double %4116, double* %4126, align 4
  %4127 = getelementptr inbounds %struct.one_result* %4125, i32 144, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([19 x i8]* @.str156, i32 0, i32 0), i8** %4127, align 4
  %4128 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i430, label %bb5.i434

bb1.i422:                                         ; preds = %bb2.preheader.i433, %bb1.i422
  %result.03.i418 = phi float [ 0.000000e+00, %bb2.preheader.i433 ], [ %4130, %bb1.i422 ] ; <float> [#uses=1]
  %n.02.i419 = phi i32 [ 0, %bb2.preheader.i433 ], [ %4131, %bb1.i422 ] ; <i32> [#uses=2]
  %scevgep.i420 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i419 ; <float*> [#uses=1]
  %4129 = load float* %scevgep.i420, align 4      ; <float> [#uses=1]
  %4130 = fadd float %4129, %result.03.i418       ; <float> [#uses=2]
  %4131 = add nsw i32 %n.02.i419, 1               ; <i32> [#uses=2]
  %exitcond.i421 = icmp eq i32 %4131, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i421, label %bb3.i424, label %bb1.i422

bb3.i424:                                         ; preds = %bb1.i422
  %4132 = fadd float %4142, %4130                 ; <float> [#uses=3]
  %4133 = fsub float %4132, %4144                 ; <float> [#uses=2]
  %4134 = tail call float @fabsf(float %4132) nounwind readnone ; <float> [#uses=1]
  %4135 = fpext float %4134 to double             ; <double> [#uses=1]
  %4136 = fcmp ogt double %4135, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4136, label %bb.i.i.i425, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i428

bb.i.i.i425:                                      ; preds = %bb3.i424
  %4137 = fdiv float %4133, %4132                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i428

_Z15tolerance_equalIfEbRT_S1_.exit.i.i428:        ; preds = %bb.i.i.i425, %bb3.i424
  %reldiff.0.in.i.i.i426 = phi float [ %4137, %bb.i.i.i425 ], [ %4133, %bb3.i424 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i427 = fpext float %reldiff.0.in.i.i.i426 to double ; <double> [#uses=1]
  %4138 = tail call double @fabs(double %reldiff.0.i.i.i427) nounwind readnone ; <double> [#uses=1]
  %4139 = fcmp olt double %4138, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4139, label %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i, label %bb.i1.i429

bb.i1.i429:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i428
  %4140 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 145) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i

_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i: ; preds = %bb.i1.i429, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i428
  %4141 = icmp slt i32 %tmp.i432, %iterations.0   ; <i1> [#uses=1]
  br i1 %4141, label %bb2.preheader.i433, label %bb5.i434

bb.nph6.i430:                                     ; preds = %_Z14test_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit
  %4142 = fmul float %4092, 8.000000e+03          ; <float> [#uses=1]
  %4143 = fadd float %4090, %4092                 ; <float> [#uses=1]
  %4144 = fmul float %4143, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i433

bb2.preheader.i433:                               ; preds = %bb.nph6.i430, %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i
  %i.05.i431 = phi i32 [ 0, %bb.nph6.i430 ], [ %tmp.i432, %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i432 = add i32 %i.05.i431, 1               ; <i32> [#uses=2]
  br label %bb1.i422

bb5.i434:                                         ; preds = %_Z26check_shifted_variable_sumIf19custom_add_variableIfEEvT_S2_.exit.i, %_Z14test_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit
  %4145 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4146 = sub i32 %4145, %4128                    ; <i32> [#uses=1]
  %4147 = sitofp i32 %4146 to double              ; <double> [#uses=1]
  %4148 = fdiv double %4147, 1.000000e+06         ; <double> [#uses=1]
  %.not3014 = icmp ne %struct.one_result* %results.143, null ; <i1> [#uses=1]
  %4149 = icmp sgt i32 %allocated_results.143, 145 ; <i1> [#uses=1]
  %or.cond3015 = and i1 %4149, %.not3014          ; <i1> [#uses=1]
  br i1 %or.cond3015, label %_Z22test_hoisted_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit, label %bb1.i.i436

bb1.i.i436:                                       ; preds = %bb5.i434
  %4150 = add nsw i32 %allocated_results.143, 10  ; <i32> [#uses=3]
  %4151 = mul i32 %4150, 12                       ; <i32> [#uses=1]
  %4152 = bitcast %struct.one_result* %results.143 to i8* ; <i8*> [#uses=1]
  %4153 = tail call i8* @realloc(i8* %4152, i32 %4151) nounwind ; <i8*> [#uses=2]
  %4154 = bitcast i8* %4153 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4155 = icmp eq i8* %4153, null                 ; <i1> [#uses=1]
  br i1 %4155, label %bb2.i.i437, label %_Z22test_hoisted_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit

bb2.i.i437:                                       ; preds = %bb1.i.i436
  %4156 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4150) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i436, %bb5.i434
  %results.144 = phi %struct.one_result* [ %4154, %bb1.i.i436 ], [ %results.143, %bb5.i434 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.144 = phi i32 [ %4150, %bb1.i.i436 ], [ %allocated_results.143, %bb5.i434 ] ; <i32> [#uses=3]
  %4157 = phi %struct.one_result* [ %4154, %bb1.i.i436 ], [ %results.143, %bb5.i434 ] ; <%struct.one_result*> [#uses=2]
  %4158 = getelementptr inbounds %struct.one_result* %4157, i32 145, i32 0 ; <double*> [#uses=1]
  store double %4148, double* %4158, align 4
  %4159 = getelementptr inbounds %struct.one_result* %4157, i32 145, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([27 x i8]* @.str157, i32 0, i32 0), i8** %4159, align 4
  %4160 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i410, label %bb5.i414

bb1.i402:                                         ; preds = %bb2.preheader.i413, %bb1.i402
  %result.03.i398 = phi float [ 0.000000e+00, %bb2.preheader.i413 ], [ %4166, %bb1.i402 ] ; <float> [#uses=1]
  %n.02.i399 = phi i32 [ 0, %bb2.preheader.i413 ], [ %4167, %bb1.i402 ] ; <i32> [#uses=2]
  %scevgep.i400 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i399 ; <float*> [#uses=1]
  %4161 = load float* %scevgep.i400, align 4      ; <float> [#uses=1]
  %4162 = fadd float %4161, %4092                 ; <float> [#uses=1]
  %4163 = fadd float %4162, %4093                 ; <float> [#uses=1]
  %4164 = fadd float %4163, %4094                 ; <float> [#uses=1]
  %4165 = fadd float %4164, %4096                 ; <float> [#uses=1]
  %4166 = fadd float %4165, %result.03.i398       ; <float> [#uses=4]
  %4167 = add nsw i32 %n.02.i399, 1               ; <i32> [#uses=2]
  %exitcond.i401 = icmp eq i32 %4167, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i401, label %bb3.i404, label %bb1.i402

bb3.i404:                                         ; preds = %bb1.i402
  %4168 = fsub float %4166, %4181                 ; <float> [#uses=2]
  %4169 = tail call float @fabsf(float %4166) nounwind readnone ; <float> [#uses=1]
  %4170 = fpext float %4169 to double             ; <double> [#uses=1]
  %4171 = fcmp ogt double %4170, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4171, label %bb.i.i.i405, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i408

bb.i.i.i405:                                      ; preds = %bb3.i404
  %4172 = fdiv float %4168, %4166                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i408

_Z15tolerance_equalIfEbRT_S1_.exit.i.i408:        ; preds = %bb.i.i.i405, %bb3.i404
  %reldiff.0.in.i.i.i406 = phi float [ %4172, %bb.i.i.i405 ], [ %4168, %bb3.i404 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i407 = fpext float %reldiff.0.in.i.i.i406 to double ; <double> [#uses=1]
  %4173 = tail call double @fabs(double %reldiff.0.i.i.i407) nounwind readnone ; <double> [#uses=1]
  %4174 = fcmp olt double %4173, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4174, label %_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i409

bb.i1.i409:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i408
  %4175 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 146) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i409, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i408
  %4176 = icmp slt i32 %tmp.i412, %iterations.0   ; <i1> [#uses=1]
  br i1 %4176, label %bb2.preheader.i413, label %bb5.i414

bb.nph6.i410:                                     ; preds = %_Z22test_hoisted_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit
  %4177 = fadd float %4090, %4092                 ; <float> [#uses=1]
  %4178 = fadd float %4177, %4093                 ; <float> [#uses=1]
  %4179 = fadd float %4178, %4094                 ; <float> [#uses=1]
  %4180 = fadd float %4179, %4096                 ; <float> [#uses=1]
  %4181 = fmul float %4180, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i413

bb2.preheader.i413:                               ; preds = %bb.nph6.i410, %_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i411 = phi i32 [ 0, %bb.nph6.i410 ], [ %tmp.i412, %_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i412 = add i32 %i.05.i411, 1               ; <i32> [#uses=2]
  br label %bb1.i402

bb5.i414:                                         ; preds = %_Z26check_shifted_variable_sumIf28custom_add_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, %_Z22test_hoisted_variable1If19custom_add_variableIfEEvPT_iS2_PKc.exit
  %4182 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4183 = sub i32 %4182, %4160                    ; <i32> [#uses=1]
  %4184 = sitofp i32 %4183 to double              ; <double> [#uses=1]
  %4185 = fdiv double %4184, 1.000000e+06         ; <double> [#uses=1]
  %.not3016 = icmp ne %struct.one_result* %results.144, null ; <i1> [#uses=1]
  %4186 = icmp sgt i32 %allocated_results.144, 146 ; <i1> [#uses=1]
  %or.cond3017 = and i1 %4186, %.not3016          ; <i1> [#uses=1]
  br i1 %or.cond3017, label %_Z14test_variable4If28custom_add_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i416

bb1.i.i416:                                       ; preds = %bb5.i414
  %4187 = add nsw i32 %allocated_results.144, 10  ; <i32> [#uses=3]
  %4188 = mul i32 %4187, 12                       ; <i32> [#uses=1]
  %4189 = bitcast %struct.one_result* %results.144 to i8* ; <i8*> [#uses=1]
  %4190 = tail call i8* @realloc(i8* %4189, i32 %4188) nounwind ; <i8*> [#uses=2]
  %4191 = bitcast i8* %4190 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4192 = icmp eq i8* %4190, null                 ; <i1> [#uses=1]
  br i1 %4192, label %bb2.i.i417, label %_Z14test_variable4If28custom_add_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i417:                                       ; preds = %bb1.i.i416
  %4193 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4187) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If28custom_add_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i416, %bb5.i414
  %results.145 = phi %struct.one_result* [ %4191, %bb1.i.i416 ], [ %results.144, %bb5.i414 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.145 = phi i32 [ %4187, %bb1.i.i416 ], [ %allocated_results.144, %bb5.i414 ] ; <i32> [#uses=3]
  %4194 = phi %struct.one_result* [ %4191, %bb1.i.i416 ], [ %results.144, %bb5.i414 ] ; <%struct.one_result*> [#uses=2]
  %4195 = getelementptr inbounds %struct.one_result* %4194, i32 146, i32 0 ; <double*> [#uses=1]
  store double %4185, double* %4195, align 4
  %4196 = getelementptr inbounds %struct.one_result* %4194, i32 146, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([29 x i8]* @.str158, i32 0, i32 0), i8** %4196, align 4
  %4197 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i390, label %bb5.i394

bb1.i382:                                         ; preds = %bb2.preheader.i393, %bb1.i382
  %result.03.i378 = phi float [ 0.000000e+00, %bb2.preheader.i393 ], [ %4200, %bb1.i382 ] ; <float> [#uses=1]
  %n.02.i379 = phi i32 [ 0, %bb2.preheader.i393 ], [ %4201, %bb1.i382 ] ; <i32> [#uses=2]
  %scevgep.i380 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i379 ; <float*> [#uses=1]
  %4198 = load float* %scevgep.i380, align 4      ; <float> [#uses=1]
  %4199 = fsub float %4198, %4092                 ; <float> [#uses=1]
  %4200 = fadd float %4199, %result.03.i378       ; <float> [#uses=4]
  %4201 = add nsw i32 %n.02.i379, 1               ; <i32> [#uses=2]
  %exitcond.i381 = icmp eq i32 %4201, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i381, label %bb3.i384, label %bb1.i382

bb3.i384:                                         ; preds = %bb1.i382
  %4202 = fsub float %4200, %4212                 ; <float> [#uses=2]
  %4203 = tail call float @fabsf(float %4200) nounwind readnone ; <float> [#uses=1]
  %4204 = fpext float %4203 to double             ; <double> [#uses=1]
  %4205 = fcmp ogt double %4204, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4205, label %bb.i.i.i385, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i388

bb.i.i.i385:                                      ; preds = %bb3.i384
  %4206 = fdiv float %4202, %4200                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i388

_Z15tolerance_equalIfEbRT_S1_.exit.i.i388:        ; preds = %bb.i.i.i385, %bb3.i384
  %reldiff.0.in.i.i.i386 = phi float [ %4206, %bb.i.i.i385 ], [ %4202, %bb3.i384 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i387 = fpext float %reldiff.0.in.i.i.i386 to double ; <double> [#uses=1]
  %4207 = tail call double @fabs(double %reldiff.0.i.i.i387) nounwind readnone ; <double> [#uses=1]
  %4208 = fcmp olt double %4207, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4208, label %_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i, label %bb.i1.i389

bb.i1.i389:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i388
  %4209 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 147) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i

_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i: ; preds = %bb.i1.i389, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i388
  %4210 = icmp slt i32 %tmp.i392, %iterations.0   ; <i1> [#uses=1]
  br i1 %4210, label %bb2.preheader.i393, label %bb5.i394

bb.nph6.i390:                                     ; preds = %_Z14test_variable4If28custom_add_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4211 = fsub float %4090, %4092                 ; <float> [#uses=1]
  %4212 = fmul float %4211, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i393

bb2.preheader.i393:                               ; preds = %bb.nph6.i390, %_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i
  %i.05.i391 = phi i32 [ 0, %bb.nph6.i390 ], [ %tmp.i392, %_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i392 = add i32 %i.05.i391, 1               ; <i32> [#uses=2]
  br label %bb1.i382

bb5.i394:                                         ; preds = %_Z26check_shifted_variable_sumIf19custom_sub_variableIfEEvT_S2_.exit.i, %_Z14test_variable4If28custom_add_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4213 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4214 = sub i32 %4213, %4197                    ; <i32> [#uses=1]
  %4215 = sitofp i32 %4214 to double              ; <double> [#uses=1]
  %4216 = fdiv double %4215, 1.000000e+06         ; <double> [#uses=1]
  %.not3018 = icmp ne %struct.one_result* %results.145, null ; <i1> [#uses=1]
  %4217 = icmp sgt i32 %allocated_results.145, 147 ; <i1> [#uses=1]
  %or.cond3019 = and i1 %4217, %.not3018          ; <i1> [#uses=1]
  br i1 %or.cond3019, label %_Z14test_variable1If19custom_sub_variableIfEEvPT_iS2_PKc.exit, label %bb1.i.i396

bb1.i.i396:                                       ; preds = %bb5.i394
  %4218 = add nsw i32 %allocated_results.145, 10  ; <i32> [#uses=3]
  %4219 = mul i32 %4218, 12                       ; <i32> [#uses=1]
  %4220 = bitcast %struct.one_result* %results.145 to i8* ; <i8*> [#uses=1]
  %4221 = tail call i8* @realloc(i8* %4220, i32 %4219) nounwind ; <i8*> [#uses=2]
  %4222 = bitcast i8* %4221 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4223 = icmp eq i8* %4221, null                 ; <i1> [#uses=1]
  br i1 %4223, label %bb2.i.i397, label %_Z14test_variable1If19custom_sub_variableIfEEvPT_iS2_PKc.exit

bb2.i.i397:                                       ; preds = %bb1.i.i396
  %4224 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4218) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1If19custom_sub_variableIfEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i396, %bb5.i394
  %results.146 = phi %struct.one_result* [ %4222, %bb1.i.i396 ], [ %results.145, %bb5.i394 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.146 = phi i32 [ %4218, %bb1.i.i396 ], [ %allocated_results.145, %bb5.i394 ] ; <i32> [#uses=3]
  %4225 = phi %struct.one_result* [ %4222, %bb1.i.i396 ], [ %results.145, %bb5.i394 ] ; <%struct.one_result*> [#uses=2]
  %4226 = getelementptr inbounds %struct.one_result* %4225, i32 147, i32 0 ; <double*> [#uses=1]
  store double %4216, double* %4226, align 4
  %4227 = getelementptr inbounds %struct.one_result* %4225, i32 147, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str159, i32 0, i32 0), i8** %4227, align 4
  %4228 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i370, label %bb5.i374

bb1.i362:                                         ; preds = %bb2.preheader.i373, %bb1.i362
  %result.03.i358 = phi float [ 0.000000e+00, %bb2.preheader.i373 ], [ %4234, %bb1.i362 ] ; <float> [#uses=1]
  %n.02.i359 = phi i32 [ 0, %bb2.preheader.i373 ], [ %4235, %bb1.i362 ] ; <i32> [#uses=2]
  %scevgep.i360 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i359 ; <float*> [#uses=1]
  %4229 = load float* %scevgep.i360, align 4      ; <float> [#uses=1]
  %4230 = fsub float %4229, %4092                 ; <float> [#uses=1]
  %4231 = fsub float %4230, %4093                 ; <float> [#uses=1]
  %4232 = fsub float %4231, %4094                 ; <float> [#uses=1]
  %4233 = fsub float %4232, %4096                 ; <float> [#uses=1]
  %4234 = fadd float %4233, %result.03.i358       ; <float> [#uses=4]
  %4235 = add nsw i32 %n.02.i359, 1               ; <i32> [#uses=2]
  %exitcond.i361 = icmp eq i32 %4235, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i361, label %bb3.i364, label %bb1.i362

bb3.i364:                                         ; preds = %bb1.i362
  %4236 = fsub float %4234, %4249                 ; <float> [#uses=2]
  %4237 = tail call float @fabsf(float %4234) nounwind readnone ; <float> [#uses=1]
  %4238 = fpext float %4237 to double             ; <double> [#uses=1]
  %4239 = fcmp ogt double %4238, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4239, label %bb.i.i.i365, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i368

bb.i.i.i365:                                      ; preds = %bb3.i364
  %4240 = fdiv float %4236, %4234                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i368

_Z15tolerance_equalIfEbRT_S1_.exit.i.i368:        ; preds = %bb.i.i.i365, %bb3.i364
  %reldiff.0.in.i.i.i366 = phi float [ %4240, %bb.i.i.i365 ], [ %4236, %bb3.i364 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i367 = fpext float %reldiff.0.in.i.i.i366 to double ; <double> [#uses=1]
  %4241 = tail call double @fabs(double %reldiff.0.i.i.i367) nounwind readnone ; <double> [#uses=1]
  %4242 = fcmp olt double %4241, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4242, label %_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i369

bb.i1.i369:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i368
  %4243 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 148) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i369, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i368
  %4244 = icmp slt i32 %tmp.i372, %iterations.0   ; <i1> [#uses=1]
  br i1 %4244, label %bb2.preheader.i373, label %bb5.i374

bb.nph6.i370:                                     ; preds = %_Z14test_variable1If19custom_sub_variableIfEEvPT_iS2_PKc.exit
  %4245 = fsub float %4090, %4092                 ; <float> [#uses=1]
  %4246 = fsub float %4245, %4093                 ; <float> [#uses=1]
  %4247 = fsub float %4246, %4094                 ; <float> [#uses=1]
  %4248 = fsub float %4247, %4096                 ; <float> [#uses=1]
  %4249 = fmul float %4248, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i373

bb2.preheader.i373:                               ; preds = %bb.nph6.i370, %_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i371 = phi i32 [ 0, %bb.nph6.i370 ], [ %tmp.i372, %_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i372 = add i32 %i.05.i371, 1               ; <i32> [#uses=2]
  br label %bb1.i362

bb5.i374:                                         ; preds = %_Z26check_shifted_variable_sumIf28custom_sub_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1If19custom_sub_variableIfEEvPT_iS2_PKc.exit
  %4250 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4251 = sub i32 %4250, %4228                    ; <i32> [#uses=1]
  %4252 = sitofp i32 %4251 to double              ; <double> [#uses=1]
  %4253 = fdiv double %4252, 1.000000e+06         ; <double> [#uses=1]
  %.not3020 = icmp ne %struct.one_result* %results.146, null ; <i1> [#uses=1]
  %4254 = icmp sgt i32 %allocated_results.146, 148 ; <i1> [#uses=1]
  %or.cond3021 = and i1 %4254, %.not3020          ; <i1> [#uses=1]
  br i1 %or.cond3021, label %_Z14test_variable4If28custom_sub_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i376

bb1.i.i376:                                       ; preds = %bb5.i374
  %4255 = add nsw i32 %allocated_results.146, 10  ; <i32> [#uses=3]
  %4256 = mul i32 %4255, 12                       ; <i32> [#uses=1]
  %4257 = bitcast %struct.one_result* %results.146 to i8* ; <i8*> [#uses=1]
  %4258 = tail call i8* @realloc(i8* %4257, i32 %4256) nounwind ; <i8*> [#uses=2]
  %4259 = bitcast i8* %4258 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4260 = icmp eq i8* %4258, null                 ; <i1> [#uses=1]
  br i1 %4260, label %bb2.i.i377, label %_Z14test_variable4If28custom_sub_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i377:                                       ; preds = %bb1.i.i376
  %4261 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4255) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If28custom_sub_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i376, %bb5.i374
  %results.147 = phi %struct.one_result* [ %4259, %bb1.i.i376 ], [ %results.146, %bb5.i374 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.147 = phi i32 [ %4255, %bb1.i.i376 ], [ %allocated_results.146, %bb5.i374 ] ; <i32> [#uses=3]
  %4262 = phi %struct.one_result* [ %4259, %bb1.i.i376 ], [ %results.146, %bb5.i374 ] ; <%struct.one_result*> [#uses=2]
  %4263 = getelementptr inbounds %struct.one_result* %4262, i32 148, i32 0 ; <double*> [#uses=1]
  store double %4253, double* %4263, align 4
  %4264 = getelementptr inbounds %struct.one_result* %4262, i32 148, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str160, i32 0, i32 0), i8** %4264, align 4
  %4265 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i350, label %bb5.i354

bb1.i342:                                         ; preds = %bb2.preheader.i353, %bb1.i342
  %result.03.i338 = phi float [ 0.000000e+00, %bb2.preheader.i353 ], [ %4268, %bb1.i342 ] ; <float> [#uses=1]
  %n.02.i339 = phi i32 [ 0, %bb2.preheader.i353 ], [ %4269, %bb1.i342 ] ; <i32> [#uses=2]
  %scevgep.i340 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i339 ; <float*> [#uses=1]
  %4266 = load float* %scevgep.i340, align 4      ; <float> [#uses=1]
  %4267 = fmul float %4266, %4092                 ; <float> [#uses=1]
  %4268 = fadd float %4267, %result.03.i338       ; <float> [#uses=4]
  %4269 = add nsw i32 %n.02.i339, 1               ; <i32> [#uses=2]
  %exitcond.i341 = icmp eq i32 %4269, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i341, label %bb3.i344, label %bb1.i342

bb3.i344:                                         ; preds = %bb1.i342
  %4270 = fsub float %4268, %4280                 ; <float> [#uses=2]
  %4271 = tail call float @fabsf(float %4268) nounwind readnone ; <float> [#uses=1]
  %4272 = fpext float %4271 to double             ; <double> [#uses=1]
  %4273 = fcmp ogt double %4272, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4273, label %bb.i.i.i345, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i348

bb.i.i.i345:                                      ; preds = %bb3.i344
  %4274 = fdiv float %4270, %4268                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i348

_Z15tolerance_equalIfEbRT_S1_.exit.i.i348:        ; preds = %bb.i.i.i345, %bb3.i344
  %reldiff.0.in.i.i.i346 = phi float [ %4274, %bb.i.i.i345 ], [ %4270, %bb3.i344 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i347 = fpext float %reldiff.0.in.i.i.i346 to double ; <double> [#uses=1]
  %4275 = tail call double @fabs(double %reldiff.0.i.i.i347) nounwind readnone ; <double> [#uses=1]
  %4276 = fcmp olt double %4275, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4276, label %_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i, label %bb.i1.i349

bb.i1.i349:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i348
  %4277 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 149) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i

_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i: ; preds = %bb.i1.i349, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i348
  %4278 = icmp slt i32 %tmp.i352, %iterations.0   ; <i1> [#uses=1]
  br i1 %4278, label %bb2.preheader.i353, label %bb5.i354

bb.nph6.i350:                                     ; preds = %_Z14test_variable4If28custom_sub_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4279 = fmul float %4090, %4092                 ; <float> [#uses=1]
  %4280 = fmul float %4279, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i353

bb2.preheader.i353:                               ; preds = %bb.nph6.i350, %_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i
  %i.05.i351 = phi i32 [ 0, %bb.nph6.i350 ], [ %tmp.i352, %_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i352 = add i32 %i.05.i351, 1               ; <i32> [#uses=2]
  br label %bb1.i342

bb5.i354:                                         ; preds = %_Z26check_shifted_variable_sumIf24custom_multiply_variableIfEEvT_S2_.exit.i, %_Z14test_variable4If28custom_sub_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4281 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4282 = sub i32 %4281, %4265                    ; <i32> [#uses=1]
  %4283 = sitofp i32 %4282 to double              ; <double> [#uses=1]
  %4284 = fdiv double %4283, 1.000000e+06         ; <double> [#uses=1]
  %.not3022 = icmp ne %struct.one_result* %results.147, null ; <i1> [#uses=1]
  %4285 = icmp sgt i32 %allocated_results.147, 149 ; <i1> [#uses=1]
  %or.cond3023 = and i1 %4285, %.not3022          ; <i1> [#uses=1]
  br i1 %or.cond3023, label %_Z14test_variable1If24custom_multiply_variableIfEEvPT_iS2_PKc.exit, label %bb1.i.i356

bb1.i.i356:                                       ; preds = %bb5.i354
  %4286 = add nsw i32 %allocated_results.147, 10  ; <i32> [#uses=3]
  %4287 = mul i32 %4286, 12                       ; <i32> [#uses=1]
  %4288 = bitcast %struct.one_result* %results.147 to i8* ; <i8*> [#uses=1]
  %4289 = tail call i8* @realloc(i8* %4288, i32 %4287) nounwind ; <i8*> [#uses=2]
  %4290 = bitcast i8* %4289 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4291 = icmp eq i8* %4289, null                 ; <i1> [#uses=1]
  br i1 %4291, label %bb2.i.i357, label %_Z14test_variable1If24custom_multiply_variableIfEEvPT_iS2_PKc.exit

bb2.i.i357:                                       ; preds = %bb1.i.i356
  %4292 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4286) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1If24custom_multiply_variableIfEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i356, %bb5.i354
  %results.148 = phi %struct.one_result* [ %4290, %bb1.i.i356 ], [ %results.147, %bb5.i354 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.148 = phi i32 [ %4286, %bb1.i.i356 ], [ %allocated_results.147, %bb5.i354 ] ; <i32> [#uses=3]
  %4293 = phi %struct.one_result* [ %4290, %bb1.i.i356 ], [ %results.147, %bb5.i354 ] ; <%struct.one_result*> [#uses=2]
  %4294 = getelementptr inbounds %struct.one_result* %4293, i32 149, i32 0 ; <double*> [#uses=1]
  store double %4284, double* %4294, align 4
  %4295 = getelementptr inbounds %struct.one_result* %4293, i32 149, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([24 x i8]* @.str161, i32 0, i32 0), i8** %4295, align 4
  %4296 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i330, label %bb5.i334

bb1.i322:                                         ; preds = %bb2.preheader.i333, %bb1.i322
  %result.03.i318 = phi float [ 0.000000e+00, %bb2.preheader.i333 ], [ %4302, %bb1.i322 ] ; <float> [#uses=1]
  %n.02.i319 = phi i32 [ 0, %bb2.preheader.i333 ], [ %4303, %bb1.i322 ] ; <i32> [#uses=2]
  %scevgep.i320 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i319 ; <float*> [#uses=1]
  %4297 = load float* %scevgep.i320, align 4      ; <float> [#uses=1]
  %4298 = fmul float %4297, %4092                 ; <float> [#uses=1]
  %4299 = fmul float %4298, %4093                 ; <float> [#uses=1]
  %4300 = fmul float %4299, %4094                 ; <float> [#uses=1]
  %4301 = fmul float %4300, %4096                 ; <float> [#uses=1]
  %4302 = fadd float %4301, %result.03.i318       ; <float> [#uses=4]
  %4303 = add nsw i32 %n.02.i319, 1               ; <i32> [#uses=2]
  %exitcond.i321 = icmp eq i32 %4303, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i321, label %bb3.i324, label %bb1.i322

bb3.i324:                                         ; preds = %bb1.i322
  %4304 = fsub float %4302, %4317                 ; <float> [#uses=2]
  %4305 = tail call float @fabsf(float %4302) nounwind readnone ; <float> [#uses=1]
  %4306 = fpext float %4305 to double             ; <double> [#uses=1]
  %4307 = fcmp ogt double %4306, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4307, label %bb.i.i.i325, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i328

bb.i.i.i325:                                      ; preds = %bb3.i324
  %4308 = fdiv float %4304, %4302                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i328

_Z15tolerance_equalIfEbRT_S1_.exit.i.i328:        ; preds = %bb.i.i.i325, %bb3.i324
  %reldiff.0.in.i.i.i326 = phi float [ %4308, %bb.i.i.i325 ], [ %4304, %bb3.i324 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i327 = fpext float %reldiff.0.in.i.i.i326 to double ; <double> [#uses=1]
  %4309 = tail call double @fabs(double %reldiff.0.i.i.i327) nounwind readnone ; <double> [#uses=1]
  %4310 = fcmp olt double %4309, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4310, label %_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i329

bb.i1.i329:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i328
  %4311 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 150) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i329, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i328
  %4312 = icmp slt i32 %tmp.i332, %iterations.0   ; <i1> [#uses=1]
  br i1 %4312, label %bb2.preheader.i333, label %bb5.i334

bb.nph6.i330:                                     ; preds = %_Z14test_variable1If24custom_multiply_variableIfEEvPT_iS2_PKc.exit
  %4313 = fmul float %4090, %4092                 ; <float> [#uses=1]
  %4314 = fmul float %4313, %4093                 ; <float> [#uses=1]
  %4315 = fmul float %4314, %4094                 ; <float> [#uses=1]
  %4316 = fmul float %4315, %4096                 ; <float> [#uses=1]
  %4317 = fmul float %4316, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i333

bb2.preheader.i333:                               ; preds = %bb.nph6.i330, %_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i331 = phi i32 [ 0, %bb.nph6.i330 ], [ %tmp.i332, %_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i332 = add i32 %i.05.i331, 1               ; <i32> [#uses=2]
  br label %bb1.i322

bb5.i334:                                         ; preds = %_Z26check_shifted_variable_sumIf33custom_multiply_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1If24custom_multiply_variableIfEEvPT_iS2_PKc.exit
  %4318 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4319 = sub i32 %4318, %4296                    ; <i32> [#uses=1]
  %4320 = sitofp i32 %4319 to double              ; <double> [#uses=1]
  %4321 = fdiv double %4320, 1.000000e+06         ; <double> [#uses=1]
  %.not3024 = icmp ne %struct.one_result* %results.148, null ; <i1> [#uses=1]
  %4322 = icmp sgt i32 %allocated_results.148, 150 ; <i1> [#uses=1]
  %or.cond3025 = and i1 %4322, %.not3024          ; <i1> [#uses=1]
  br i1 %or.cond3025, label %_Z14test_variable4If33custom_multiply_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i336

bb1.i.i336:                                       ; preds = %bb5.i334
  %4323 = add nsw i32 %allocated_results.148, 10  ; <i32> [#uses=3]
  %4324 = mul i32 %4323, 12                       ; <i32> [#uses=1]
  %4325 = bitcast %struct.one_result* %results.148 to i8* ; <i8*> [#uses=1]
  %4326 = tail call i8* @realloc(i8* %4325, i32 %4324) nounwind ; <i8*> [#uses=2]
  %4327 = bitcast i8* %4326 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4328 = icmp eq i8* %4326, null                 ; <i1> [#uses=1]
  br i1 %4328, label %bb2.i.i337, label %_Z14test_variable4If33custom_multiply_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i337:                                       ; preds = %bb1.i.i336
  %4329 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4323) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If33custom_multiply_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i336, %bb5.i334
  %results.149 = phi %struct.one_result* [ %4327, %bb1.i.i336 ], [ %results.148, %bb5.i334 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.149 = phi i32 [ %4323, %bb1.i.i336 ], [ %allocated_results.148, %bb5.i334 ] ; <i32> [#uses=3]
  %4330 = phi %struct.one_result* [ %4327, %bb1.i.i336 ], [ %results.148, %bb5.i334 ] ; <%struct.one_result*> [#uses=2]
  %4331 = getelementptr inbounds %struct.one_result* %4330, i32 150, i32 0 ; <double*> [#uses=1]
  store double %4321, double* %4331, align 4
  %4332 = getelementptr inbounds %struct.one_result* %4330, i32 150, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str162, i32 0, i32 0), i8** %4332, align 4
  %4333 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i310, label %bb5.i314

bb1.i302:                                         ; preds = %bb2.preheader.i313, %bb1.i302
  %result.03.i298 = phi float [ 0.000000e+00, %bb2.preheader.i313 ], [ %4336, %bb1.i302 ] ; <float> [#uses=1]
  %n.02.i299 = phi i32 [ 0, %bb2.preheader.i313 ], [ %4337, %bb1.i302 ] ; <i32> [#uses=2]
  %scevgep.i300 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i299 ; <float*> [#uses=1]
  %4334 = load float* %scevgep.i300, align 4      ; <float> [#uses=1]
  %4335 = fadd float %4349, %4334                 ; <float> [#uses=1]
  %4336 = fadd float %4335, %result.03.i298       ; <float> [#uses=4]
  %4337 = add nsw i32 %n.02.i299, 1               ; <i32> [#uses=2]
  %exitcond.i301 = icmp eq i32 %4337, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i301, label %bb3.i304, label %bb1.i302

bb3.i304:                                         ; preds = %bb1.i302
  %4338 = fsub float %4336, %4351                 ; <float> [#uses=2]
  %4339 = tail call float @fabsf(float %4336) nounwind readnone ; <float> [#uses=1]
  %4340 = fpext float %4339 to double             ; <double> [#uses=1]
  %4341 = fcmp ogt double %4340, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4341, label %bb.i.i.i305, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i308

bb.i.i.i305:                                      ; preds = %bb3.i304
  %4342 = fdiv float %4338, %4336                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i308

_Z15tolerance_equalIfEbRT_S1_.exit.i.i308:        ; preds = %bb.i.i.i305, %bb3.i304
  %reldiff.0.in.i.i.i306 = phi float [ %4342, %bb.i.i.i305 ], [ %4338, %bb3.i304 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i307 = fpext float %reldiff.0.in.i.i.i306 to double ; <double> [#uses=1]
  %4343 = tail call double @fabs(double %reldiff.0.i.i.i307) nounwind readnone ; <double> [#uses=1]
  %4344 = fcmp olt double %4343, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4344, label %_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i309

bb.i1.i309:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i308
  %4345 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 151) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i309, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i308
  %4346 = icmp slt i32 %tmp.i312, %iterations.0   ; <i1> [#uses=1]
  br i1 %4346, label %bb2.preheader.i313, label %bb5.i314

bb.nph6.i310:                                     ; preds = %_Z14test_variable4If33custom_multiply_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4347 = fmul float %4092, %4093                 ; <float> [#uses=1]
  %4348 = fmul float %4347, %4094                 ; <float> [#uses=1]
  %4349 = fmul float %4348, %4096                 ; <float> [#uses=2]
  %4350 = fadd float %4349, %4090                 ; <float> [#uses=1]
  %4351 = fmul float %4350, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i313

bb2.preheader.i313:                               ; preds = %bb.nph6.i310, %_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i311 = phi i32 [ 0, %bb.nph6.i310 ], [ %tmp.i312, %_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i312 = add i32 %i.05.i311, 1               ; <i32> [#uses=2]
  br label %bb1.i302

bb5.i314:                                         ; preds = %_Z26check_shifted_variable_sumIf34custom_multiply_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4If33custom_multiply_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4352 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4353 = sub i32 %4352, %4333                    ; <i32> [#uses=1]
  %4354 = sitofp i32 %4353 to double              ; <double> [#uses=1]
  %4355 = fdiv double %4354, 1.000000e+06         ; <double> [#uses=1]
  %.not3026 = icmp ne %struct.one_result* %results.149, null ; <i1> [#uses=1]
  %4356 = icmp sgt i32 %allocated_results.149, 151 ; <i1> [#uses=1]
  %or.cond3027 = and i1 %4356, %.not3026          ; <i1> [#uses=1]
  br i1 %or.cond3027, label %_Z14test_variable4If34custom_multiply_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i316

bb1.i.i316:                                       ; preds = %bb5.i314
  %4357 = add nsw i32 %allocated_results.149, 10  ; <i32> [#uses=3]
  %4358 = mul i32 %4357, 12                       ; <i32> [#uses=1]
  %4359 = bitcast %struct.one_result* %results.149 to i8* ; <i8*> [#uses=1]
  %4360 = tail call i8* @realloc(i8* %4359, i32 %4358) nounwind ; <i8*> [#uses=2]
  %4361 = bitcast i8* %4360 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4362 = icmp eq i8* %4360, null                 ; <i1> [#uses=1]
  br i1 %4362, label %bb2.i.i317, label %_Z14test_variable4If34custom_multiply_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i317:                                       ; preds = %bb1.i.i316
  %4363 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4357) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If34custom_multiply_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i316, %bb5.i314
  %results.150 = phi %struct.one_result* [ %4361, %bb1.i.i316 ], [ %results.149, %bb5.i314 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.150 = phi i32 [ %4357, %bb1.i.i316 ], [ %allocated_results.149, %bb5.i314 ] ; <i32> [#uses=3]
  %4364 = phi %struct.one_result* [ %4361, %bb1.i.i316 ], [ %results.149, %bb5.i314 ] ; <%struct.one_result*> [#uses=2]
  %4365 = getelementptr inbounds %struct.one_result* %4364, i32 151, i32 0 ; <double*> [#uses=1]
  store double %4355, double* %4365, align 4
  %4366 = getelementptr inbounds %struct.one_result* %4364, i32 151, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str163, i32 0, i32 0), i8** %4366, align 4
  %4367 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i290, label %bb5.i294

bb1.i282:                                         ; preds = %bb2.preheader.i293, %bb1.i282
  %result.03.i278 = phi float [ 0.000000e+00, %bb2.preheader.i293 ], [ %4370, %bb1.i282 ] ; <float> [#uses=1]
  %n.02.i279 = phi i32 [ 0, %bb2.preheader.i293 ], [ %4371, %bb1.i282 ] ; <i32> [#uses=2]
  %scevgep.i280 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i279 ; <float*> [#uses=1]
  %4368 = load float* %scevgep.i280, align 4      ; <float> [#uses=1]
  %4369 = fdiv float %4368, %4092                 ; <float> [#uses=1]
  %4370 = fadd float %4369, %result.03.i278       ; <float> [#uses=4]
  %4371 = add nsw i32 %n.02.i279, 1               ; <i32> [#uses=2]
  %exitcond.i281 = icmp eq i32 %4371, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i281, label %bb3.i284, label %bb1.i282

bb3.i284:                                         ; preds = %bb1.i282
  %4372 = fsub float %4370, %4382                 ; <float> [#uses=2]
  %4373 = tail call float @fabsf(float %4370) nounwind readnone ; <float> [#uses=1]
  %4374 = fpext float %4373 to double             ; <double> [#uses=1]
  %4375 = fcmp ogt double %4374, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4375, label %bb.i.i.i285, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i288

bb.i.i.i285:                                      ; preds = %bb3.i284
  %4376 = fdiv float %4372, %4370                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i288

_Z15tolerance_equalIfEbRT_S1_.exit.i.i288:        ; preds = %bb.i.i.i285, %bb3.i284
  %reldiff.0.in.i.i.i286 = phi float [ %4376, %bb.i.i.i285 ], [ %4372, %bb3.i284 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i287 = fpext float %reldiff.0.in.i.i.i286 to double ; <double> [#uses=1]
  %4377 = tail call double @fabs(double %reldiff.0.i.i.i287) nounwind readnone ; <double> [#uses=1]
  %4378 = fcmp olt double %4377, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4378, label %_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i, label %bb.i1.i289

bb.i1.i289:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i288
  %4379 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 152) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i

_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i: ; preds = %bb.i1.i289, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i288
  %4380 = icmp slt i32 %tmp.i292, %iterations.0   ; <i1> [#uses=1]
  br i1 %4380, label %bb2.preheader.i293, label %bb5.i294

bb.nph6.i290:                                     ; preds = %_Z14test_variable4If34custom_multiply_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4381 = fdiv float %4090, %4092                 ; <float> [#uses=1]
  %4382 = fmul float %4381, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i293

bb2.preheader.i293:                               ; preds = %bb.nph6.i290, %_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i
  %i.05.i291 = phi i32 [ 0, %bb.nph6.i290 ], [ %tmp.i292, %_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i292 = add i32 %i.05.i291, 1               ; <i32> [#uses=2]
  br label %bb1.i282

bb5.i294:                                         ; preds = %_Z26check_shifted_variable_sumIf22custom_divide_variableIfEEvT_S2_.exit.i, %_Z14test_variable4If34custom_multiply_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4383 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4384 = sub i32 %4383, %4367                    ; <i32> [#uses=1]
  %4385 = sitofp i32 %4384 to double              ; <double> [#uses=1]
  %4386 = fdiv double %4385, 1.000000e+06         ; <double> [#uses=1]
  %.not3028 = icmp ne %struct.one_result* %results.150, null ; <i1> [#uses=1]
  %4387 = icmp sgt i32 %allocated_results.150, 152 ; <i1> [#uses=1]
  %or.cond3029 = and i1 %4387, %.not3028          ; <i1> [#uses=1]
  br i1 %or.cond3029, label %_Z14test_variable1If22custom_divide_variableIfEEvPT_iS2_PKc.exit, label %bb1.i.i296

bb1.i.i296:                                       ; preds = %bb5.i294
  %4388 = add nsw i32 %allocated_results.150, 10  ; <i32> [#uses=3]
  %4389 = mul i32 %4388, 12                       ; <i32> [#uses=1]
  %4390 = bitcast %struct.one_result* %results.150 to i8* ; <i8*> [#uses=1]
  %4391 = tail call i8* @realloc(i8* %4390, i32 %4389) nounwind ; <i8*> [#uses=2]
  %4392 = bitcast i8* %4391 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4393 = icmp eq i8* %4391, null                 ; <i1> [#uses=1]
  br i1 %4393, label %bb2.i.i297, label %_Z14test_variable1If22custom_divide_variableIfEEvPT_iS2_PKc.exit

bb2.i.i297:                                       ; preds = %bb1.i.i296
  %4394 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4388) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1If22custom_divide_variableIfEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i296, %bb5.i294
  %results.151 = phi %struct.one_result* [ %4392, %bb1.i.i296 ], [ %results.150, %bb5.i294 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.151 = phi i32 [ %4388, %bb1.i.i296 ], [ %allocated_results.150, %bb5.i294 ] ; <i32> [#uses=3]
  %4395 = phi %struct.one_result* [ %4392, %bb1.i.i296 ], [ %results.150, %bb5.i294 ] ; <%struct.one_result*> [#uses=2]
  %4396 = getelementptr inbounds %struct.one_result* %4395, i32 152, i32 0 ; <double*> [#uses=1]
  store double %4386, double* %4396, align 4
  %4397 = getelementptr inbounds %struct.one_result* %4395, i32 152, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([22 x i8]* @.str164, i32 0, i32 0), i8** %4397, align 4
  %4398 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i270, label %bb5.i274

bb1.i262:                                         ; preds = %bb2.preheader.i273, %bb1.i262
  %result.03.i258 = phi float [ 0.000000e+00, %bb2.preheader.i273 ], [ %4404, %bb1.i262 ] ; <float> [#uses=1]
  %n.02.i259 = phi i32 [ 0, %bb2.preheader.i273 ], [ %4405, %bb1.i262 ] ; <i32> [#uses=2]
  %scevgep.i260 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i259 ; <float*> [#uses=1]
  %4399 = load float* %scevgep.i260, align 4      ; <float> [#uses=1]
  %4400 = fdiv float %4399, %4092                 ; <float> [#uses=1]
  %4401 = fdiv float %4400, %4093                 ; <float> [#uses=1]
  %4402 = fdiv float %4401, %4094                 ; <float> [#uses=1]
  %4403 = fdiv float %4402, %4096                 ; <float> [#uses=1]
  %4404 = fadd float %4403, %result.03.i258       ; <float> [#uses=4]
  %4405 = add nsw i32 %n.02.i259, 1               ; <i32> [#uses=2]
  %exitcond.i261 = icmp eq i32 %4405, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i261, label %bb3.i264, label %bb1.i262

bb3.i264:                                         ; preds = %bb1.i262
  %4406 = fsub float %4404, %4419                 ; <float> [#uses=2]
  %4407 = tail call float @fabsf(float %4404) nounwind readnone ; <float> [#uses=1]
  %4408 = fpext float %4407 to double             ; <double> [#uses=1]
  %4409 = fcmp ogt double %4408, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4409, label %bb.i.i.i265, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i268

bb.i.i.i265:                                      ; preds = %bb3.i264
  %4410 = fdiv float %4406, %4404                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i268

_Z15tolerance_equalIfEbRT_S1_.exit.i.i268:        ; preds = %bb.i.i.i265, %bb3.i264
  %reldiff.0.in.i.i.i266 = phi float [ %4410, %bb.i.i.i265 ], [ %4406, %bb3.i264 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i267 = fpext float %reldiff.0.in.i.i.i266 to double ; <double> [#uses=1]
  %4411 = tail call double @fabs(double %reldiff.0.i.i.i267) nounwind readnone ; <double> [#uses=1]
  %4412 = fcmp olt double %4411, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4412, label %_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i269

bb.i1.i269:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i268
  %4413 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 153) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i269, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i268
  %4414 = icmp slt i32 %tmp.i272, %iterations.0   ; <i1> [#uses=1]
  br i1 %4414, label %bb2.preheader.i273, label %bb5.i274

bb.nph6.i270:                                     ; preds = %_Z14test_variable1If22custom_divide_variableIfEEvPT_iS2_PKc.exit
  %4415 = fdiv float %4090, %4092                 ; <float> [#uses=1]
  %4416 = fdiv float %4415, %4093                 ; <float> [#uses=1]
  %4417 = fdiv float %4416, %4094                 ; <float> [#uses=1]
  %4418 = fdiv float %4417, %4096                 ; <float> [#uses=1]
  %4419 = fmul float %4418, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i273

bb2.preheader.i273:                               ; preds = %bb.nph6.i270, %_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i271 = phi i32 [ 0, %bb.nph6.i270 ], [ %tmp.i272, %_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i272 = add i32 %i.05.i271, 1               ; <i32> [#uses=2]
  br label %bb1.i262

bb5.i274:                                         ; preds = %_Z26check_shifted_variable_sumIf31custom_divide_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1If22custom_divide_variableIfEEvPT_iS2_PKc.exit
  %4420 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4421 = sub i32 %4420, %4398                    ; <i32> [#uses=1]
  %4422 = sitofp i32 %4421 to double              ; <double> [#uses=1]
  %4423 = fdiv double %4422, 1.000000e+06         ; <double> [#uses=1]
  %.not3030 = icmp ne %struct.one_result* %results.151, null ; <i1> [#uses=1]
  %4424 = icmp sgt i32 %allocated_results.151, 153 ; <i1> [#uses=1]
  %or.cond3031 = and i1 %4424, %.not3030          ; <i1> [#uses=1]
  br i1 %or.cond3031, label %_Z14test_variable4If31custom_divide_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i276

bb1.i.i276:                                       ; preds = %bb5.i274
  %4425 = add nsw i32 %allocated_results.151, 10  ; <i32> [#uses=3]
  %4426 = mul i32 %4425, 12                       ; <i32> [#uses=1]
  %4427 = bitcast %struct.one_result* %results.151 to i8* ; <i8*> [#uses=1]
  %4428 = tail call i8* @realloc(i8* %4427, i32 %4426) nounwind ; <i8*> [#uses=2]
  %4429 = bitcast i8* %4428 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4430 = icmp eq i8* %4428, null                 ; <i1> [#uses=1]
  br i1 %4430, label %bb2.i.i277, label %_Z14test_variable4If31custom_divide_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i277:                                       ; preds = %bb1.i.i276
  %4431 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4425) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If31custom_divide_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i276, %bb5.i274
  %results.152 = phi %struct.one_result* [ %4429, %bb1.i.i276 ], [ %results.151, %bb5.i274 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.152 = phi i32 [ %4425, %bb1.i.i276 ], [ %allocated_results.151, %bb5.i274 ] ; <i32> [#uses=3]
  %4432 = phi %struct.one_result* [ %4429, %bb1.i.i276 ], [ %results.151, %bb5.i274 ] ; <%struct.one_result*> [#uses=2]
  %4433 = getelementptr inbounds %struct.one_result* %4432, i32 153, i32 0 ; <double*> [#uses=1]
  store double %4423, double* %4433, align 4
  %4434 = getelementptr inbounds %struct.one_result* %4432, i32 153, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([32 x i8]* @.str165, i32 0, i32 0), i8** %4434, align 4
  %4435 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i250, label %bb5.i254

bb1.i242:                                         ; preds = %bb2.preheader.i253, %bb1.i242
  %result.03.i238 = phi float [ 0.000000e+00, %bb2.preheader.i253 ], [ %4438, %bb1.i242 ] ; <float> [#uses=1]
  %n.02.i239 = phi i32 [ 0, %bb2.preheader.i253 ], [ %4439, %bb1.i242 ] ; <i32> [#uses=2]
  %scevgep.i240 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i239 ; <float*> [#uses=1]
  %4436 = load float* %scevgep.i240, align 4      ; <float> [#uses=1]
  %4437 = fadd float %4451, %4436                 ; <float> [#uses=1]
  %4438 = fadd float %4437, %result.03.i238       ; <float> [#uses=4]
  %4439 = add nsw i32 %n.02.i239, 1               ; <i32> [#uses=2]
  %exitcond.i241 = icmp eq i32 %4439, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i241, label %bb3.i244, label %bb1.i242

bb3.i244:                                         ; preds = %bb1.i242
  %4440 = fsub float %4438, %4453                 ; <float> [#uses=2]
  %4441 = tail call float @fabsf(float %4438) nounwind readnone ; <float> [#uses=1]
  %4442 = fpext float %4441 to double             ; <double> [#uses=1]
  %4443 = fcmp ogt double %4442, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4443, label %bb.i.i.i245, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i248

bb.i.i.i245:                                      ; preds = %bb3.i244
  %4444 = fdiv float %4440, %4438                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i248

_Z15tolerance_equalIfEbRT_S1_.exit.i.i248:        ; preds = %bb.i.i.i245, %bb3.i244
  %reldiff.0.in.i.i.i246 = phi float [ %4444, %bb.i.i.i245 ], [ %4440, %bb3.i244 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i247 = fpext float %reldiff.0.in.i.i.i246 to double ; <double> [#uses=1]
  %4445 = tail call double @fabs(double %reldiff.0.i.i.i247) nounwind readnone ; <double> [#uses=1]
  %4446 = fcmp olt double %4445, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4446, label %_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i249

bb.i1.i249:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i248
  %4447 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 154) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i249, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i248
  %4448 = icmp slt i32 %tmp.i252, %iterations.0   ; <i1> [#uses=1]
  br i1 %4448, label %bb2.preheader.i253, label %bb5.i254

bb.nph6.i250:                                     ; preds = %_Z14test_variable4If31custom_divide_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4449 = fdiv float %4092, %4093                 ; <float> [#uses=1]
  %4450 = fdiv float %4449, %4094                 ; <float> [#uses=1]
  %4451 = fdiv float %4450, %4096                 ; <float> [#uses=2]
  %4452 = fadd float %4451, %4090                 ; <float> [#uses=1]
  %4453 = fmul float %4452, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i253

bb2.preheader.i253:                               ; preds = %bb.nph6.i250, %_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i251 = phi i32 [ 0, %bb.nph6.i250 ], [ %tmp.i252, %_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i252 = add i32 %i.05.i251, 1               ; <i32> [#uses=2]
  br label %bb1.i242

bb5.i254:                                         ; preds = %_Z26check_shifted_variable_sumIf32custom_divide_multiple_variable2IfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4If31custom_divide_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4454 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4455 = sub i32 %4454, %4435                    ; <i32> [#uses=1]
  %4456 = sitofp i32 %4455 to double              ; <double> [#uses=1]
  %4457 = fdiv double %4456, 1.000000e+06         ; <double> [#uses=1]
  %.not3032 = icmp ne %struct.one_result* %results.152, null ; <i1> [#uses=1]
  %4458 = icmp sgt i32 %allocated_results.152, 154 ; <i1> [#uses=1]
  %or.cond3033 = and i1 %4458, %.not3032          ; <i1> [#uses=1]
  br i1 %or.cond3033, label %_Z14test_variable4If32custom_divide_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i256

bb1.i.i256:                                       ; preds = %bb5.i254
  %4459 = add nsw i32 %allocated_results.152, 10  ; <i32> [#uses=3]
  %4460 = mul i32 %4459, 12                       ; <i32> [#uses=1]
  %4461 = bitcast %struct.one_result* %results.152 to i8* ; <i8*> [#uses=1]
  %4462 = tail call i8* @realloc(i8* %4461, i32 %4460) nounwind ; <i8*> [#uses=2]
  %4463 = bitcast i8* %4462 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4464 = icmp eq i8* %4462, null                 ; <i1> [#uses=1]
  br i1 %4464, label %bb2.i.i257, label %_Z14test_variable4If32custom_divide_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i257:                                       ; preds = %bb1.i.i256
  %4465 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4459) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If32custom_divide_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i256, %bb5.i254
  %results.153 = phi %struct.one_result* [ %4463, %bb1.i.i256 ], [ %results.152, %bb5.i254 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.153 = phi i32 [ %4459, %bb1.i.i256 ], [ %allocated_results.152, %bb5.i254 ] ; <i32> [#uses=3]
  %4466 = phi %struct.one_result* [ %4463, %bb1.i.i256 ], [ %results.152, %bb5.i254 ] ; <%struct.one_result*> [#uses=2]
  %4467 = getelementptr inbounds %struct.one_result* %4466, i32 154, i32 0 ; <double*> [#uses=1]
  store double %4457, double* %4467, align 4
  %4468 = getelementptr inbounds %struct.one_result* %4466, i32 154, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str166, i32 0, i32 0), i8** %4468, align 4
  %4469 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i230, label %bb5.i234

bb1.i224:                                         ; preds = %bb2.preheader.i233, %bb1.i224
  %result.03.i220 = phi float [ 0.000000e+00, %bb2.preheader.i233 ], [ %4473, %bb1.i224 ] ; <float> [#uses=1]
  %n.02.i221 = phi i32 [ 0, %bb2.preheader.i233 ], [ %4474, %bb1.i224 ] ; <i32> [#uses=2]
  %scevgep.i222 = getelementptr [8000 x float]* @dataFloat, i32 0, i32 %n.02.i221 ; <float*> [#uses=1]
  %4470 = load float* %scevgep.i222, align 4      ; <float> [#uses=1]
  %4471 = fadd float %4470, %4092                 ; <float> [#uses=1]
  %4472 = fsub float %4471, %4485                 ; <float> [#uses=1]
  %4473 = fadd float %4472, %result.03.i220       ; <float> [#uses=4]
  %4474 = add nsw i32 %n.02.i221, 1               ; <i32> [#uses=2]
  %exitcond.i223 = icmp eq i32 %4474, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i223, label %bb3.i226, label %bb1.i224

bb3.i226:                                         ; preds = %bb1.i224
  %4475 = fsub float %4473, %4488                 ; <float> [#uses=2]
  %4476 = tail call float @fabsf(float %4473) nounwind readnone ; <float> [#uses=1]
  %4477 = fpext float %4476 to double             ; <double> [#uses=1]
  %4478 = fcmp ogt double %4477, 1.000000e-04     ; <i1> [#uses=1]
  br i1 %4478, label %bb.i.i.i227, label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i

bb.i.i.i227:                                      ; preds = %bb3.i226
  %4479 = fdiv float %4475, %4473                 ; <float> [#uses=1]
  br label %_Z15tolerance_equalIfEbRT_S1_.exit.i.i

_Z15tolerance_equalIfEbRT_S1_.exit.i.i:           ; preds = %bb.i.i.i227, %bb3.i226
  %reldiff.0.in.i.i.i = phi float [ %4479, %bb.i.i.i227 ], [ %4475, %bb3.i226 ] ; <float> [#uses=1]
  %reldiff.0.i.i.i228 = fpext float %reldiff.0.in.i.i.i to double ; <double> [#uses=1]
  %4480 = tail call double @fabs(double %reldiff.0.i.i.i228) nounwind readnone ; <double> [#uses=1]
  %4481 = fcmp olt double %4480, 1.000000e-03     ; <i1> [#uses=1]
  br i1 %4481, label %_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i229

bb.i1.i229:                                       ; preds = %_Z15tolerance_equalIfEbRT_S1_.exit.i.i
  %4482 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 155) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i229, %_Z15tolerance_equalIfEbRT_S1_.exit.i.i
  %4483 = icmp slt i32 %tmp.i232, %iterations.0   ; <i1> [#uses=1]
  br i1 %4483, label %bb2.preheader.i233, label %bb5.i234

bb.nph6.i230:                                     ; preds = %_Z14test_variable4If32custom_divide_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4484 = fmul float %4093, %4094                 ; <float> [#uses=1]
  %4485 = fdiv float %4484, %4096                 ; <float> [#uses=2]
  %4486 = fadd float %4090, %4092                 ; <float> [#uses=1]
  %4487 = fsub float %4486, %4485                 ; <float> [#uses=1]
  %4488 = fmul float %4487, 8.000000e+03          ; <float> [#uses=1]
  br label %bb2.preheader.i233

bb2.preheader.i233:                               ; preds = %bb.nph6.i230, %_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i231 = phi i32 [ 0, %bb.nph6.i230 ], [ %tmp.i232, %_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i232 = add i32 %i.05.i231, 1               ; <i32> [#uses=2]
  br label %bb1.i224

bb5.i234:                                         ; preds = %_Z26check_shifted_variable_sumIf30custom_mixed_multiple_variableIfEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4If32custom_divide_multiple_variable2IfEEvPT_iS2_S2_S2_S2_PKc.exit
  %4489 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4490 = sub i32 %4489, %4469                    ; <i32> [#uses=1]
  %4491 = sitofp i32 %4490 to double              ; <double> [#uses=1]
  %4492 = fdiv double %4491, 1.000000e+06         ; <double> [#uses=1]
  %.not3034 = icmp ne %struct.one_result* %results.153, null ; <i1> [#uses=1]
  %4493 = icmp sgt i32 %allocated_results.153, 155 ; <i1> [#uses=1]
  %or.cond3035 = and i1 %4493, %.not3034          ; <i1> [#uses=1]
  br i1 %or.cond3035, label %_Z14test_variable4If30custom_mixed_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i236

bb1.i.i236:                                       ; preds = %bb5.i234
  %4494 = add nsw i32 %allocated_results.153, 10  ; <i32> [#uses=3]
  %4495 = mul i32 %4494, 12                       ; <i32> [#uses=1]
  %4496 = bitcast %struct.one_result* %results.153 to i8* ; <i8*> [#uses=1]
  %4497 = tail call i8* @realloc(i8* %4496, i32 %4495) nounwind ; <i8*> [#uses=2]
  %4498 = bitcast i8* %4497 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4499 = icmp eq i8* %4497, null                 ; <i1> [#uses=1]
  br i1 %4499, label %bb2.i.i237, label %_Z14test_variable4If30custom_mixed_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i237:                                       ; preds = %bb1.i.i236
  %4500 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4494) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4If30custom_mixed_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i236, %bb5.i234
  %results.154 = phi %struct.one_result* [ %4498, %bb1.i.i236 ], [ %results.153, %bb5.i234 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.154 = phi i32 [ %4494, %bb1.i.i236 ], [ %allocated_results.153, %bb5.i234 ] ; <i32> [#uses=3]
  %4501 = phi %struct.one_result* [ %4498, %bb1.i.i236 ], [ %results.153, %bb5.i234 ] ; <%struct.one_result*> [#uses=2]
  %4502 = getelementptr inbounds %struct.one_result* %4501, i32 155, i32 0 ; <double*> [#uses=1]
  store double %4492, double* %4502, align 4
  %4503 = getelementptr inbounds %struct.one_result* %4501, i32 155, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str167, i32 0, i32 0), i8** %4503, align 4
  br label %bb.i43

bb.i43:                                           ; preds = %bb.i43, %_Z14test_variable4If30custom_mixed_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit
  %indvar.i39 = phi i32 [ 0, %_Z14test_variable4If30custom_mixed_multiple_variableIfEEvPT_iS2_S2_S2_S2_PKc.exit ], [ %tmp.i41, %bb.i43 ] ; <i32> [#uses=2]
  %tmp.i41 = add i32 %indvar.i39, 1               ; <i32> [#uses=2]
  %first_addr.01.i40 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %indvar.i39 ; <double*> [#uses=1]
  store double %init_value.0, double* %first_addr.01.i40, align 8
  %scevgep.i42.idx.mask = and i32 %tmp.i41, 536870911 ; <i32> [#uses=1]
  %4504 = icmp eq i32 %scevgep.i42.idx.mask, 8000 ; <i1> [#uses=1]
  br i1 %4504, label %_Z4fillIPddEvT_S1_T0_.exit, label %bb.i43

_Z4fillIPddEvT_S1_T0_.exit:                       ; preds = %bb.i43
  %4505 = fmul double %temp.0, 2.000000e+00       ; <double> [#uses=12]
  %4506 = fadd double %temp.0, 2.000000e+00       ; <double> [#uses=12]
  %4507 = fdiv double %4505, %4506                ; <double> [#uses=1]
  %4508 = fadd double %4507, %temp.0              ; <double> [#uses=11]
  %4509 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i212, label %bb5.i216

bb1.i204:                                         ; preds = %bb2.preheader.i215, %bb1.i204
  %result.03.i200 = phi double [ 0.000000e+00, %bb2.preheader.i215 ], [ %4512, %bb1.i204 ] ; <double> [#uses=1]
  %n.02.i201 = phi i32 [ 0, %bb2.preheader.i215 ], [ %4513, %bb1.i204 ] ; <i32> [#uses=2]
  %scevgep.i202 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i201 ; <double*> [#uses=1]
  %4510 = load double* %scevgep.i202, align 8     ; <double> [#uses=1]
  %4511 = fadd double %4510, %temp.0              ; <double> [#uses=1]
  %4512 = fadd double %4511, %result.03.i200      ; <double> [#uses=4]
  %4513 = add nsw i32 %n.02.i201, 1               ; <i32> [#uses=2]
  %exitcond.i203 = icmp eq i32 %4513, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i203, label %bb3.i206, label %bb1.i204

bb3.i206:                                         ; preds = %bb1.i204
  %4514 = fsub double %4512, %4523                ; <double> [#uses=2]
  %4515 = tail call double @fabs(double %4512) nounwind readnone ; <double> [#uses=1]
  %4516 = fcmp ogt double %4515, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4516, label %bb.i.i.i207, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i209

bb.i.i.i207:                                      ; preds = %bb3.i206
  %4517 = fdiv double %4514, %4512                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i209

_Z15tolerance_equalIdEbRT_S1_.exit.i.i209:        ; preds = %bb.i.i.i207, %bb3.i206
  %reldiff.0.i.i.i208 = phi double [ %4517, %bb.i.i.i207 ], [ %4514, %bb3.i206 ] ; <double> [#uses=1]
  %4518 = tail call double @fabs(double %reldiff.0.i.i.i208) nounwind readnone ; <double> [#uses=1]
  %4519 = fcmp olt double %4518, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4519, label %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211, label %bb.i1.i210

bb.i1.i210:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i209
  %4520 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 156) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211

_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211: ; preds = %bb.i1.i210, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i209
  %4521 = icmp slt i32 %tmp.i214, %iterations.0   ; <i1> [#uses=1]
  br i1 %4521, label %bb2.preheader.i215, label %bb5.i216

bb.nph6.i212:                                     ; preds = %_Z4fillIPddEvT_S1_T0_.exit
  %4522 = fadd double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4523 = fmul double %4522, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i215

bb2.preheader.i215:                               ; preds = %bb.nph6.i212, %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211
  %i.05.i213 = phi i32 [ 0, %bb.nph6.i212 ], [ %tmp.i214, %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211 ] ; <i32> [#uses=1]
  %tmp.i214 = add i32 %i.05.i213, 1               ; <i32> [#uses=2]
  br label %bb1.i204

bb5.i216:                                         ; preds = %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i211, %_Z4fillIPddEvT_S1_T0_.exit
  %4524 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4525 = sub i32 %4524, %4509                    ; <i32> [#uses=1]
  %4526 = sitofp i32 %4525 to double              ; <double> [#uses=1]
  %4527 = fdiv double %4526, 1.000000e+06         ; <double> [#uses=1]
  %.not3036 = icmp ne %struct.one_result* %results.154, null ; <i1> [#uses=1]
  %4528 = icmp sgt i32 %allocated_results.154, 156 ; <i1> [#uses=1]
  %or.cond3037 = and i1 %4528, %.not3036          ; <i1> [#uses=1]
  br i1 %or.cond3037, label %_Z14test_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit, label %bb1.i.i218

bb1.i.i218:                                       ; preds = %bb5.i216
  %4529 = add nsw i32 %allocated_results.154, 10  ; <i32> [#uses=3]
  %4530 = mul i32 %4529, 12                       ; <i32> [#uses=1]
  %4531 = bitcast %struct.one_result* %results.154 to i8* ; <i8*> [#uses=1]
  %4532 = tail call i8* @realloc(i8* %4531, i32 %4530) nounwind ; <i8*> [#uses=2]
  %4533 = bitcast i8* %4532 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4534 = icmp eq i8* %4532, null                 ; <i1> [#uses=1]
  br i1 %4534, label %bb2.i.i219, label %_Z14test_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit

bb2.i.i219:                                       ; preds = %bb1.i.i218
  %4535 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4529) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i218, %bb5.i216
  %results.155 = phi %struct.one_result* [ %4533, %bb1.i.i218 ], [ %results.154, %bb5.i216 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.155 = phi i32 [ %4529, %bb1.i.i218 ], [ %allocated_results.154, %bb5.i216 ] ; <i32> [#uses=3]
  %4536 = phi %struct.one_result* [ %4533, %bb1.i.i218 ], [ %results.154, %bb5.i216 ] ; <%struct.one_result*> [#uses=2]
  %4537 = getelementptr inbounds %struct.one_result* %4536, i32 156, i32 0 ; <double*> [#uses=1]
  store double %4527, double* %4537, align 4
  %4538 = getelementptr inbounds %struct.one_result* %4536, i32 156, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([20 x i8]* @.str168, i32 0, i32 0), i8** %4538, align 4
  %4539 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i192, label %bb5.i196

bb1.i185:                                         ; preds = %bb2.preheader.i195, %bb1.i185
  %result.03.i181 = phi double [ 0.000000e+00, %bb2.preheader.i195 ], [ %4541, %bb1.i185 ] ; <double> [#uses=1]
  %n.02.i182 = phi i32 [ 0, %bb2.preheader.i195 ], [ %4542, %bb1.i185 ] ; <i32> [#uses=2]
  %scevgep.i183 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i182 ; <double*> [#uses=1]
  %4540 = load double* %scevgep.i183, align 8     ; <double> [#uses=1]
  %4541 = fadd double %4540, %result.03.i181      ; <double> [#uses=2]
  %4542 = add nsw i32 %n.02.i182, 1               ; <i32> [#uses=2]
  %exitcond.i184 = icmp eq i32 %4542, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i184, label %bb3.i187, label %bb1.i185

bb3.i187:                                         ; preds = %bb1.i185
  %4543 = fadd double %4552, %4541                ; <double> [#uses=3]
  %4544 = fsub double %4543, %4554                ; <double> [#uses=2]
  %4545 = tail call double @fabs(double %4543) nounwind readnone ; <double> [#uses=1]
  %4546 = fcmp ogt double %4545, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4546, label %bb.i.i.i188, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i190

bb.i.i.i188:                                      ; preds = %bb3.i187
  %4547 = fdiv double %4544, %4543                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i190

_Z15tolerance_equalIdEbRT_S1_.exit.i.i190:        ; preds = %bb.i.i.i188, %bb3.i187
  %reldiff.0.i.i.i189 = phi double [ %4547, %bb.i.i.i188 ], [ %4544, %bb3.i187 ] ; <double> [#uses=1]
  %4548 = tail call double @fabs(double %reldiff.0.i.i.i189) nounwind readnone ; <double> [#uses=1]
  %4549 = fcmp olt double %4548, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4549, label %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i, label %bb.i1.i191

bb.i1.i191:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i190
  %4550 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 157) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i

_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i: ; preds = %bb.i1.i191, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i190
  %4551 = icmp slt i32 %tmp.i194, %iterations.0   ; <i1> [#uses=1]
  br i1 %4551, label %bb2.preheader.i195, label %bb5.i196

bb.nph6.i192:                                     ; preds = %_Z14test_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit
  %4552 = fmul double %temp.0, 8.000000e+03       ; <double> [#uses=1]
  %4553 = fadd double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4554 = fmul double %4553, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i195

bb2.preheader.i195:                               ; preds = %bb.nph6.i192, %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i
  %i.05.i193 = phi i32 [ 0, %bb.nph6.i192 ], [ %tmp.i194, %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i194 = add i32 %i.05.i193, 1               ; <i32> [#uses=2]
  br label %bb1.i185

bb5.i196:                                         ; preds = %_Z26check_shifted_variable_sumId19custom_add_variableIdEEvT_S2_.exit.i, %_Z14test_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit
  %4555 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4556 = sub i32 %4555, %4539                    ; <i32> [#uses=1]
  %4557 = sitofp i32 %4556 to double              ; <double> [#uses=1]
  %4558 = fdiv double %4557, 1.000000e+06         ; <double> [#uses=1]
  %.not3038 = icmp ne %struct.one_result* %results.155, null ; <i1> [#uses=1]
  %4559 = icmp sgt i32 %allocated_results.155, 157 ; <i1> [#uses=1]
  %or.cond3039 = and i1 %4559, %.not3038          ; <i1> [#uses=1]
  br i1 %or.cond3039, label %_Z22test_hoisted_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit, label %bb1.i.i198

bb1.i.i198:                                       ; preds = %bb5.i196
  %4560 = add nsw i32 %allocated_results.155, 10  ; <i32> [#uses=3]
  %4561 = mul i32 %4560, 12                       ; <i32> [#uses=1]
  %4562 = bitcast %struct.one_result* %results.155 to i8* ; <i8*> [#uses=1]
  %4563 = tail call i8* @realloc(i8* %4562, i32 %4561) nounwind ; <i8*> [#uses=2]
  %4564 = bitcast i8* %4563 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4565 = icmp eq i8* %4563, null                 ; <i1> [#uses=1]
  br i1 %4565, label %bb2.i.i199, label %_Z22test_hoisted_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit

bb2.i.i199:                                       ; preds = %bb1.i.i198
  %4566 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4560) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z22test_hoisted_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i198, %bb5.i196
  %results.156 = phi %struct.one_result* [ %4564, %bb1.i.i198 ], [ %results.155, %bb5.i196 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.156 = phi i32 [ %4560, %bb1.i.i198 ], [ %allocated_results.155, %bb5.i196 ] ; <i32> [#uses=3]
  %4567 = phi %struct.one_result* [ %4564, %bb1.i.i198 ], [ %results.155, %bb5.i196 ] ; <%struct.one_result*> [#uses=2]
  %4568 = getelementptr inbounds %struct.one_result* %4567, i32 157, i32 0 ; <double*> [#uses=1]
  store double %4558, double* %4568, align 4
  %4569 = getelementptr inbounds %struct.one_result* %4567, i32 157, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([28 x i8]* @.str169, i32 0, i32 0), i8** %4569, align 4
  %4570 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i173, label %bb5.i177

bb1.i166:                                         ; preds = %bb2.preheader.i176, %bb1.i166
  %result.03.i162 = phi double [ 0.000000e+00, %bb2.preheader.i176 ], [ %4576, %bb1.i166 ] ; <double> [#uses=1]
  %n.02.i163 = phi i32 [ 0, %bb2.preheader.i176 ], [ %4577, %bb1.i166 ] ; <i32> [#uses=2]
  %scevgep.i164 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i163 ; <double*> [#uses=1]
  %4571 = load double* %scevgep.i164, align 8     ; <double> [#uses=1]
  %4572 = fadd double %4571, %temp.0              ; <double> [#uses=1]
  %4573 = fadd double %4572, %4505                ; <double> [#uses=1]
  %4574 = fadd double %4573, %4506                ; <double> [#uses=1]
  %4575 = fadd double %4574, %4508                ; <double> [#uses=1]
  %4576 = fadd double %4575, %result.03.i162      ; <double> [#uses=4]
  %4577 = add nsw i32 %n.02.i163, 1               ; <i32> [#uses=2]
  %exitcond.i165 = icmp eq i32 %4577, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i165, label %bb3.i168, label %bb1.i166

bb3.i168:                                         ; preds = %bb1.i166
  %4578 = fsub double %4576, %4590                ; <double> [#uses=2]
  %4579 = tail call double @fabs(double %4576) nounwind readnone ; <double> [#uses=1]
  %4580 = fcmp ogt double %4579, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4580, label %bb.i.i.i169, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i171

bb.i.i.i169:                                      ; preds = %bb3.i168
  %4581 = fdiv double %4578, %4576                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i171

_Z15tolerance_equalIdEbRT_S1_.exit.i.i171:        ; preds = %bb.i.i.i169, %bb3.i168
  %reldiff.0.i.i.i170 = phi double [ %4581, %bb.i.i.i169 ], [ %4578, %bb3.i168 ] ; <double> [#uses=1]
  %4582 = tail call double @fabs(double %reldiff.0.i.i.i170) nounwind readnone ; <double> [#uses=1]
  %4583 = fcmp olt double %4582, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4583, label %_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i172

bb.i1.i172:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i171
  %4584 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 158) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i172, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i171
  %4585 = icmp slt i32 %tmp.i175, %iterations.0   ; <i1> [#uses=1]
  br i1 %4585, label %bb2.preheader.i176, label %bb5.i177

bb.nph6.i173:                                     ; preds = %_Z22test_hoisted_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit
  %4586 = fadd double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4587 = fadd double %4586, %4505                ; <double> [#uses=1]
  %4588 = fadd double %4587, %4506                ; <double> [#uses=1]
  %4589 = fadd double %4588, %4508                ; <double> [#uses=1]
  %4590 = fmul double %4589, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i176

bb2.preheader.i176:                               ; preds = %bb.nph6.i173, %_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i174 = phi i32 [ 0, %bb.nph6.i173 ], [ %tmp.i175, %_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i175 = add i32 %i.05.i174, 1               ; <i32> [#uses=2]
  br label %bb1.i166

bb5.i177:                                         ; preds = %_Z26check_shifted_variable_sumId28custom_add_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, %_Z22test_hoisted_variable1Id19custom_add_variableIdEEvPT_iS2_PKc.exit
  %4591 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4592 = sub i32 %4591, %4570                    ; <i32> [#uses=1]
  %4593 = sitofp i32 %4592 to double              ; <double> [#uses=1]
  %4594 = fdiv double %4593, 1.000000e+06         ; <double> [#uses=1]
  %.not3040 = icmp ne %struct.one_result* %results.156, null ; <i1> [#uses=1]
  %4595 = icmp sgt i32 %allocated_results.156, 158 ; <i1> [#uses=1]
  %or.cond3041 = and i1 %4595, %.not3040          ; <i1> [#uses=1]
  br i1 %or.cond3041, label %_Z14test_variable4Id28custom_add_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i179

bb1.i.i179:                                       ; preds = %bb5.i177
  %4596 = add nsw i32 %allocated_results.156, 10  ; <i32> [#uses=3]
  %4597 = mul i32 %4596, 12                       ; <i32> [#uses=1]
  %4598 = bitcast %struct.one_result* %results.156 to i8* ; <i8*> [#uses=1]
  %4599 = tail call i8* @realloc(i8* %4598, i32 %4597) nounwind ; <i8*> [#uses=2]
  %4600 = bitcast i8* %4599 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4601 = icmp eq i8* %4599, null                 ; <i1> [#uses=1]
  br i1 %4601, label %bb2.i.i180, label %_Z14test_variable4Id28custom_add_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i180:                                       ; preds = %bb1.i.i179
  %4602 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4596) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id28custom_add_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i179, %bb5.i177
  %results.157 = phi %struct.one_result* [ %4600, %bb1.i.i179 ], [ %results.156, %bb5.i177 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.157 = phi i32 [ %4596, %bb1.i.i179 ], [ %allocated_results.156, %bb5.i177 ] ; <i32> [#uses=3]
  %4603 = phi %struct.one_result* [ %4600, %bb1.i.i179 ], [ %results.156, %bb5.i177 ] ; <%struct.one_result*> [#uses=2]
  %4604 = getelementptr inbounds %struct.one_result* %4603, i32 158, i32 0 ; <double*> [#uses=1]
  store double %4594, double* %4604, align 4
  %4605 = getelementptr inbounds %struct.one_result* %4603, i32 158, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([30 x i8]* @.str170, i32 0, i32 0), i8** %4605, align 4
  %4606 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i154, label %bb5.i158

bb1.i147:                                         ; preds = %bb2.preheader.i157, %bb1.i147
  %result.03.i143 = phi double [ 0.000000e+00, %bb2.preheader.i157 ], [ %4609, %bb1.i147 ] ; <double> [#uses=1]
  %n.02.i144 = phi i32 [ 0, %bb2.preheader.i157 ], [ %4610, %bb1.i147 ] ; <i32> [#uses=2]
  %scevgep.i145 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i144 ; <double*> [#uses=1]
  %4607 = load double* %scevgep.i145, align 8     ; <double> [#uses=1]
  %4608 = fsub double %4607, %temp.0              ; <double> [#uses=1]
  %4609 = fadd double %4608, %result.03.i143      ; <double> [#uses=4]
  %4610 = add nsw i32 %n.02.i144, 1               ; <i32> [#uses=2]
  %exitcond.i146 = icmp eq i32 %4610, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i146, label %bb3.i149, label %bb1.i147

bb3.i149:                                         ; preds = %bb1.i147
  %4611 = fsub double %4609, %4620                ; <double> [#uses=2]
  %4612 = tail call double @fabs(double %4609) nounwind readnone ; <double> [#uses=1]
  %4613 = fcmp ogt double %4612, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4613, label %bb.i.i.i150, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i152

bb.i.i.i150:                                      ; preds = %bb3.i149
  %4614 = fdiv double %4611, %4609                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i152

_Z15tolerance_equalIdEbRT_S1_.exit.i.i152:        ; preds = %bb.i.i.i150, %bb3.i149
  %reldiff.0.i.i.i151 = phi double [ %4614, %bb.i.i.i150 ], [ %4611, %bb3.i149 ] ; <double> [#uses=1]
  %4615 = tail call double @fabs(double %reldiff.0.i.i.i151) nounwind readnone ; <double> [#uses=1]
  %4616 = fcmp olt double %4615, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4616, label %_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i, label %bb.i1.i153

bb.i1.i153:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i152
  %4617 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 159) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i

_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i: ; preds = %bb.i1.i153, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i152
  %4618 = icmp slt i32 %tmp.i156, %iterations.0   ; <i1> [#uses=1]
  br i1 %4618, label %bb2.preheader.i157, label %bb5.i158

bb.nph6.i154:                                     ; preds = %_Z14test_variable4Id28custom_add_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4619 = fsub double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4620 = fmul double %4619, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i157

bb2.preheader.i157:                               ; preds = %bb.nph6.i154, %_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i
  %i.05.i155 = phi i32 [ 0, %bb.nph6.i154 ], [ %tmp.i156, %_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i156 = add i32 %i.05.i155, 1               ; <i32> [#uses=2]
  br label %bb1.i147

bb5.i158:                                         ; preds = %_Z26check_shifted_variable_sumId19custom_sub_variableIdEEvT_S2_.exit.i, %_Z14test_variable4Id28custom_add_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4621 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4622 = sub i32 %4621, %4606                    ; <i32> [#uses=1]
  %4623 = sitofp i32 %4622 to double              ; <double> [#uses=1]
  %4624 = fdiv double %4623, 1.000000e+06         ; <double> [#uses=1]
  %.not3042 = icmp ne %struct.one_result* %results.157, null ; <i1> [#uses=1]
  %4625 = icmp sgt i32 %allocated_results.157, 159 ; <i1> [#uses=1]
  %or.cond3043 = and i1 %4625, %.not3042          ; <i1> [#uses=1]
  br i1 %or.cond3043, label %_Z14test_variable1Id19custom_sub_variableIdEEvPT_iS2_PKc.exit, label %bb1.i.i160

bb1.i.i160:                                       ; preds = %bb5.i158
  %4626 = add nsw i32 %allocated_results.157, 10  ; <i32> [#uses=3]
  %4627 = mul i32 %4626, 12                       ; <i32> [#uses=1]
  %4628 = bitcast %struct.one_result* %results.157 to i8* ; <i8*> [#uses=1]
  %4629 = tail call i8* @realloc(i8* %4628, i32 %4627) nounwind ; <i8*> [#uses=2]
  %4630 = bitcast i8* %4629 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4631 = icmp eq i8* %4629, null                 ; <i1> [#uses=1]
  br i1 %4631, label %bb2.i.i161, label %_Z14test_variable1Id19custom_sub_variableIdEEvPT_iS2_PKc.exit

bb2.i.i161:                                       ; preds = %bb1.i.i160
  %4632 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4626) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Id19custom_sub_variableIdEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i160, %bb5.i158
  %results.158 = phi %struct.one_result* [ %4630, %bb1.i.i160 ], [ %results.157, %bb5.i158 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.158 = phi i32 [ %4626, %bb1.i.i160 ], [ %allocated_results.157, %bb5.i158 ] ; <i32> [#uses=3]
  %4633 = phi %struct.one_result* [ %4630, %bb1.i.i160 ], [ %results.157, %bb5.i158 ] ; <%struct.one_result*> [#uses=2]
  %4634 = getelementptr inbounds %struct.one_result* %4633, i32 159, i32 0 ; <double*> [#uses=1]
  store double %4624, double* %4634, align 4
  %4635 = getelementptr inbounds %struct.one_result* %4633, i32 159, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str171, i32 0, i32 0), i8** %4635, align 4
  %4636 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i135, label %bb5.i139

bb1.i128:                                         ; preds = %bb2.preheader.i138, %bb1.i128
  %result.03.i124 = phi double [ 0.000000e+00, %bb2.preheader.i138 ], [ %4642, %bb1.i128 ] ; <double> [#uses=1]
  %n.02.i125 = phi i32 [ 0, %bb2.preheader.i138 ], [ %4643, %bb1.i128 ] ; <i32> [#uses=2]
  %scevgep.i126 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i125 ; <double*> [#uses=1]
  %4637 = load double* %scevgep.i126, align 8     ; <double> [#uses=1]
  %4638 = fsub double %4637, %temp.0              ; <double> [#uses=1]
  %4639 = fsub double %4638, %4505                ; <double> [#uses=1]
  %4640 = fsub double %4639, %4506                ; <double> [#uses=1]
  %4641 = fsub double %4640, %4508                ; <double> [#uses=1]
  %4642 = fadd double %4641, %result.03.i124      ; <double> [#uses=4]
  %4643 = add nsw i32 %n.02.i125, 1               ; <i32> [#uses=2]
  %exitcond.i127 = icmp eq i32 %4643, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i127, label %bb3.i130, label %bb1.i128

bb3.i130:                                         ; preds = %bb1.i128
  %4644 = fsub double %4642, %4656                ; <double> [#uses=2]
  %4645 = tail call double @fabs(double %4642) nounwind readnone ; <double> [#uses=1]
  %4646 = fcmp ogt double %4645, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4646, label %bb.i.i.i131, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i133

bb.i.i.i131:                                      ; preds = %bb3.i130
  %4647 = fdiv double %4644, %4642                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i133

_Z15tolerance_equalIdEbRT_S1_.exit.i.i133:        ; preds = %bb.i.i.i131, %bb3.i130
  %reldiff.0.i.i.i132 = phi double [ %4647, %bb.i.i.i131 ], [ %4644, %bb3.i130 ] ; <double> [#uses=1]
  %4648 = tail call double @fabs(double %reldiff.0.i.i.i132) nounwind readnone ; <double> [#uses=1]
  %4649 = fcmp olt double %4648, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4649, label %_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i134

bb.i1.i134:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i133
  %4650 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 160) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i134, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i133
  %4651 = icmp slt i32 %tmp.i137, %iterations.0   ; <i1> [#uses=1]
  br i1 %4651, label %bb2.preheader.i138, label %bb5.i139

bb.nph6.i135:                                     ; preds = %_Z14test_variable1Id19custom_sub_variableIdEEvPT_iS2_PKc.exit
  %4652 = fsub double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4653 = fsub double %4652, %4505                ; <double> [#uses=1]
  %4654 = fsub double %4653, %4506                ; <double> [#uses=1]
  %4655 = fsub double %4654, %4508                ; <double> [#uses=1]
  %4656 = fmul double %4655, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i138

bb2.preheader.i138:                               ; preds = %bb.nph6.i135, %_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i136 = phi i32 [ 0, %bb.nph6.i135 ], [ %tmp.i137, %_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i137 = add i32 %i.05.i136, 1               ; <i32> [#uses=2]
  br label %bb1.i128

bb5.i139:                                         ; preds = %_Z26check_shifted_variable_sumId28custom_sub_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1Id19custom_sub_variableIdEEvPT_iS2_PKc.exit
  %4657 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4658 = sub i32 %4657, %4636                    ; <i32> [#uses=1]
  %4659 = sitofp i32 %4658 to double              ; <double> [#uses=1]
  %4660 = fdiv double %4659, 1.000000e+06         ; <double> [#uses=1]
  %.not3044 = icmp ne %struct.one_result* %results.158, null ; <i1> [#uses=1]
  %4661 = icmp sgt i32 %allocated_results.158, 160 ; <i1> [#uses=1]
  %or.cond3045 = and i1 %4661, %.not3044          ; <i1> [#uses=1]
  br i1 %or.cond3045, label %_Z14test_variable4Id28custom_sub_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i141

bb1.i.i141:                                       ; preds = %bb5.i139
  %4662 = add nsw i32 %allocated_results.158, 10  ; <i32> [#uses=3]
  %4663 = mul i32 %4662, 12                       ; <i32> [#uses=1]
  %4664 = bitcast %struct.one_result* %results.158 to i8* ; <i8*> [#uses=1]
  %4665 = tail call i8* @realloc(i8* %4664, i32 %4663) nounwind ; <i8*> [#uses=2]
  %4666 = bitcast i8* %4665 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4667 = icmp eq i8* %4665, null                 ; <i1> [#uses=1]
  br i1 %4667, label %bb2.i.i142, label %_Z14test_variable4Id28custom_sub_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i142:                                       ; preds = %bb1.i.i141
  %4668 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4662) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id28custom_sub_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i141, %bb5.i139
  %results.159 = phi %struct.one_result* [ %4666, %bb1.i.i141 ], [ %results.158, %bb5.i139 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.159 = phi i32 [ %4662, %bb1.i.i141 ], [ %allocated_results.158, %bb5.i139 ] ; <i32> [#uses=3]
  %4669 = phi %struct.one_result* [ %4666, %bb1.i.i141 ], [ %results.158, %bb5.i139 ] ; <%struct.one_result*> [#uses=2]
  %4670 = getelementptr inbounds %struct.one_result* %4669, i32 160, i32 0 ; <double*> [#uses=1]
  store double %4660, double* %4670, align 4
  %4671 = getelementptr inbounds %struct.one_result* %4669, i32 160, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([35 x i8]* @.str172, i32 0, i32 0), i8** %4671, align 4
  %4672 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i116, label %bb5.i120

bb1.i109:                                         ; preds = %bb2.preheader.i119, %bb1.i109
  %result.03.i105 = phi double [ 0.000000e+00, %bb2.preheader.i119 ], [ %4675, %bb1.i109 ] ; <double> [#uses=1]
  %n.02.i106 = phi i32 [ 0, %bb2.preheader.i119 ], [ %4676, %bb1.i109 ] ; <i32> [#uses=2]
  %scevgep.i107 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i106 ; <double*> [#uses=1]
  %4673 = load double* %scevgep.i107, align 8     ; <double> [#uses=1]
  %4674 = fmul double %4673, %temp.0              ; <double> [#uses=1]
  %4675 = fadd double %4674, %result.03.i105      ; <double> [#uses=4]
  %4676 = add nsw i32 %n.02.i106, 1               ; <i32> [#uses=2]
  %exitcond.i108 = icmp eq i32 %4676, 8000        ; <i1> [#uses=1]
  br i1 %exitcond.i108, label %bb3.i111, label %bb1.i109

bb3.i111:                                         ; preds = %bb1.i109
  %4677 = fsub double %4675, %4686                ; <double> [#uses=2]
  %4678 = tail call double @fabs(double %4675) nounwind readnone ; <double> [#uses=1]
  %4679 = fcmp ogt double %4678, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4679, label %bb.i.i.i112, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i114

bb.i.i.i112:                                      ; preds = %bb3.i111
  %4680 = fdiv double %4677, %4675                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i114

_Z15tolerance_equalIdEbRT_S1_.exit.i.i114:        ; preds = %bb.i.i.i112, %bb3.i111
  %reldiff.0.i.i.i113 = phi double [ %4680, %bb.i.i.i112 ], [ %4677, %bb3.i111 ] ; <double> [#uses=1]
  %4681 = tail call double @fabs(double %reldiff.0.i.i.i113) nounwind readnone ; <double> [#uses=1]
  %4682 = fcmp olt double %4681, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4682, label %_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i, label %bb.i1.i115

bb.i1.i115:                                       ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i114
  %4683 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 161) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i

_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i: ; preds = %bb.i1.i115, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i114
  %4684 = icmp slt i32 %tmp.i118, %iterations.0   ; <i1> [#uses=1]
  br i1 %4684, label %bb2.preheader.i119, label %bb5.i120

bb.nph6.i116:                                     ; preds = %_Z14test_variable4Id28custom_sub_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4685 = fmul double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4686 = fmul double %4685, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i119

bb2.preheader.i119:                               ; preds = %bb.nph6.i116, %_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i
  %i.05.i117 = phi i32 [ 0, %bb.nph6.i116 ], [ %tmp.i118, %_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i118 = add i32 %i.05.i117, 1               ; <i32> [#uses=2]
  br label %bb1.i109

bb5.i120:                                         ; preds = %_Z26check_shifted_variable_sumId24custom_multiply_variableIdEEvT_S2_.exit.i, %_Z14test_variable4Id28custom_sub_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4687 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4688 = sub i32 %4687, %4672                    ; <i32> [#uses=1]
  %4689 = sitofp i32 %4688 to double              ; <double> [#uses=1]
  %4690 = fdiv double %4689, 1.000000e+06         ; <double> [#uses=1]
  %.not3046 = icmp ne %struct.one_result* %results.159, null ; <i1> [#uses=1]
  %4691 = icmp sgt i32 %allocated_results.159, 161 ; <i1> [#uses=1]
  %or.cond3047 = and i1 %4691, %.not3046          ; <i1> [#uses=1]
  br i1 %or.cond3047, label %_Z14test_variable1Id24custom_multiply_variableIdEEvPT_iS2_PKc.exit, label %bb1.i.i122

bb1.i.i122:                                       ; preds = %bb5.i120
  %4692 = add nsw i32 %allocated_results.159, 10  ; <i32> [#uses=3]
  %4693 = mul i32 %4692, 12                       ; <i32> [#uses=1]
  %4694 = bitcast %struct.one_result* %results.159 to i8* ; <i8*> [#uses=1]
  %4695 = tail call i8* @realloc(i8* %4694, i32 %4693) nounwind ; <i8*> [#uses=2]
  %4696 = bitcast i8* %4695 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4697 = icmp eq i8* %4695, null                 ; <i1> [#uses=1]
  br i1 %4697, label %bb2.i.i123, label %_Z14test_variable1Id24custom_multiply_variableIdEEvPT_iS2_PKc.exit

bb2.i.i123:                                       ; preds = %bb1.i.i122
  %4698 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4692) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Id24custom_multiply_variableIdEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i122, %bb5.i120
  %results.160 = phi %struct.one_result* [ %4696, %bb1.i.i122 ], [ %results.159, %bb5.i120 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.160 = phi i32 [ %4692, %bb1.i.i122 ], [ %allocated_results.159, %bb5.i120 ] ; <i32> [#uses=3]
  %4699 = phi %struct.one_result* [ %4696, %bb1.i.i122 ], [ %results.159, %bb5.i120 ] ; <%struct.one_result*> [#uses=2]
  %4700 = getelementptr inbounds %struct.one_result* %4699, i32 161, i32 0 ; <double*> [#uses=1]
  store double %4690, double* %4700, align 4
  %4701 = getelementptr inbounds %struct.one_result* %4699, i32 161, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([25 x i8]* @.str173, i32 0, i32 0), i8** %4701, align 4
  %4702 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i97, label %bb5.i101

bb1.i90:                                          ; preds = %bb2.preheader.i100, %bb1.i90
  %result.03.i86 = phi double [ 0.000000e+00, %bb2.preheader.i100 ], [ %4708, %bb1.i90 ] ; <double> [#uses=1]
  %n.02.i87 = phi i32 [ 0, %bb2.preheader.i100 ], [ %4709, %bb1.i90 ] ; <i32> [#uses=2]
  %scevgep.i88 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i87 ; <double*> [#uses=1]
  %4703 = load double* %scevgep.i88, align 8      ; <double> [#uses=1]
  %4704 = fmul double %4703, %temp.0              ; <double> [#uses=1]
  %4705 = fmul double %4704, %4505                ; <double> [#uses=1]
  %4706 = fmul double %4705, %4506                ; <double> [#uses=1]
  %4707 = fmul double %4706, %4508                ; <double> [#uses=1]
  %4708 = fadd double %4707, %result.03.i86       ; <double> [#uses=4]
  %4709 = add nsw i32 %n.02.i87, 1                ; <i32> [#uses=2]
  %exitcond.i89 = icmp eq i32 %4709, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i89, label %bb3.i92, label %bb1.i90

bb3.i92:                                          ; preds = %bb1.i90
  %4710 = fsub double %4708, %4722                ; <double> [#uses=2]
  %4711 = tail call double @fabs(double %4708) nounwind readnone ; <double> [#uses=1]
  %4712 = fcmp ogt double %4711, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4712, label %bb.i.i.i93, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i95

bb.i.i.i93:                                       ; preds = %bb3.i92
  %4713 = fdiv double %4710, %4708                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i95

_Z15tolerance_equalIdEbRT_S1_.exit.i.i95:         ; preds = %bb.i.i.i93, %bb3.i92
  %reldiff.0.i.i.i94 = phi double [ %4713, %bb.i.i.i93 ], [ %4710, %bb3.i92 ] ; <double> [#uses=1]
  %4714 = tail call double @fabs(double %reldiff.0.i.i.i94) nounwind readnone ; <double> [#uses=1]
  %4715 = fcmp olt double %4714, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4715, label %_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i96

bb.i1.i96:                                        ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i95
  %4716 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 162) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i96, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i95
  %4717 = icmp slt i32 %tmp.i99, %iterations.0    ; <i1> [#uses=1]
  br i1 %4717, label %bb2.preheader.i100, label %bb5.i101

bb.nph6.i97:                                      ; preds = %_Z14test_variable1Id24custom_multiply_variableIdEEvPT_iS2_PKc.exit
  %4718 = fmul double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4719 = fmul double %4718, %4505                ; <double> [#uses=1]
  %4720 = fmul double %4719, %4506                ; <double> [#uses=1]
  %4721 = fmul double %4720, %4508                ; <double> [#uses=1]
  %4722 = fmul double %4721, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i100

bb2.preheader.i100:                               ; preds = %bb.nph6.i97, %_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i98 = phi i32 [ 0, %bb.nph6.i97 ], [ %tmp.i99, %_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i99 = add i32 %i.05.i98, 1                 ; <i32> [#uses=2]
  br label %bb1.i90

bb5.i101:                                         ; preds = %_Z26check_shifted_variable_sumId33custom_multiply_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1Id24custom_multiply_variableIdEEvPT_iS2_PKc.exit
  %4723 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4724 = sub i32 %4723, %4702                    ; <i32> [#uses=1]
  %4725 = sitofp i32 %4724 to double              ; <double> [#uses=1]
  %4726 = fdiv double %4725, 1.000000e+06         ; <double> [#uses=1]
  %.not3048 = icmp ne %struct.one_result* %results.160, null ; <i1> [#uses=1]
  %4727 = icmp sgt i32 %allocated_results.160, 162 ; <i1> [#uses=1]
  %or.cond3049 = and i1 %4727, %.not3048          ; <i1> [#uses=1]
  br i1 %or.cond3049, label %_Z14test_variable4Id33custom_multiply_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i103

bb1.i.i103:                                       ; preds = %bb5.i101
  %4728 = add nsw i32 %allocated_results.160, 10  ; <i32> [#uses=3]
  %4729 = mul i32 %4728, 12                       ; <i32> [#uses=1]
  %4730 = bitcast %struct.one_result* %results.160 to i8* ; <i8*> [#uses=1]
  %4731 = tail call i8* @realloc(i8* %4730, i32 %4729) nounwind ; <i8*> [#uses=2]
  %4732 = bitcast i8* %4731 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4733 = icmp eq i8* %4731, null                 ; <i1> [#uses=1]
  br i1 %4733, label %bb2.i.i104, label %_Z14test_variable4Id33custom_multiply_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i104:                                       ; preds = %bb1.i.i103
  %4734 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4728) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id33custom_multiply_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i103, %bb5.i101
  %results.161 = phi %struct.one_result* [ %4732, %bb1.i.i103 ], [ %results.160, %bb5.i101 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.161 = phi i32 [ %4728, %bb1.i.i103 ], [ %allocated_results.160, %bb5.i101 ] ; <i32> [#uses=3]
  %4735 = phi %struct.one_result* [ %4732, %bb1.i.i103 ], [ %results.160, %bb5.i101 ] ; <%struct.one_result*> [#uses=2]
  %4736 = getelementptr inbounds %struct.one_result* %4735, i32 162, i32 0 ; <double*> [#uses=1]
  store double %4726, double* %4736, align 4
  %4737 = getelementptr inbounds %struct.one_result* %4735, i32 162, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([36 x i8]* @.str174, i32 0, i32 0), i8** %4737, align 4
  %4738 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i78, label %bb5.i82

bb1.i71:                                          ; preds = %bb2.preheader.i81, %bb1.i71
  %result.03.i67 = phi double [ 0.000000e+00, %bb2.preheader.i81 ], [ %4741, %bb1.i71 ] ; <double> [#uses=1]
  %n.02.i68 = phi i32 [ 0, %bb2.preheader.i81 ], [ %4742, %bb1.i71 ] ; <i32> [#uses=2]
  %scevgep.i69 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i68 ; <double*> [#uses=1]
  %4739 = load double* %scevgep.i69, align 8      ; <double> [#uses=1]
  %4740 = fadd double %4753, %4739                ; <double> [#uses=1]
  %4741 = fadd double %4740, %result.03.i67       ; <double> [#uses=4]
  %4742 = add nsw i32 %n.02.i68, 1                ; <i32> [#uses=2]
  %exitcond.i70 = icmp eq i32 %4742, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i70, label %bb3.i73, label %bb1.i71

bb3.i73:                                          ; preds = %bb1.i71
  %4743 = fsub double %4741, %4755                ; <double> [#uses=2]
  %4744 = tail call double @fabs(double %4741) nounwind readnone ; <double> [#uses=1]
  %4745 = fcmp ogt double %4744, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4745, label %bb.i.i.i74, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i76

bb.i.i.i74:                                       ; preds = %bb3.i73
  %4746 = fdiv double %4743, %4741                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i76

_Z15tolerance_equalIdEbRT_S1_.exit.i.i76:         ; preds = %bb.i.i.i74, %bb3.i73
  %reldiff.0.i.i.i75 = phi double [ %4746, %bb.i.i.i74 ], [ %4743, %bb3.i73 ] ; <double> [#uses=1]
  %4747 = tail call double @fabs(double %reldiff.0.i.i.i75) nounwind readnone ; <double> [#uses=1]
  %4748 = fcmp olt double %4747, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4748, label %_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i77

bb.i1.i77:                                        ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i76
  %4749 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 163) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i77, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i76
  %4750 = icmp slt i32 %tmp.i80, %iterations.0    ; <i1> [#uses=1]
  br i1 %4750, label %bb2.preheader.i81, label %bb5.i82

bb.nph6.i78:                                      ; preds = %_Z14test_variable4Id33custom_multiply_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4751 = fmul double %temp.0, %4505              ; <double> [#uses=1]
  %4752 = fmul double %4751, %4506                ; <double> [#uses=1]
  %4753 = fmul double %4752, %4508                ; <double> [#uses=2]
  %4754 = fadd double %4753, %init_value.0        ; <double> [#uses=1]
  %4755 = fmul double %4754, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i81

bb2.preheader.i81:                                ; preds = %bb.nph6.i78, %_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i79 = phi i32 [ 0, %bb.nph6.i78 ], [ %tmp.i80, %_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i80 = add i32 %i.05.i79, 1                 ; <i32> [#uses=2]
  br label %bb1.i71

bb5.i82:                                          ; preds = %_Z26check_shifted_variable_sumId34custom_multiply_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4Id33custom_multiply_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4756 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4757 = sub i32 %4756, %4738                    ; <i32> [#uses=1]
  %4758 = sitofp i32 %4757 to double              ; <double> [#uses=1]
  %4759 = fdiv double %4758, 1.000000e+06         ; <double> [#uses=1]
  %.not3050 = icmp ne %struct.one_result* %results.161, null ; <i1> [#uses=1]
  %4760 = icmp sgt i32 %allocated_results.161, 163 ; <i1> [#uses=1]
  %or.cond3051 = and i1 %4760, %.not3050          ; <i1> [#uses=1]
  br i1 %or.cond3051, label %_Z14test_variable4Id34custom_multiply_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i84

bb1.i.i84:                                        ; preds = %bb5.i82
  %4761 = add nsw i32 %allocated_results.161, 10  ; <i32> [#uses=3]
  %4762 = mul i32 %4761, 12                       ; <i32> [#uses=1]
  %4763 = bitcast %struct.one_result* %results.161 to i8* ; <i8*> [#uses=1]
  %4764 = tail call i8* @realloc(i8* %4763, i32 %4762) nounwind ; <i8*> [#uses=2]
  %4765 = bitcast i8* %4764 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4766 = icmp eq i8* %4764, null                 ; <i1> [#uses=1]
  br i1 %4766, label %bb2.i.i85, label %_Z14test_variable4Id34custom_multiply_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i85:                                        ; preds = %bb1.i.i84
  %4767 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4761) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id34custom_multiply_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i84, %bb5.i82
  %results.162 = phi %struct.one_result* [ %4765, %bb1.i.i84 ], [ %results.161, %bb5.i82 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.162 = phi i32 [ %4761, %bb1.i.i84 ], [ %allocated_results.161, %bb5.i82 ] ; <i32> [#uses=3]
  %4768 = phi %struct.one_result* [ %4765, %bb1.i.i84 ], [ %results.161, %bb5.i82 ] ; <%struct.one_result*> [#uses=2]
  %4769 = getelementptr inbounds %struct.one_result* %4768, i32 163, i32 0 ; <double*> [#uses=1]
  store double %4759, double* %4769, align 4
  %4770 = getelementptr inbounds %struct.one_result* %4768, i32 163, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([37 x i8]* @.str175, i32 0, i32 0), i8** %4770, align 4
  %4771 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i59, label %bb5.i63

bb1.i52:                                          ; preds = %bb2.preheader.i62, %bb1.i52
  %result.03.i48 = phi double [ 0.000000e+00, %bb2.preheader.i62 ], [ %4774, %bb1.i52 ] ; <double> [#uses=1]
  %n.02.i49 = phi i32 [ 0, %bb2.preheader.i62 ], [ %4775, %bb1.i52 ] ; <i32> [#uses=2]
  %scevgep.i50 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i49 ; <double*> [#uses=1]
  %4772 = load double* %scevgep.i50, align 8      ; <double> [#uses=1]
  %4773 = fdiv double %4772, %temp.0              ; <double> [#uses=1]
  %4774 = fadd double %4773, %result.03.i48       ; <double> [#uses=4]
  %4775 = add nsw i32 %n.02.i49, 1                ; <i32> [#uses=2]
  %exitcond.i51 = icmp eq i32 %4775, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i51, label %bb3.i54, label %bb1.i52

bb3.i54:                                          ; preds = %bb1.i52
  %4776 = fsub double %4774, %4785                ; <double> [#uses=2]
  %4777 = tail call double @fabs(double %4774) nounwind readnone ; <double> [#uses=1]
  %4778 = fcmp ogt double %4777, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4778, label %bb.i.i.i55, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i57

bb.i.i.i55:                                       ; preds = %bb3.i54
  %4779 = fdiv double %4776, %4774                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i57

_Z15tolerance_equalIdEbRT_S1_.exit.i.i57:         ; preds = %bb.i.i.i55, %bb3.i54
  %reldiff.0.i.i.i56 = phi double [ %4779, %bb.i.i.i55 ], [ %4776, %bb3.i54 ] ; <double> [#uses=1]
  %4780 = tail call double @fabs(double %reldiff.0.i.i.i56) nounwind readnone ; <double> [#uses=1]
  %4781 = fcmp olt double %4780, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4781, label %_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i, label %bb.i1.i58

bb.i1.i58:                                        ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i57
  %4782 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 164) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i

_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i: ; preds = %bb.i1.i58, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i57
  %4783 = icmp slt i32 %tmp.i61, %iterations.0    ; <i1> [#uses=1]
  br i1 %4783, label %bb2.preheader.i62, label %bb5.i63

bb.nph6.i59:                                      ; preds = %_Z14test_variable4Id34custom_multiply_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4784 = fdiv double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4785 = fmul double %4784, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i62

bb2.preheader.i62:                                ; preds = %bb.nph6.i59, %_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i
  %i.05.i60 = phi i32 [ 0, %bb.nph6.i59 ], [ %tmp.i61, %_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i61 = add i32 %i.05.i60, 1                 ; <i32> [#uses=2]
  br label %bb1.i52

bb5.i63:                                          ; preds = %_Z26check_shifted_variable_sumId22custom_divide_variableIdEEvT_S2_.exit.i, %_Z14test_variable4Id34custom_multiply_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4786 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4787 = sub i32 %4786, %4771                    ; <i32> [#uses=1]
  %4788 = sitofp i32 %4787 to double              ; <double> [#uses=1]
  %4789 = fdiv double %4788, 1.000000e+06         ; <double> [#uses=1]
  %.not3052 = icmp ne %struct.one_result* %results.162, null ; <i1> [#uses=1]
  %4790 = icmp sgt i32 %allocated_results.162, 164 ; <i1> [#uses=1]
  %or.cond3053 = and i1 %4790, %.not3052          ; <i1> [#uses=1]
  br i1 %or.cond3053, label %_Z14test_variable1Id22custom_divide_variableIdEEvPT_iS2_PKc.exit, label %bb1.i.i65

bb1.i.i65:                                        ; preds = %bb5.i63
  %4791 = add nsw i32 %allocated_results.162, 10  ; <i32> [#uses=3]
  %4792 = mul i32 %4791, 12                       ; <i32> [#uses=1]
  %4793 = bitcast %struct.one_result* %results.162 to i8* ; <i8*> [#uses=1]
  %4794 = tail call i8* @realloc(i8* %4793, i32 %4792) nounwind ; <i8*> [#uses=2]
  %4795 = bitcast i8* %4794 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4796 = icmp eq i8* %4794, null                 ; <i1> [#uses=1]
  br i1 %4796, label %bb2.i.i66, label %_Z14test_variable1Id22custom_divide_variableIdEEvPT_iS2_PKc.exit

bb2.i.i66:                                        ; preds = %bb1.i.i65
  %4797 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4791) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable1Id22custom_divide_variableIdEEvPT_iS2_PKc.exit: ; preds = %bb1.i.i65, %bb5.i63
  %results.163 = phi %struct.one_result* [ %4795, %bb1.i.i65 ], [ %results.162, %bb5.i63 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.163 = phi i32 [ %4791, %bb1.i.i65 ], [ %allocated_results.162, %bb5.i63 ] ; <i32> [#uses=3]
  %4798 = phi %struct.one_result* [ %4795, %bb1.i.i65 ], [ %results.162, %bb5.i63 ] ; <%struct.one_result*> [#uses=2]
  %4799 = getelementptr inbounds %struct.one_result* %4798, i32 164, i32 0 ; <double*> [#uses=1]
  store double %4789, double* %4799, align 4
  %4800 = getelementptr inbounds %struct.one_result* %4798, i32 164, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([23 x i8]* @.str176, i32 0, i32 0), i8** %4800, align 4
  %4801 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i40, label %bb5.i44

bb1.i33:                                          ; preds = %bb2.preheader.i43, %bb1.i33
  %result.03.i29 = phi double [ 0.000000e+00, %bb2.preheader.i43 ], [ %4807, %bb1.i33 ] ; <double> [#uses=1]
  %n.02.i30 = phi i32 [ 0, %bb2.preheader.i43 ], [ %4808, %bb1.i33 ] ; <i32> [#uses=2]
  %scevgep.i31 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i30 ; <double*> [#uses=1]
  %4802 = load double* %scevgep.i31, align 8      ; <double> [#uses=1]
  %4803 = fdiv double %4802, %temp.0              ; <double> [#uses=1]
  %4804 = fdiv double %4803, %4505                ; <double> [#uses=1]
  %4805 = fdiv double %4804, %4506                ; <double> [#uses=1]
  %4806 = fdiv double %4805, %4508                ; <double> [#uses=1]
  %4807 = fadd double %4806, %result.03.i29       ; <double> [#uses=4]
  %4808 = add nsw i32 %n.02.i30, 1                ; <i32> [#uses=2]
  %exitcond.i32 = icmp eq i32 %4808, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i32, label %bb3.i35, label %bb1.i33

bb3.i35:                                          ; preds = %bb1.i33
  %4809 = fsub double %4807, %4821                ; <double> [#uses=2]
  %4810 = tail call double @fabs(double %4807) nounwind readnone ; <double> [#uses=1]
  %4811 = fcmp ogt double %4810, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4811, label %bb.i.i.i36, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i38

bb.i.i.i36:                                       ; preds = %bb3.i35
  %4812 = fdiv double %4809, %4807                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i38

_Z15tolerance_equalIdEbRT_S1_.exit.i.i38:         ; preds = %bb.i.i.i36, %bb3.i35
  %reldiff.0.i.i.i37 = phi double [ %4812, %bb.i.i.i36 ], [ %4809, %bb3.i35 ] ; <double> [#uses=1]
  %4813 = tail call double @fabs(double %reldiff.0.i.i.i37) nounwind readnone ; <double> [#uses=1]
  %4814 = fcmp olt double %4813, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4814, label %_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i39

bb.i1.i39:                                        ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i38
  %4815 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 165) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i39, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i38
  %4816 = icmp slt i32 %tmp.i42, %iterations.0    ; <i1> [#uses=1]
  br i1 %4816, label %bb2.preheader.i43, label %bb5.i44

bb.nph6.i40:                                      ; preds = %_Z14test_variable1Id22custom_divide_variableIdEEvPT_iS2_PKc.exit
  %4817 = fdiv double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4818 = fdiv double %4817, %4505                ; <double> [#uses=1]
  %4819 = fdiv double %4818, %4506                ; <double> [#uses=1]
  %4820 = fdiv double %4819, %4508                ; <double> [#uses=1]
  %4821 = fmul double %4820, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i43

bb2.preheader.i43:                                ; preds = %bb.nph6.i40, %_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i41 = phi i32 [ 0, %bb.nph6.i40 ], [ %tmp.i42, %_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i42 = add i32 %i.05.i41, 1                 ; <i32> [#uses=2]
  br label %bb1.i33

bb5.i44:                                          ; preds = %_Z26check_shifted_variable_sumId31custom_divide_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable1Id22custom_divide_variableIdEEvPT_iS2_PKc.exit
  %4822 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4823 = sub i32 %4822, %4801                    ; <i32> [#uses=1]
  %4824 = sitofp i32 %4823 to double              ; <double> [#uses=1]
  %4825 = fdiv double %4824, 1.000000e+06         ; <double> [#uses=1]
  %.not3054 = icmp ne %struct.one_result* %results.163, null ; <i1> [#uses=1]
  %4826 = icmp sgt i32 %allocated_results.163, 165 ; <i1> [#uses=1]
  %or.cond3055 = and i1 %4826, %.not3054          ; <i1> [#uses=1]
  br i1 %or.cond3055, label %_Z14test_variable4Id31custom_divide_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i46

bb1.i.i46:                                        ; preds = %bb5.i44
  %4827 = add nsw i32 %allocated_results.163, 10  ; <i32> [#uses=3]
  %4828 = mul i32 %4827, 12                       ; <i32> [#uses=1]
  %4829 = bitcast %struct.one_result* %results.163 to i8* ; <i8*> [#uses=1]
  %4830 = tail call i8* @realloc(i8* %4829, i32 %4828) nounwind ; <i8*> [#uses=2]
  %4831 = bitcast i8* %4830 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4832 = icmp eq i8* %4830, null                 ; <i1> [#uses=1]
  br i1 %4832, label %bb2.i.i47, label %_Z14test_variable4Id31custom_divide_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i47:                                        ; preds = %bb1.i.i46
  %4833 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4827) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id31custom_divide_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i46, %bb5.i44
  %results.164 = phi %struct.one_result* [ %4831, %bb1.i.i46 ], [ %results.163, %bb5.i44 ] ; <%struct.one_result*> [#uses=4]
  %allocated_results.164 = phi i32 [ %4827, %bb1.i.i46 ], [ %allocated_results.163, %bb5.i44 ] ; <i32> [#uses=3]
  %4834 = phi %struct.one_result* [ %4831, %bb1.i.i46 ], [ %results.163, %bb5.i44 ] ; <%struct.one_result*> [#uses=2]
  %4835 = getelementptr inbounds %struct.one_result* %4834, i32 165, i32 0 ; <double*> [#uses=1]
  store double %4825, double* %4835, align 4
  %4836 = getelementptr inbounds %struct.one_result* %4834, i32 165, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([33 x i8]* @.str177, i32 0, i32 0), i8** %4836, align 4
  %4837 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i21, label %bb5.i25

bb1.i14:                                          ; preds = %bb2.preheader.i24, %bb1.i14
  %result.03.i10 = phi double [ 0.000000e+00, %bb2.preheader.i24 ], [ %4840, %bb1.i14 ] ; <double> [#uses=1]
  %n.02.i11 = phi i32 [ 0, %bb2.preheader.i24 ], [ %4841, %bb1.i14 ] ; <i32> [#uses=2]
  %scevgep.i12 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i11 ; <double*> [#uses=1]
  %4838 = load double* %scevgep.i12, align 8      ; <double> [#uses=1]
  %4839 = fadd double %4852, %4838                ; <double> [#uses=1]
  %4840 = fadd double %4839, %result.03.i10       ; <double> [#uses=4]
  %4841 = add nsw i32 %n.02.i11, 1                ; <i32> [#uses=2]
  %exitcond.i13 = icmp eq i32 %4841, 8000         ; <i1> [#uses=1]
  br i1 %exitcond.i13, label %bb3.i16, label %bb1.i14

bb3.i16:                                          ; preds = %bb1.i14
  %4842 = fsub double %4840, %4854                ; <double> [#uses=2]
  %4843 = tail call double @fabs(double %4840) nounwind readnone ; <double> [#uses=1]
  %4844 = fcmp ogt double %4843, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4844, label %bb.i.i.i17, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i19

bb.i.i.i17:                                       ; preds = %bb3.i16
  %4845 = fdiv double %4842, %4840                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i19

_Z15tolerance_equalIdEbRT_S1_.exit.i.i19:         ; preds = %bb.i.i.i17, %bb3.i16
  %reldiff.0.i.i.i18 = phi double [ %4845, %bb.i.i.i17 ], [ %4842, %bb3.i16 ] ; <double> [#uses=1]
  %4846 = tail call double @fabs(double %reldiff.0.i.i.i18) nounwind readnone ; <double> [#uses=1]
  %4847 = fcmp olt double %4846, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4847, label %_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i20

bb.i1.i20:                                        ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i19
  %4848 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 166) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i20, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i19
  %4849 = icmp slt i32 %tmp.i23, %iterations.0    ; <i1> [#uses=1]
  br i1 %4849, label %bb2.preheader.i24, label %bb5.i25

bb.nph6.i21:                                      ; preds = %_Z14test_variable4Id31custom_divide_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4850 = fdiv double %temp.0, %4505              ; <double> [#uses=1]
  %4851 = fdiv double %4850, %4506                ; <double> [#uses=1]
  %4852 = fdiv double %4851, %4508                ; <double> [#uses=2]
  %4853 = fadd double %4852, %init_value.0        ; <double> [#uses=1]
  %4854 = fmul double %4853, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i24

bb2.preheader.i24:                                ; preds = %bb.nph6.i21, %_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i22 = phi i32 [ 0, %bb.nph6.i21 ], [ %tmp.i23, %_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i23 = add i32 %i.05.i22, 1                 ; <i32> [#uses=2]
  br label %bb1.i14

bb5.i25:                                          ; preds = %_Z26check_shifted_variable_sumId32custom_divide_multiple_variable2IdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4Id31custom_divide_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4855 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4856 = sub i32 %4855, %4837                    ; <i32> [#uses=1]
  %4857 = sitofp i32 %4856 to double              ; <double> [#uses=1]
  %4858 = fdiv double %4857, 1.000000e+06         ; <double> [#uses=1]
  %.not3056 = icmp ne %struct.one_result* %results.164, null ; <i1> [#uses=1]
  %4859 = icmp sgt i32 %allocated_results.164, 166 ; <i1> [#uses=1]
  %or.cond3057 = and i1 %4859, %.not3056          ; <i1> [#uses=1]
  br i1 %or.cond3057, label %_Z14test_variable4Id32custom_divide_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i27

bb1.i.i27:                                        ; preds = %bb5.i25
  %4860 = add nsw i32 %allocated_results.164, 10  ; <i32> [#uses=3]
  %4861 = mul i32 %4860, 12                       ; <i32> [#uses=1]
  %4862 = bitcast %struct.one_result* %results.164 to i8* ; <i8*> [#uses=1]
  %4863 = tail call i8* @realloc(i8* %4862, i32 %4861) nounwind ; <i8*> [#uses=2]
  %4864 = bitcast i8* %4863 to %struct.one_result* ; <%struct.one_result*> [#uses=2]
  %4865 = icmp eq i8* %4863, null                 ; <i1> [#uses=1]
  br i1 %4865, label %bb2.i.i28, label %_Z14test_variable4Id32custom_divide_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i28:                                        ; preds = %bb1.i.i27
  %4866 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4860) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id32custom_divide_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i27, %bb5.i25
  %results.165 = phi %struct.one_result* [ %4864, %bb1.i.i27 ], [ %results.164, %bb5.i25 ] ; <%struct.one_result*> [#uses=3]
  %allocated_results.165 = phi i32 [ %4860, %bb1.i.i27 ], [ %allocated_results.164, %bb5.i25 ] ; <i32> [#uses=2]
  %4867 = phi %struct.one_result* [ %4864, %bb1.i.i27 ], [ %results.164, %bb5.i25 ] ; <%struct.one_result*> [#uses=2]
  %4868 = getelementptr inbounds %struct.one_result* %4867, i32 166, i32 0 ; <double*> [#uses=1]
  store double %4858, double* %4868, align 4
  %4869 = getelementptr inbounds %struct.one_result* %4867, i32 166, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([34 x i8]* @.str178, i32 0, i32 0), i8** %4869, align 4
  %4870 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  br i1 %22, label %bb.nph6.i4, label %bb5.i6

bb1.i:                                            ; preds = %bb2.preheader.i, %bb1.i
  %result.03.i = phi double [ 0.000000e+00, %bb2.preheader.i ], [ %4874, %bb1.i ] ; <double> [#uses=1]
  %n.02.i = phi i32 [ 0, %bb2.preheader.i ], [ %4875, %bb1.i ] ; <i32> [#uses=2]
  %scevgep.i2 = getelementptr [8000 x double]* @dataDouble, i32 0, i32 %n.02.i ; <double*> [#uses=1]
  %4871 = load double* %scevgep.i2, align 8       ; <double> [#uses=1]
  %4872 = fadd double %4871, %temp.0              ; <double> [#uses=1]
  %4873 = fsub double %4872, %4885                ; <double> [#uses=1]
  %4874 = fadd double %4873, %result.03.i         ; <double> [#uses=4]
  %4875 = add nsw i32 %n.02.i, 1                  ; <i32> [#uses=2]
  %exitcond.i3 = icmp eq i32 %4875, 8000          ; <i1> [#uses=1]
  br i1 %exitcond.i3, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %bb1.i
  %4876 = fsub double %4874, %4888                ; <double> [#uses=2]
  %4877 = tail call double @fabs(double %4874) nounwind readnone ; <double> [#uses=1]
  %4878 = fcmp ogt double %4877, 1.000000e-08     ; <i1> [#uses=1]
  br i1 %4878, label %bb.i.i.i, label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i

bb.i.i.i:                                         ; preds = %bb3.i
  %4879 = fdiv double %4876, %4874                ; <double> [#uses=1]
  br label %_Z15tolerance_equalIdEbRT_S1_.exit.i.i

_Z15tolerance_equalIdEbRT_S1_.exit.i.i:           ; preds = %bb.i.i.i, %bb3.i
  %reldiff.0.i.i.i = phi double [ %4879, %bb.i.i.i ], [ %4876, %bb3.i ] ; <double> [#uses=1]
  %4880 = tail call double @fabs(double %reldiff.0.i.i.i) nounwind readnone ; <double> [#uses=1]
  %4881 = fcmp olt double %4880, 1.000000e-06     ; <i1> [#uses=1]
  br i1 %4881, label %_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, label %bb.i1.i

bb.i1.i:                                          ; preds = %_Z15tolerance_equalIdEbRT_S1_.exit.i.i
  %4882 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 167) nounwind ; <i32> [#uses=0]
  br label %_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i

_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i: ; preds = %bb.i1.i, %_Z15tolerance_equalIdEbRT_S1_.exit.i.i
  %4883 = icmp slt i32 %tmp.i5, %iterations.0     ; <i1> [#uses=1]
  br i1 %4883, label %bb2.preheader.i, label %bb5.i6

bb.nph6.i4:                                       ; preds = %_Z14test_variable4Id32custom_divide_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4884 = fmul double %4505, %4506                ; <double> [#uses=1]
  %4885 = fdiv double %4884, %4508                ; <double> [#uses=2]
  %4886 = fadd double %init_value.0, %temp.0      ; <double> [#uses=1]
  %4887 = fsub double %4886, %4885                ; <double> [#uses=1]
  %4888 = fmul double %4887, 8.000000e+03         ; <double> [#uses=1]
  br label %bb2.preheader.i

bb2.preheader.i:                                  ; preds = %bb.nph6.i4, %_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i
  %i.05.i = phi i32 [ 0, %bb.nph6.i4 ], [ %tmp.i5, %_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i ] ; <i32> [#uses=1]
  %tmp.i5 = add i32 %i.05.i, 1                    ; <i32> [#uses=2]
  br label %bb1.i

bb5.i6:                                           ; preds = %_Z26check_shifted_variable_sumId30custom_mixed_multiple_variableIdEEvT_S2_S2_S2_S2_.exit.i, %_Z14test_variable4Id32custom_divide_multiple_variable2IdEEvPT_iS2_S2_S2_S2_PKc.exit
  %4889 = tail call i32 @clock() nounwind         ; <i32> [#uses=1]
  %4890 = sub i32 %4889, %4870                    ; <i32> [#uses=1]
  %4891 = sitofp i32 %4890 to double              ; <double> [#uses=1]
  %4892 = fdiv double %4891, 1.000000e+06         ; <double> [#uses=1]
  %.not3058 = icmp ne %struct.one_result* %results.165, null ; <i1> [#uses=1]
  %4893 = icmp sgt i32 %allocated_results.165, 167 ; <i1> [#uses=1]
  %or.cond3059 = and i1 %4893, %.not3058          ; <i1> [#uses=1]
  br i1 %or.cond3059, label %_Z14test_variable4Id30custom_mixed_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit, label %bb1.i.i8

bb1.i.i8:                                         ; preds = %bb5.i6
  %4894 = add nsw i32 %allocated_results.165, 10  ; <i32> [#uses=2]
  %4895 = mul i32 %4894, 12                       ; <i32> [#uses=1]
  %4896 = bitcast %struct.one_result* %results.165 to i8* ; <i8*> [#uses=1]
  %4897 = tail call i8* @realloc(i8* %4896, i32 %4895) nounwind ; <i8*> [#uses=2]
  %4898 = bitcast i8* %4897 to %struct.one_result* ; <%struct.one_result*> [#uses=1]
  %4899 = icmp eq i8* %4897, null                 ; <i1> [#uses=1]
  br i1 %4899, label %bb2.i.i9, label %_Z14test_variable4Id30custom_mixed_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit

bb2.i.i9:                                         ; preds = %bb1.i.i8
  %4900 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %4894) nounwind ; <i32> [#uses=0]
  tail call void @exit(i32 -1) noreturn nounwind
  unreachable

_Z14test_variable4Id30custom_mixed_multiple_variableIdEEvPT_iS2_S2_S2_S2_PKc.exit: ; preds = %bb1.i.i8, %bb5.i6
  %4901 = phi %struct.one_result* [ %4898, %bb1.i.i8 ], [ %results.165, %bb5.i6 ] ; <%struct.one_result*> [#uses=2]
  %4902 = getelementptr inbounds %struct.one_result* %4901, i32 167, i32 0 ; <double*> [#uses=1]
  store double %4892, double* %4902, align 4
  %4903 = getelementptr inbounds %struct.one_result* %4901, i32 167, i32 1 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([31 x i8]* @.str179, i32 0, i32 0), i8** %4903, align 4
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare double @atof(i8* nocapture) nounwind readonly
