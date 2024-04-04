varying mediump vec2 var_texcoord0;
varying highp vec4 var_position;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform lowp vec4 hp_base_col;
uniform lowp vec4 hp_bar_col;
uniform mediump vec4 health;
uniform mediump vec4 bar_pos;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);

    if (var_position.x > (bar_pos.x + health.x))
    {   // Color of HP lost
        gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * hp_base_col * tint_pm;
    }
    else
    {   // Color of HP remaining
        gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * hp_bar_col * tint_pm;
    }

        
}
