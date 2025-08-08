# FIR Bandpass Filter Design

This project outlines the steps for designing a Finite Impulse Response (FIR) bandpass filter.

---

## 1. Filter Specifications 📋

The following specifications are used for the filter design[^1][^2]:

- **Sampling Frequency**: $F_s = 10\,\text{kHz}$
- **Passband Edges**: $F_{p1} = 1.5\,\text{kHz}$, $F_{p2} = 3\,\text{kHz}$
- **Stopband Edges**: $F_{s1} = 1.2\,\text{kHz}$, $F_{s2} = 3.3\,\text{kHz}$
- **Passband Ripple**: $A_p = 0.1\,\text{dB}$
- **Stopband Attenuation**: $A_s = 50\,\text{dB}$

---

## 2. Normalize Frequencies 🔄

Frequencies are normalized with respect to the Nyquist frequency:  
$F_N = \frac{F_s}{2} = 5000\,\text{Hz}$

\[
\begin{aligned}
W_{p1} &= \frac{F_{p1}}{F_N} = \frac{1500}{5000} = 0.3 \\
W_{p2} &= \frac{F_{p2}}{F_N} = \frac{3000}{5000} = 0.6 \\
W_{s1} &= \frac{F_{s1}}{F_N} = \frac{1200}{5000} = 0.24 \\
W_{s2} &= \frac{F_{s2}}{F_N} = \frac{3300}{5000} = 0.66 \\
\end{aligned}
\]

---

## 3. Transition Band 📐

\[
\Delta W = \min(W_{p1} - W_{s1}, W_{s2} - W_{p2}) = \min(0.3 - 0.24, 0.66 - 0.6) = 0.06
\]

---

## 4. Ripple Tolerances 🌊

\[
\delta_p = \frac{10^{0.05 A_p} - 1}{10^{0.05 A_p} + 1} = \frac{10^{0.005} - 1}{10^{0.005} + 1} \approx 0.00576
\]

\[
\delta_a = 10^{-A_s / 20} = 10^{-50/20} = 0.00316
\]

\[
\delta = \min(\delta_p, \delta_a) = \min(0.00576, 0.00316) = 0.00316
\]

---

## 5. Attenuation $A$ 📉

\[
A = -20 \log_{10}(\delta) = -20 \log_{10}(0.00316) \approx 50\,\text{dB}
\]

---

## 6. Kaiser Window Parameters 🪟

### Beta ($\beta$)

\[
\beta = 0.5842 (A - 21)^{0.4} + 0.07886 (A - 21)
\]

\[
\beta = 0.5842 (29)^{0.4} + 0.07886 (29) \approx 4.533
\]

### Filter Order ($N$)

\[
D = \frac{A - 7.95}{14.36} = \frac{50 - 7.95}{14.36} \approx 2.934
\]

\[
N = \left\lceil \frac{F_s \cdot D}{\Delta W \cdot F_s} \right\rceil = \left\lceil \frac{10000 \cdot 2.934}{0.06 \cdot 10000} \right\rceil = \lceil 49 \rceil = 49
\]

---

## 7. Design the Filter 🛠️

### 7.1 Ideal Bandpass Impulse Response

\[
h_d[n] =
\begin{cases}
\frac{1}{\pi n} \left[ \sin(w_{c2} n) - \sin(w_{c1} n) \right], & n \neq 0 \\
\frac{w_{c2} - w_{c1}}{\pi}, & n = 0
\end{cases}
\]

Where:
- $w_{c1} = 0.3\pi$
- $w_{c2} = 0.6\pi$

### 7.2 Kaiser Window

\[
w[n] = \frac{I_0\left(\beta \sqrt{1 - \left( \frac{2n}{N - 1} \right)^2}\right)}{I_0(\beta)}
\]

Where $I_0$ is the modified Bessel function of the first kind.

### 7.3 Filter Coefficients

\[
h[n] = h_d[n] \cdot w[n]
\]

---

## 8. Frequency Response 📈

\[
H(e^{j\omega}) = \sum_{n=0}^{N-1} h[n] \cdot e^{-j\omega n}
\]

---

## 9. Filter Formula & Coefficients 🔢

\[
h[n] =
\begin{cases}
\frac{1}{\pi n} \left[ \sin(0.6\pi n) - \sin(0.3\pi n) \right], & n \neq 0 \\
\frac{1}{\pi}(0.6\pi - 0.3\pi) = 0.3, & n = 0
\end{cases}
\]

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

## 10. Final Transfer Function $H(z)$ 💻

\[
H(z) = 0.3000 + 0.0183(z^{-1} + z^{1}) - 0.0272(z^{-2} + z^{2}) - 0.0306(z^{-3} + z^{3}) + \dots
\]

---

[^1]: Oppenheim, Schafer – Digital Signal Processing
[^2]: Proakis, Manolakis – Digital Signal Processing
[^3]: Matlab Documentation
[^4]: MIT OpenCourseWare
[^5]: Texas Instruments – FIR Filter Design
[^6]: IEEE DSP Papers
