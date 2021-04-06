module ramp


function run()
    theta = 0
    step = .01
    g = -9.81
    s0 = (x=0, y=0.8)
    target = .45
    threshold = 1e-4

    a = g/2
    c = s0.y

    while theta < 90
        v0 = (x=1.2cos(deg2rad(theta)), y=-1.2sin(deg2rad(theta)))
        b = v0.y
        discr = b^2-4a*c
        
        if discr >= 0
            t1 = (-b + sqrt(discr)) / (2a)
            t2 = (-b - sqrt(discr)) / (2a)
            s_x_1 = v0.x*t1
            s_x_2 = v0.x*t2

            if abs(s_x_1 - target) < threshold
                theta = round(theta, sigdigits=4)
                s_x_1 = round(s_x_1, sigdigits=3)
                println("Success:\n  Theta: $theta deg\n  Distance: $s_x_1 m")
                break
            elseif abs(s_x_2 - target) < threshold
                theta = round(theta, sigdigits=4)
                s_x_2 = round(s_x_2, sigdigits=3)
                println("Success:\n  Theta: $theta deg\n  Distance: $s_x_2 m")
                break
            end
        end


        theta += step
    end
end

run()

end # module
