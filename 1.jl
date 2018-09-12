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

@testset "day1_part1" begin
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

day1_part2 = function(x)
    str = ""
    for c in x
        str *= string(c)
        if -1 == day1_part1(str)
            break
        end
    end
    return length(str)
end

@testset "day1_part2" begin
    @test 1 == day1_part2(")")
    @test 5 == day1_part2("()())")
end

println("""Day 1, Part 1: $(day1_part1(read("1.txt",String)))""")
println("""Day 1, Part 2: $(day1_part2(read("1.txt",String)))""")
