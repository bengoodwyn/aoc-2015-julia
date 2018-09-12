using Test

new_floor = function(direction, x)
    if direction == '('
        return x+1
    elseif direction == ')'
        return x-1
    else
        return x
    end
end

day1_part1 = function(x)
    floor = 0
    for c in x
        floor = new_floor(c, floor)
    end
    return floor
end

@testset "day1" begin
    @test 0 == day1_part1("")
    @test 1 == day1_part1("(")
    @test 2 == day1_part1("((")
    @test 1 == day1_part1("(()")
    @test 0 == day1_part1("(())")
    @test 0 == day1_part1("()()")
    @test 3 == day1_part1("(((")
    @test 3 == day1_part1("(()(()(")
    @test 3 == day1_part1("))(((((")
    @test -1 == day1_part1("())")
    @test -1 == day1_part1("))(")
    @test -3 == day1_part1(")))")
    @test -3 == day1_part1(")())())")
    @test 0 == day1_part1("()\n")
end

println("""Day 1, Part 1: $(day1_part1(read("1.txt",String)))""")
