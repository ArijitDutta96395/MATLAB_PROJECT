# FIR Bandpass Filter Design

This project outlines all the steps for designing a Finite Impulse Response (FIR) bandpass filter.

---

## 1. Filter Specifications 📋

- Sampling Frequency: Fs = 10,000 Hz
- Passband Edges: Fp1 = 1,500 Hz, Fp2 = 3,000 Hz
- Stopband Edges: Fs1 = 1,200 Hz, Fs2 = 3,300 Hz
- Passband Ripple: Ap = 0.1 dB
- Stopband Attenuation: As = 50 dB

---
## 🎯 Project Previews

<table>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ArijitDutta96395/MATLAB_PROJECT/master/pic1.png" alt="Project 1" width="200" style="border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.2);" />
      <br/><br/>
      <b>Frequency Response</b>
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ArijitDutta96395/MATLAB_PROJECT/master/pic2.png" alt="Project 2" width="200" style="border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.2);" />
      <br/><br/>
      <b>Impulse Response</b>
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ArijitDutta96395/MATLAB_PROJECT/master/pic3.png" alt="Project 3" width="200" style="border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.2);" />
      <br/><br/>
      <b>Filter Coefficients</b>
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ArijitDutta96395/MATLAB_PROJECT/master/pic4.png" alt="Project 4" width="200" style="border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.2);" />
      <br/><br/>
      <b>Window Function</b>
    </td>
  </tr>
</table>

## 2. Normalize Frequencies 🔄

- Nyquist Frequency (half the sampling rate): 5,000 Hz
- Normalized Passband Edge 1: 1,500 / 5,000 = 0.3
- Normalized Passband Edge 2: 3,000 / 5,000 = 0.6
- Normalized Stopband Edge 1: 1,200 / 5,000 = 0.24
- Normalized Stopband Edge 2: 3,300 / 5,000 = 0.66

---

## 3. Transition Band 📐

- Calculate transition band Delta W:
  - 0.3 minus 0.24 = 0.06
  - 0.66 minus 0.6 = 0.06
  - Use the smaller value: Delta W = 0.06

---

## 4. Ripple Tolerances 🌊

- Passband ripple tolerance (delta_p):
  - (10 to the power of (0.05 times Ap) minus 1) divided by (10 to the power of (0.05 times Ap) plus 1)
  - With Ap = 0.1: Result is approximately 0.00576

- Stopband attenuation tolerance (delta_a):
  - 10 to the power of (-As divided by 20)
  - With As = 50: Result is approximately 0.00316

- Final delta is the smaller of delta_p and delta_a: delta = 0.00316

---

## 5. Attenuation 📉

- Attenuation A:
  - Minus 20 times the logarithm base 10 of delta
  - With delta = 0.00316: A ≈ 50 dB

---

## 6. Kaiser Window Parameters 🪟

- Beta:
  - 0.5842 times (A minus 21) to the power 0.4
  - Add 0.07886 times (A minus 21)
  - For A = 50: Beta ≈ 4.533

- D:
  - (A minus 7.95) divided by 14.36
  - For A = 50: D ≈ 2.934

- Filter order N:
  - Multiply Fs times D, then divide by (Delta W times Fs)
  - For D = 2.934, Delta W = 0.06, Fs = 10,000 Hz:
  - N = ceiling of (2.934 / 0.06) = ceiling of 48.9 = 49

---

## 7. Design the Filter 🛠️

- Ideal bandpass impulse response (hd[n]):
  - For n not zero: (1 divided by pi times n) times (sine of (0.6 times pi times n) minus sine of (0.3 times pi times n))
  - For n = 0: (0.6 times pi minus 0.3 times pi) divided by pi = 0.3

- Kaiser window (w[n]):
  - Use the I0 Bessel function evaluated at beta times square root of (1 minus (2 times n divided by (N minus 1)) squared)
  - Divide by I0 evaluated at beta

- Filter coefficients (h[n]):
  - Multiply hd[n] and w[n] for each n

---

## 8. Frequency Response 📈

- The filter’s frequency response H is the sum of h[n] times exponentials, from n = 0 to N-1

---

## 9. Filter Coefficients Table 🔢

| n  | h[n]     |
|----|----------|
| 0  | 0.3000   |
| 1  | 0.0183   |
| 2  | -0.0272  |
| 3  | -0.0306  |
| 4  | 0.0106   |
| 5  | 0.0468   |
| …  | …        |
| 24 | 0.0000   |

---

## 10. Final Transfer Function 💻

- H(z) is a sum of coefficients h[n] times powers of z (both negative and positive):  
  H(z) = 0.3000 + 0.0183(z^-1 + z^1) - 0.0272(z^-2 + z^2) - 0.0306(z^-3 + z^3) + ...

---

## References

1. Oppenheim, Schafer – Digital Signal Processing  
2. Proakis, Manolakis – Digital Signal Processing  
3. Matlab Documentation  
4. MIT OpenCourseWare  
5. Texas Instruments – FIR Filter Design  
6. IEEE DSP Papers  
