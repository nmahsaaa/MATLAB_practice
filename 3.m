function output = add_echo(audio_in,fs,delay,amp)
samples = round(fs*delay);
ds = floor(samples);
signal = zeros(length(audio_in)+ds,1);
signal(1:length(audio_in))=audio_in;
echo_signal =zeros(length(audio_in)+ds,1);
echo_signal(ds+(1:length(audio_in*amp)))=audio_in*amp;
output= signal + echo_signal;
p= max(abs(output)); 
 if p>1 
     output=output ./ p; 
     else 
output = output;
 end
end 
