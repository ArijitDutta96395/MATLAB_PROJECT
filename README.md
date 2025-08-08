# FIR Bandpass Filter Design

This project outlines the steps for designing a Finite Impulse Response (FIR) bandpass filter.

## 1. Filter Specifications 📋

[cite_start]The following specifications are used for the filter design[cite: 1, 2]:
* **Sampling Frequency ($F_s$)**: 10 kHz
* **Passband Edges ($F_{p1}$, $F_{p2}$)**: 1.5 kHz, 3 kHz
* **Stopband Edges ($F_{s1}$, $F_{s2}$)**: 1.2 kHz, 3.3 kHz
* **Passband Ripple ($A_p$)**: 0.1 dB
* **Stopband Attenuation ($A_s$)**: 50 dB

---

## 2. Normalize Frequencies 🔄

[cite_start]The frequencies are normalized with respect to the Nyquist frequency ($F_N = F_s / 2$)[cite: 1, 2].

The Nyquist frequency is $F_N = 10 \text{ kHz} / 2 = 5000 \text{ Hz}$.

* Passband edge 1:
    [cite_start]$W_{p1} = \frac{F_{p1}}{F_N} = \frac{1500}{5000} = 0.3$ [cite: 1, 2]
* Passband edge 2:
    [cite_start]$W_{p2} = \frac{F_{p2}}{F_N} = \frac{3000}{5000} = 0.6$ [cite: 1, 2]
* Stopband edge 1:
    [cite_start]$W_{s1} = \frac{F_{s1}}{F_N} = \frac{1200}{5000} = 0.24$ [cite: 1, 2]
* Stopband edge 2:
    [cite_start]$W_{s2} = \frac{F_{s2}}{F_N} = \frac{3300}{5000} = 0.66$ [cite: 1, 2]

---

## 3. Transition Band 📐

[cite_start]The transition bandwidth ($\Delta W$) is the smallest difference between the passband and stopband edges[cite: 1, 2].

[cite_start]$\Delta W = \min(W_{p1} - W_{s1}, W_{s2} - W_{p2}) = \min(0.3 - 0.24, 0.66 - 0.6) = 0.06$ [cite: 1, 2]

---

## 4. Choose Ripple Tolerances 🌊

[cite_start]Ripple specifications are converted into tolerances[cite: 1, 2].

* **Passband ripple ($\delta_p$)**:
    [cite_start]$\delta_p = \frac{10^{0.05 \cdot A_p} - 1}{10^{0.05 \cdot A_p} + 1} = \frac{10^{0.05 \cdot 0.1} - 1}{10^{0.05 \cdot 0.1} + 1} = 0.00576$ [cite: 1, 2]
* **Stopband ripple ($\delta_a$)**:
    [cite_start]$\delta_a = 10^{-A_s/20} = 10^{-50/20} = 0.00316$ [cite: 1, 2]

[cite_start]The smallest tolerance ($\delta$) is chosen from these two values[cite: 1, 2]:
[cite_start]$\delta = \min(\delta_p, \delta_a) = \min(0.00576, 0.00316) = 0.00316$ [cite: 1, 2]

---

## 5. Calculate Attenuation ($A$) 📉

[cite_start]The attenuation ($A$) is calculated from the smallest tolerance[cite: 1, 2].

[cite_start]$A = -20 \cdot \log_{10}(\delta) = -20 \cdot \log_{10}(0.00316) \approx 50 \text{ dB}$ [cite: 1, 2]

---

## 6. Calculate Kaiser Window Parameters 🪟

### 6.1 Beta Parameter ($\beta$)

[cite_start]The beta parameter is determined using empirical formulas based on the calculated attenuation ($A$)[cite: 1, 2]. Since $A = 50$, which is between 21 and 50, the formula is:

[cite_start]$\beta = 0.5842 \cdot (A - 21)^{0.4} + 0.07886 \cdot (A - 21)$ [cite: 1, 2]
[cite_start]$\beta = 0.5842 \cdot (50 - 21)^{0.4} + 0.07886 \cdot (50 - 21) = 4.533$ [cite: 1, 2]

### 6.2 Filter Order ($N$)

[cite_start]The filter order is determined using the Kaiser window formula[cite: 1, 2]:

[cite_start]$D = \frac{A - 7.95}{14.36} = \frac{50 - 7.95}{14.36} \approx 2.934$ [cite: 1, 2]

[cite_start]The filter order ($N$) is then calculated as[cite: 1, 2]:

[cite_start]$N = \lceil \frac{F_s \cdot D}{\Delta W} \rceil = \lceil \frac{10000 \cdot 2.934}{0.06 \cdot 10000} \rceil = \lceil 49 \rceil = 49$ [cite: 1, 2]

[cite_start]The filter order must be odd, and since $N = 49$ is odd, it is a valid value[cite: 1, 2].

---

## 7. Design the Filter 🛠️

### 7.1 Ideal Bandpass Filter Response

[cite_start]The ideal impulse response ($h_d[n]$) for a bandpass filter is defined as[cite: 1, 2]:

$h_d[n] = \begin{cases} \frac{1}{\pi n} [\sin(w_{c2}n) - \sin(w_{c1}n)], & n \neq 0 \\ \frac{w_{c2} - w_{c1}}{\pi}, & n = 0 \end{cases}$

[cite_start]where $w_{c1} = W_{p1} \cdot \pi = 0.3\pi$ and $w_{c2} = W_{p2} \cdot \pi = 0.6\pi$[cite: 1, 2].

### 7.2 Apply Kaiser Window

[cite_start]The Kaiser window ($w[n]$) is defined by the formula[cite: 1, 2]:

$w[n] = \frac{I_0(\beta \sqrt{1 - (\frac{2n}{N-1})^2})}{I_0(\beta)}$

[cite_start]where $I_0(x)$ is the modified Bessel function of the first kind[cite: 1, 2].

### 7.3 Final Filter Coefficients

[cite_start]The final filter coefficients ($h[n]$) are obtained by multiplying the ideal impulse response with the Kaiser window[cite: 1, 2]:

[cite_start]$h[n] = h_d[n] \cdot w[n]$ [cite: 1, 2]

---

## 8. Frequency Response 📈

[cite_start]The frequency response of the filter ($H(e^{j\omega})$) is computed using the following formula[cite: 1, 2]:

[cite_start]$H(e^{j\omega}) = \sum_{n=0}^{N-1} h[n] \cdot e^{-j\omega n}$ [cite: 1, 2]

[cite_start]The magnitude response can be plotted to verify the filter's performance[cite: 1, 2].

---

## 9. Filter Design Formula and Coefficients 🔢

[cite_start]The general formula for $h[n]$ is[cite: 3, 4]:

[cite_start]$h[n] = \begin{cases} \frac{1}{\pi n} [\sin(0.6\pi n) - \sin(0.3\pi n)], & n \neq 0 \\ \frac{1}{\pi}(0.6\pi - 0.3\pi), & n = 0 \end{cases}$ [cite: 3, 4]

* For $n = 0$:
    [cite_start]$h[0] = \frac{1}{\pi}(0.6\pi - 0.3\pi) = 0.3$ [cite: 3, 4]
* For $n \neq 0$:
    [cite_start]$h[n] = \frac{1}{\pi n} [\sin(0.6\pi n) - \sin(0.3\pi n)]$ [cite: 3, 4]

[cite_start]The first few coefficients for the filter with $N = 49$ are[cite: 3, 4]:

| n  | h[n] |
|----|------|
| 0  | 0.3000  |
| 1  | 0.0183  |
| 2  | -0.0272 |
| 3  | -0.0306 |
| 4  | 0.0106  |
| 5  | 0.0468  |
| ...| ...    |
| 24 | 0.0000  |

---

## 10. Final Structured Expression of H(z) 💻

[cite_start]The final structured transfer function $H(z)$ is based on the filter coefficients, leveraging the symmetry of the impulse response[cite: 5, 6].

[cite_start]$H(z) = 0.3000 + 0.0183(z^{-1} + z^{1}) - 0.0272(z^{-2} + z^{2}) - 0.0306(z^{-3} + z^{3}) + \dots$ [cite: 5, 6]
